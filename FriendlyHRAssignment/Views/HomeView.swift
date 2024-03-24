//
//  HomeView.swift
//  FriendlyHRAssignment
//
//  Created by Arnav Singhal on 24/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var jobVM = JobsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let jobs = jobVM.jobs {
                    JobListView(jobs: jobs)
                        .environmentObject(jobVM)
                } else {
                    ProgressView("Loading Jobs")
                }
            }
            .navigationTitle("Jobs")
        }
    }
}

#Preview {
    HomeView()
}
