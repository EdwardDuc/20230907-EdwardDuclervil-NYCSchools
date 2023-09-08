//
//  SUIWebView.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import SwiftUI
import WebKit

struct SUIWebView: UIViewRepresentable {
    @State var schoolSite:String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        //Most sites need to be https in order to run. Therefore, we'll add an if statement in order to load websites, either appending 'https://' or adding the 's' to sites that are in the API as 'http://'
        let index = schoolSite.index(schoolSite.startIndex, offsetBy: 5)
        if schoolSite[..<index] == "http:"{
            var secureSite:String = schoolSite
            let sIndex = secureSite.index(secureSite.startIndex, offsetBy: 4)
            secureSite.insert("s", at: sIndex)
            if let url = URL(string: secureSite){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        } else if schoolSite[..<index] == "https" {
            // Examining the Data, I didn't see any instances of websites that contained 'https', but this section should account for future additions. 
            if let url = URL(string: schoolSite){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        } else {
            if let url = URL(string: "https://"+schoolSite){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
    typealias UIViewType = WKWebView
    
  
}

struct SUIWebView_Previews: PreviewProvider {
    static var previews: some View {
        SUIWebView(schoolSite: "https://www.theclintonschool.net/")
    }
}
