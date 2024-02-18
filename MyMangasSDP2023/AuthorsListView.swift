//
//  AUTHORSPRUEBA.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 23/1/24.
//

import SwiftUI

struct AuthorsListView: View {
    @EnvironmentObject private var viewModel: AuthorsVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filterSearch) { author in
                    if author.firstName != "" {
                        Button {
                            viewModel.authorName = "\(author.firstName ?? "") \(author.lastName ?? "")"
                            viewModel.authorId = author.id ?? ""
                            Task {
                                await viewModel.getMangasByAuthor(id: author.id ?? "")
                            }
                            viewModel.isAuthorSearch.toggle()
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(author.firstName ?? "") \(author.lastName ?? "")")
                                        .foregroundStyle(.black)
                                    Text(author.role ?? "")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.gray)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .sheet(isPresented: $viewModel.isAuthorSearch, content: {
                    ExploreAuthorView()
                })
            }
            .listStyle(.grouped)
            .searchable(text: $viewModel.search, prompt: "Search by Author name")
            .navigationTitle("Authors")
            .navigationBarTitleDisplayMode(.inline)
            .autocorrectionDisabled()
        }
    }
}

#Preview {
    AuthorsListView()
        .environmentObject(AuthorsVM())
}
