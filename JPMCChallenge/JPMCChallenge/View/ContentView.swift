//
//  ContentView.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var schoolViewModel = SchoolViewModel(networkManager: NetworkManager())
    @State var searchField:String = ""
    var body: some View {
        NavigationView{
            VStack{
                //Using a View State set within the ViewModel allows for different options as our initial view. 
                switch schoolViewModel.viewState{
                case .loadingState:
                    ProgressView()
                case .errorState:
                    errorStateView()
                case .loadedState:
                    loadedStateView()
                case .emptyState:
                    EmptyView()
                }
            }
            .padding()
        }.onAppear {
            if schoolViewModel.schoolList.count == 0 {
                schoolViewModel.getSchoolDataFromAPI(urlString: APIEndpoint.schoolEndpoint)
            }
        }
        .onChange(of: searchField) { newValue in
            schoolViewModel.filterSchoolList(searchText: newValue)
        }
       
    }
 
    @ViewBuilder
    func errorStateView() -> some View {
        Text(schoolViewModel.networkBasedErrors?.errorDescription ?? "No Error Description Provided")
    }
    
 
    @ViewBuilder
    func loadedStateView() -> some View {
        SearchBar(text: $searchField)
        Text("School List").font(.largeTitle).fontWeight(.bold)
        List(schoolViewModel.filteredSchoolList){ school in
            NavigationLink{
                SchoolInfoView(schoolInfo: school)
            } label: {
                VStack{
                    Text(school.schoolName)
                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Quick Searchbar implementation added. To use .searchable, iOS 15+ is needed
struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
