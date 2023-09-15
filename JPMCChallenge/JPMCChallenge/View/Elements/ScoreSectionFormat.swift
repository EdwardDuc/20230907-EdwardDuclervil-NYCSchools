//
//  ScoreSectionFormat.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/8/23.
//

import SwiftUI

struct ScoreSectionFormat: View {
    @State var leftText: String
    @State var rightText: String
    
    var body: some View {
        HStack {
            Text(leftText)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Spacer()
            Text(rightText)
                .fontWeight(.bold)
        }
        .padding([.horizontal])
        .padding(.vertical,5.0)

    }
}
