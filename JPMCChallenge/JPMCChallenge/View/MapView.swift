//
//  MapView.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/15/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var local:Locality
    var body: some View {
        VStack{
            let schoolRegion = MKCoordinateRegion(
                center: local.coordinate,
                    latitudinalMeters: 300,
                longitudinalMeters: 300
            ).getBindingOfRegion()
            
            if let currentRegion = schoolRegion{
                Map(coordinateRegion: currentRegion, annotationItems: [local]) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        MapAnnotationView(title: place.name)
                    }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(local: Locality(school: School(
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
            finalgrades: "6-12",
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

        )))
    }
}
