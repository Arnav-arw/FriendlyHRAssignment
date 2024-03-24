//
//  JobCardView.swift
//  FriendlyHRAssignment
//
//  Created by Arnav Singhal on 24/03/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct JobCardView: View {
    
    let job: JobModel
    
    @State var liked: Bool = false
    @State var lineLimit: Bool = false
    
    var body: some View {
        Section {
            VStack(alignment: .leading) {
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
                    Button {
                        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                        liked.toggle()
                    } label: {
                        Image(systemName: liked ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                    }
                    .animation(.easeInOut(duration: 0.2), value: liked)
                }
            }
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Text(job.jobDetail.jobName)
                            .foregroundStyle(.white)
                            .font(.callout)
                            .padding(.vertical, 7)
                            .padding(.horizontal)
                            .background(.red)
                            .clipShape(.capsule)
                        Text(job.jobDetail.jobType)
                            .foregroundStyle(.white)
                            .font(.callout)
                            .padding(.vertical, 7)
                            .padding(.horizontal)
                            .background(.orange)
                            .clipShape(.capsule)
                    }
                }
                .padding(.bottom, 5)
                Text("$\(job.jobDetail.salary.from) - $\(job.jobDetail.salary.to)")
                    .foregroundStyle(.white)
                    .font(.callout)
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .background(.green)
                    .clipShape(.capsule)
                Text(job.jobDetail.jobDescription)
                    .font(.body)
                    .lineLimit(lineLimit ? nil : 4)
                    .onTapGesture {
                        lineLimit.toggle()
                    }
            }
            .padding(.vertical, 10)
            NavigationLink {
                JobDetailView(job: job, liked: $liked)
            } label: {
                Text("Apply now")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    HomeView()
}
