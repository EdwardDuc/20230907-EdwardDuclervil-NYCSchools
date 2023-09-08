//
//  SATViewModel.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import Foundation
import Combine

class SATViewModel: ObservableObject {
    @Published var satInfo: SATScores?
    @Published var networkBasedErrors: NetworkError?
    private var cancellable = Set<AnyCancellable>()
    @Published private(set) var viewState:ViewStates = .emptyState
    
    let networkManager: NetworkProtocol
    
    init(networkManager:NetworkProtocol){
        self.networkManager = networkManager
    }
    
    func getScoreDataFromAPI(urlString: String, dbn: String){
        viewState = .loadingState
        let scoreRequest = ScoreRequest(path: urlString,params: ["dbn":dbn])
        
        self.networkManager.getDataFromAPI(urlRequest: scoreRequest, type: [SATScores].self)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion{
                case .finished:
                    print("Task Accomplished")
                case .failure(let error):
                    self.viewState = .errorState
                    print(error.localizedDescription)
                    switch error{
                    case is DecodingError:
                        self.networkBasedErrors = NetworkError.dataParseError
                    case is URLError:
                        self.networkBasedErrors = NetworkError.badURLError
                    case NetworkError.noDataFoundError:
                        self.networkBasedErrors = NetworkError.noDataFoundError
                    case NetworkError.responseError:
                        self.networkBasedErrors = NetworkError.responseError
                    default:
                        self.networkBasedErrors = NetworkError.responseError
                    }
                }
            } receiveValue: { scores in
                self.satInfo = scores.first
                if scores.isEmpty {
                    self.viewState = .emptyState
                } else {
                    self.viewState = .loadedState
                }
            }
            .store(in: &cancellable)

    }

    func cancelAPICall(){
        print("API Call has been canceled")
        cancellable.first?.cancel()
        
    }
    
}
