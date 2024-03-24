//
//  JobListView.swift
//  FriendlyHRAssignment
//
//  Created by Arnav Singhal on 24/03/24.
//

import SwiftUI

struct JobListView: View {
    
    var jobs: [JobModel]
    
    @EnvironmentObject var jobVM: JobsViewModel
    
    @State var fetchedJobs: [JobModel] = []
    @State var searchTerm: String = ""
    
    var body: some View {
        VStack {
            if fetchedJobs.isEmpty {
                ContentUnavailableView("No Jobs Found", systemImage: "shared.with.you.slash")
            } else {
                List {
                    ForEach(fetchedJobs) { job in
                        JobCardView(job: job)
                    }
                }
            }
        }
        .searchable(text: $searchTerm)
        .onAppear {
            self.fetchedJobs = jobs
        }
        .onChange(of: searchTerm) {
            if searchTerm.isEmpty {
                self.fetchedJobs = jobs
            } else {
                self.fetchedJobs = jobs.filter { job in
                    return job.jobDetail.jobName.localizedStandardContains(searchTerm)
                }
            }
        }
        .refreshable {
            Task {
                await jobVM.fetchGetJobs()
            }
        }
    }
}

