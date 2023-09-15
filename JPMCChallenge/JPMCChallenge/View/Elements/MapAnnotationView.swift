//
//  MapAnnotationView.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/15/23.
//

import SwiftUI

struct MapAnnotationView: View {
    let title:String
    var body: some View {
        VStack{
            Text(title)
                .font(.callout)
                .multilineTextAlignment(.center)
                .frame(width: 250.0)
                .background(Color.clear)
                .cornerRadius(10)
                
            
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            
            Image(systemName: "arrowtriangle.down.fill")
                .foregroundColor(.red)
                .offset(x:0,y: -5)
        }
    }
}

struct MapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(title: "Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title ")
    }
}
