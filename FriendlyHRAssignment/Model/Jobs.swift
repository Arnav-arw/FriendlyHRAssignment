//
//  Jobs.swift
//  FriendlyHRAssignment
//
//  Created by Arnav Singhal on 24/03/24.
//

import Foundation

struct JobsResponseModel: Codable {
    let jobs: [JobModel]
}

struct JobModel: Codable, Identifiable {
    let id: Int
    let internal_job_id: Int
    let companyName: String
    let updated_at: String
    let requisition_id: String
    let location: String
    let absolute_url: String
    let companyLogo: String
    let jobDetail: JobDetails
    
    struct JobDetails: Codable {
        let jobName: String
        let jobDescription: String
        let jobType: String
        let jobLocation: String
        let jobResponsibilities: [String]
        let jobQualifications: [String]
        let salary: JobSalary
        let job_mode: String
        
        enum CodingKeys: CodingKey {
            case jobName
            case jobDescription
            case jobType
            case jobLocation
            case jobResponsibilities
            case jobQualifications
            case salary
            case job_mode
        }
    }
    
    struct JobSalary: Codable {
        let from: Int
        let to: Int
    }
    
    enum CodingKeys: CodingKey {
        case id
        case internal_job_id
        case companyName
        case updated_at
        case requisition_id
        case location
        case absolute_url
        case companyLogo
        case jobDetail
    }
}
