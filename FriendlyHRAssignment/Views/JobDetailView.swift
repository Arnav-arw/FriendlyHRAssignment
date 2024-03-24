//
//  JobDetailView.swift
//  FriendlyHRAssignment
//
//  Created by Arnav Singhal on 24/03/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct JobDetailView: View {
    
    var job: JobModel
    @Binding var liked: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        VStack {
                            HStack {
                                WebImage(url: URL(string: job.companyLogo))
                                    .resizable()
                                    .indicator(.activity)
                                    .clipShape(.circle)
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                VStack(alignment: .leading) {
                                    Text(job.companyName)
                                        .fontWeight(.bold)
                                    Text(job.location)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.leading, 5)
                                Spacer()
                            }
                        }
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "person.text.rectangle.fill")
                                    .foregroundColor(.white)
                                    .frame(width: 25)
                                    .padding(.all, 5)
                                    .background(.red)
                                    .clipShape(.rect(cornerRadius: 8))
                                Text(job.jobDetail.jobName)
                            }
                            HStack {
                                Image(systemName: "person.2.fill")
                                    .foregroundColor(.white)
                                    .frame(width: 25)
                                    .padding(.all, 5)
                                    .background(.orange)
                                    .clipShape(.rect(cornerRadius: 8))
                                Text(job.jobDetail.jobType)
                            }
                            HStack {
                                Image(systemName: "location.square.fill")
                                    .foregroundColor(.white)
                                    .frame(width: 25)
                                    .padding(.all, 5)
                                    .background(.blue)
                                    .clipShape(.rect(cornerRadius: 8))
                                Text("\(job.jobDetail.jobLocation) - \(job.jobDetail.job_mode)")
                            }
                            HStack {
                                Image(systemName: "dollarsign.square.fill")
                                    .foregroundColor(.white)
                                    .frame(width: 25)
                                    .padding(.all, 5)
                                    .background(.green)
                                    .clipShape(.rect(cornerRadius: 8))
                                Text("$\(job.jobDetail.salary.from) - $\(job.jobDetail.salary.to)")
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("Job Description")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(job.jobDetail.jobDescription)
                                .font(.callout)
                        }
                        VStack(alignment: .leading) {
                            Text("Job Responsibilites")
                                .font(.title3)
                                .fontWeight(.semibold)
                            ForEach(job.jobDetail.jobResponsibilities, id: \.self) { text in
                                Text("- \(text)")
                                    .font(.callout)
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("Job Qualifications")
                                .font(.title3)
                                .fontWeight(.semibold)
                            ForEach(job.jobDetail.jobQualifications, id: \.self) { text in
                                Text("- \(text)")
                                    .font(.callout)
                            }
                        }
                    }
                }
                HStack {
                    Button {
                        
                    } label: {
                        Text("Apply")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.all, 10)
                            .background(.cyan)
                            .clipShape(.capsule)
                    }
                    Button {
                        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                        liked.toggle()
                    } label: {
                        Image(systemName: liked ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                    }
                    .padding(.all, 13)
                    .background(.gray.opacity(0.1))
                    .clipShape(.circle)
                    .animation(.easeInOut(duration: 0.2), value: liked)
                }
                .padding(.horizontal)
            }
            .navigationTitle("Job Detail")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ShareLink(item: URL(string: job.absolute_url)!)
                }
            }
        }
    }
}
