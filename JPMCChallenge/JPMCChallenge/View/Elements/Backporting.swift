//
//  Backporting.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/15/23.
//

import Foundation
import SwiftUI


public struct Backport<Content> {
    public let content: Content
    
    public init(_ content: Content) {
        self.content = content
    }
}

extension View {
    var backport: Backport<Self> { Backport(self) }
}

@available(iOS 15.0, *)
extension Backport where Content: View {
    @ViewBuilder func scrollContentBackground(_ visibility: Visibility) -> some View {
        if #available(iOS 16, *) {
            content.scrollContentBackground(visibility)
        } else {
            content
        }
    }
}
