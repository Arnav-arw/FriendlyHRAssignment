//
//  JobsManager.swift
//  FriendlyHRAssignment
//
//  Created by Arnav Singhal on 24/03/24.
//

import Foundation

class JobsManager {
    
    static let shared = JobsManager()
    
    func fetchJobsFromWeb() async -> JobsResponseModel? {
        let url = URL(string: "https://run.mocky.io/v3/bbd60709-4379-4cff-9ee2-31237c0ee61d")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let responseData = try decoder.decode(JobsResponseModel.self, from: data)
            return responseData
        } catch {
            print(error)
            return nil
        }
    }
    
}
