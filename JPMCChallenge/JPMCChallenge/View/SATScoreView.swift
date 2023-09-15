//
//  SATScoreView.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/8/23.
//

import SwiftUI

struct SATScoreView: View {
    @State var dbn:String
    @StateObject var scoreViewModel = SATViewModel(networkManager: NetworkManager())
    
    var body: some View {
        VStack{
            switch scoreViewModel.viewState{
            case .loadingState:
                ProgressView()
            case .errorState:
                errorStateView()
            case .loadedState:
                loadedStateView()
            case .emptyState:
                emptyStateView()
            }
        }
        .padding(.vertical,80.0)
        .background(Color.init(hex: "EADDFF"))
        .ignoresSafeArea()
        .onAppear{
            scoreViewModel.getScoreDataFromAPI(urlString: APIEndpoint.satScoreEndpoint, dbn: dbn)
        }
        
    }
    
    @ViewBuilder
    func errorStateView() -> some View {
        Text(scoreViewModel.networkBasedErrors?.errorDescription ?? "No Error Description Provided")
    }
    
 
    @ViewBuilder
    func loadedStateView() -> some View {
        // Nil Coalescing should never be reached due to checks within the ViewModel, but just to be safe
        Text(scoreViewModel.satInfo?.schoolName ?? "Nothing").font(.title).fontWeight(.bold).multilineTextAlignment(.center)
        Spacer()
        Text("Average SAT Scores").font(.title2).fontWeight(.bold)
        
        ScoreSectionFormat(leftText: "Number of Test Takers:", rightText: scoreViewModel.satInfo?.numOfSatTestTakers ?? "0")
        Divider()
        ScoreSectionFormat(leftText: "Math:", rightText: scoreViewModel.satInfo?.satMathAvgScore ?? "0")
        ScoreSectionFormat(leftText: "Writing:", rightText: scoreViewModel.satInfo?.satWritingAvgScore ?? "0")
        ScoreSectionFormat(leftText: "Critical Reading:", rightText: scoreViewModel.satInfo?.satCriticalReadingAvgScore ?? "0")
        Spacer()
    }
    
    @ViewBuilder
    func emptyStateView() -> some View {
        Text("This school has no SAT Score Information")
    }
}

struct SATScoreView_Previews: PreviewProvider {
    static var previews: some View {
        SATScoreView(dbn: "02M449")
    }
}
