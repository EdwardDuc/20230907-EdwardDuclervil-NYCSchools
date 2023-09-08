//
//  SchoolInfoView.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import SwiftUI

struct SchoolInfoView: View {
    @State var schoolInfo:School
    @State private var isPresented = false
    @State private var showFullText = false
    @State var buttonText = "Show More"
    var body: some View {
        VStack{
            Section{
                Text(schoolInfo.schoolName).font(.title).multilineTextAlignment(.center).padding(.horizontal)
                showBorough()
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(schoolInfo.location).multilineTextAlignment(.center).padding(.horizontal)
                Text(schoolInfo.phoneNumber)
                showEmail()
                NavigationLink{
                    SUIWebView(schoolSite: schoolInfo.website)
                } label: {
                    Text("Visit Website")
                }
            }
            Divider()
            Section{
                
                
            }
            ScrollView{
                //Due to time contstraints, I've re-purposed the SAT Score Format to display the data.
                Section {
                    if showFullText{
                        Text(schoolInfo.overviewParagraph).multilineTextAlignment(.center)
                    } else {
                        Text(schoolInfo.overviewParagraph.prefix(100)+"...").multilineTextAlignment(.center)
                    }
                    Button(buttonText){
                        showFullText.toggle()
                        if showFullText{
                            buttonText = "Hide"
                        } else {
                            buttonText = "Show More"
                        }
                    }
                }.padding(.horizontal)
                Divider()
                ScoreSectionFormat(leftText: "Total Students:", rightText: schoolInfo.totalStudents)
                ScoreSectionFormat(leftText: "Attendance Rate:", rightText: convertPercentage(strDouble: schoolInfo.attendanceRate)+"%")
                ScoreSectionFormat(leftText: "Total Students:", rightText: schoolInfo.totalStudents)
                Divider()
                Text("Academic Opportunities").font(.title2)
                Text(schoolInfo.academicopportunities1!).multilineTextAlignment(.center).padding(.horizontal)
            }
            Button("Show SAT Statistics"){
                isPresented.toggle()
            }.sheet(isPresented: $isPresented) {
                SATScoreView(dbn: schoolInfo.dbn)
            }
        }
    }
    
    @ViewBuilder
    func showBorough() -> some View {
        switch schoolInfo.boro{
        case "M":
            Text("Manhattan")
        case "Q":
            Text("Queens")
        case "X":
            Text("The Bronx")
        case "K":
            Text("Brooklyn")
        case "R":
            Text("Staten Island")
        default:
            Text("")
        }
        
        
    }
    
    func convertPercentage(strDouble:String) -> String {
        guard let numberDouble = Double(strDouble) else {
            return "0.0"
        }
        let percentDouble = numberDouble * 100
        let roundedValue = round(percentDouble * 100) / 100.0
        let percentString = String("\(roundedValue)")
        return percentString
    }
    
    @ViewBuilder
    func showEmail() -> some View {
        if schoolInfo.schoolEmail == nil {
            EmptyView()
        } else {
            Text(schoolInfo.schoolEmail!)
        }
    }
}
// Use a sheet to show SAT scores.

struct SchoolInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolInfoView(schoolInfo:
            School(
            dbn: "02M449",
            schoolName: "Vanguard High School",
            boro: "M",
            overviewParagraph: "Our school community is committed to helping our students become articulate, analytical, reflective, and empathetic citizens. Respect for self and others is central to achieving our goals. Our advisory system maintains close ties with our students and their families. As a member of the Coalition of Essential Schools, we adhere to the principles of small class sizes, longer block scheduling, shared planning and instruction, cooperative learning, project-based curriculum, and portfolio-based assessment in classes and graduation. Class discussions and assignments adhere to the Coalition Habits of Mind: using evidence, investigating points of view, making connections, and seeking relevance.",
            academicopportunities1: "English/Social Sciences-integrated Humanities in 9th and 10th grades; History and Literature classes in 11th and 12th grades",
            academicopportunities2: "Four-year Science curriculum with Robotics, Living Environment, Chemistry, Physics, Epidemiology, Biopsychology",
            location: "317 East 67th Street, Manhattan NY 10065 (40.765638, -73.959777)",
            phoneNumber: "212-517-5175",
            faxNumber: "212-517-5334",
            schoolEmail: "WKlann@schools.nyc.gov",
            website: "www.vanguardnyc.net",
            totalStudents: "461",
            extracurricularActivities: "Student Voice Collaborative, City Explorers, Fit and Fly at New York Sports Club, Leadership, Athletic and Tutoring Programs at Vanderbilt YMCA, Radio Rootz, Tutoring in major subject areas, Vanguard Movement, Vanguard Student Government, WNYC Radio Rookies, Drama, Fashion",
            attendanceRate: "0.870000005",
            city: "Manhattan",
            latitude: "40.76564",
            longitude: "-73.9598",
            borough: "MANHATTAN",
            academicopportunities3: "Four-year math curriculum with AP Calculus; Painting, Digital Photography, Philosophy of Art, Furniture Making, Portfolio Preparation for art colleges",
            languageClasses: "French, Spanish",
            academicopportunities4: "College exploration beginning in the ninth grade; Two-year Reading and Writing Workshop Literacy Program",
            academicopportunities5: "CUNY College Now, Creative Writing, Yoga, Weight Training, Internships",
            startTime: "8am",
            endTime: "3pm",
            graduationRate: "0.73299998",
            girls: nil,
            boys: nil

        ))
    }
}
