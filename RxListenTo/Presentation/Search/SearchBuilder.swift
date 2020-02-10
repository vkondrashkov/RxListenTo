//
//  SearchBuilder.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class SearchBuilderImpl: SearchBuilder {
    private let dependency: SearchDependency

    init(dependency: SearchDependency) {
        self.dependency = dependency
    }

    func build() -> UIViewController {
        let view = SearchViewController()
        let scene = NavigationScene(parent: dependency.searchNavigationController)
        let router = SearchRouterImpl(scene: scene)

        let searchRepository = SearchRepositoryImpl()
        let trackRepository = TrackRepositoryImpl()
        let artistRepository = ArtistRepositoryImpl()
        let albumRepository = AlbumRepositoryImpl()
        let interactor = SearchInteractorImpl(
            searchRepository: searchRepository,
            trackRepository: trackRepository,
            artistRepository: artistRepository,
            albumRepository: albumRepository
        )

        let viewModel = SearchViewModel(interactor: interactor, router: router)
        view.viewModel = viewModel

        return view
    }
}
