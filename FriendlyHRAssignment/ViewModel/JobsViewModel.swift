//
//  JobsViewModel.swift
//  FriendlyHRAssignment
//
//  Created by Arnav Singhal on 24/03/24.
//

import Foundation

class JobsViewModel: ObservableObject {
    
    @Published var jobs: [JobModel]?
    
    let dataManager = JobsManager()
    
    init() {
        Task {
            await fetchGetJobs()
        }
    }
    
    func fetchGetJobs() async {
        let response = await dataManager.fetchJobsFromWeb()
        if let jobs = response?.jobs {
            DispatchQueue.main.async {
                self.jobs = jobs
            }
        }
    }
    
}
