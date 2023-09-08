//
//  Schools.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import Foundation

struct School: Identifiable, Decodable {
    var id: String {
        return dbn
    }
    
    let dbn, schoolName, boro, overviewParagraph: String
    let academicopportunities1, academicopportunities2: String?
    let location, phoneNumber: String
    let faxNumber, schoolEmail: String?
    let website, totalStudents: String
    let extracurricularActivities: String?
    let attendanceRate, city: String
    let latitude, longitude, borough: String?
    let academicopportunities3, languageClasses, academicopportunities4, academicopportunities5: String?
    let startTime, endTime, graduationRate, girls: String?
    let boys: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case boro
        case overviewParagraph = "overview_paragraph"
        case academicopportunities1, academicopportunities2, location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case attendanceRate = "attendance_rate"
        case city, latitude, longitude, borough, academicopportunities3
        case languageClasses = "language_classes"
        case academicopportunities4, academicopportunities5
        case startTime = "start_time"
        case endTime = "end_time"
        case graduationRate = "graduation_rate"
        case girls, boys
    }
    
}
