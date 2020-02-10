//
//  SearchInteractor.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import RxSwift

protocol SearchInteractor {
    func fetchAll(text: String) -> Observable<([Track], [Album], [Artist])>
    func fetchTracks(name: String) -> Observable<[Track]>
    func fetchArtists(name: String) -> Observable<[Artist]>
    func fetchAlbums(name: String) -> Observable<[Album]>
}

final class SearchInteractorImpl: SearchInteractor {
    private let searchRepository: SearchRepository
    private let trackRepository: TrackRepository
    private let artistRepository: ArtistRepository
    private let albumRepository: AlbumRepository

    init(searchRepository: SearchRepository,
         trackRepository: TrackRepository,
         artistRepository: ArtistRepository,
         albumRepository: AlbumRepository) {
        self.searchRepository = searchRepository
        self.trackRepository = trackRepository
        self.artistRepository = artistRepository
        self.albumRepository = albumRepository
    }

    func fetchAll(text: String) -> Observable<([Track], [Album], [Artist])> {
        return searchRepository.fetchAll(text: text, page: 0) // temp page
    }

    func fetchTracks(name: String) -> Observable<[Track]> {
        return trackRepository.fetchTracks(name: name)
    }

    func fetchArtists(name: String) -> Observable<[Artist]> {
        return artistRepository.fetchArtists(name: name)
    }

    func fetchAlbums(name: String) -> Observable<[Album]> {
        return albumRepository.fetchAlbums(name: name)
    }
}
