//
//  ArtistRepository.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import RxSwift

enum ArtistRepositoryError: Error {
    case artistNotFound
    case unknown(Error)
}

protocol ArtistRepository {
    func fetchArtist(id: Int) -> Single<Artist>
    func fetchArtists(name: String) -> Observable<[Artist]>
}

final class ArtistRepositoryImpl: ArtistRepository {
    func fetchArtist(id: Int) -> Single<Artist> {
        return Single.create { [weak self] single in
            guard let self = self else {
                single(.error(TrackRepositoryError.trackNotFound))
                return Disposables.create()
            }
            // TODO: API request
            single(.success(Artist(id: 0, name: "")))
            return Disposables.create()
        }
    }

    func fetchArtists(name: String) -> Observable<[Artist]> {
        return Observable.create { [weak self] observable in
            return Disposables.create()
        }
    }
}
