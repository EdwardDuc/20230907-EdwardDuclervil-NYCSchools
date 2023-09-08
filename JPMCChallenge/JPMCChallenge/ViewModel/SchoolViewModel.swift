//
//  SchoolViewModel.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import Foundation
import Combine

class SchoolViewModel: ObservableObject {
    @Published var schoolList = [School]()
    @Published var filteredSchoolList = [School]()
    @Published var networkBasedErrors: NetworkError?
    private var cancellable = Set<AnyCancellable>()
    @Published private(set) var viewState:ViewStates = .emptyState
    
    let networkManager: NetworkProtocol
    
    init(networkManager:NetworkProtocol){
        self.networkManager = networkManager
    }
    
    
    func getSchoolDataFromAPI(urlString: String){
        viewState = .loadingState
        let schoolRequest = SchoolRequest(path: urlString)
        
        
        self.networkManager.getDataFromAPI(urlRequest: schoolRequest, type: [School].self)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion{
                case .finished:
                    self.viewState = .loadedState
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
            } receiveValue: { theSchools in
                self.schoolList = theSchools
                self.filteredSchoolList = theSchools
            }
            .store(in: &cancellable)

    }
    //This function would cancel the API call if pressed before it pulls up, But it wont be used during this project.
    func cancelAPICall(){
        print("API Call has been canceled")
        cancellable.first?.cancel()
        
    }
    
    //Search function
    //Due to time constraints, Only Name is searched. Would have preferred to add functionality to sort and/or filter by borough
    func filterSchoolList(searchText:String){
        if searchText.isEmpty { // Ensures full list will return when search is blank
            self.filteredSchoolList = self.schoolList
        } else {
            let list = self.schoolList.filter { schools in
                return schools.schoolName.localizedCaseInsensitiveContains(searchText)
            }
            self.filteredSchoolList = list
        }
    }
    
}

enum ViewStates{
    case loadingState
    case errorState
    case loadedState
    case emptyState
    
}
