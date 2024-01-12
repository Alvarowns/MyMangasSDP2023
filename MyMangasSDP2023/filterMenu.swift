//
//  GenresMenu.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 8/1/24.
//

import SwiftUI

struct filterMenu: View {
    @StateObject private var viewModel = MangasVM()
    
    var body: some View {
        Menu {
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.action.rawValue)
                }
            } label: {
                Text(GenreName.action.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.adventure.rawValue)
                }
            } label: {
                Text(GenreName.adventure.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.avantGarde.rawValue)
                }
            } label: {
                Text(GenreName.avantGarde.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.awardWinning.rawValue)
                }
            } label: {
                Text(GenreName.awardWinning.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.boysLove.rawValue)
                }
            } label: {
                Text(GenreName.boysLove.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.comedy.rawValue)
                }
            } label: {
                Text(GenreName.comedy.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.drama.rawValue)
                }
            } label: {
                Text(GenreName.drama.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.ecchi.rawValue)
                }
            } label: {
                Text(GenreName.ecchi.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.erotica.rawValue)
                }
            } label: {
                Text(GenreName.erotica.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.fantasy.rawValue)
                }
            } label: {
                Text(GenreName.fantasy.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.girlsLove.rawValue)
                }
            } label: {
                Text(GenreName.girlsLove.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.gourmet.rawValue)
                }
            } label: {
                Text(GenreName.gourmet.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.hentai.rawValue)
                }
            } label: {
                Text(GenreName.hentai.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.horror.rawValue)
                }
            } label: {
                Text(GenreName.horror.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.mistery.rawValue)
                }
            } label: {
                Text(GenreName.mistery.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.romance.rawValue)
                }
            } label: {
                Text(GenreName.romance.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.sciFi.rawValue)
                }
            } label: {
                Text(GenreName.sciFi.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.sliceOfLife.rawValue)
                }
            } label: {
                Text(GenreName.sliceOfLife.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.sports.rawValue)
                }
            } label: {
                Text(GenreName.sports.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.supernatural.rawValue)
                }
            } label: {
                Text(GenreName.supernatural.rawValue)
            }
            Button {
                Task {
                    await viewModel.getMangaByGenre(genre: GenreName.suspense.rawValue)
                }
            } label: {
                Text(GenreName.suspense.rawValue)
            }
        } label: {
            Button("Filter") {}
                .buttonStyle(.borderedProminent)
                .tint(.purple)
        }
        .padding()
        .menuStyle(.button)
    }
}

#Preview {
    filterMenu()
}
