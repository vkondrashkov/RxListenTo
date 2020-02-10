//
//  AlbumRepository.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import RxSwift

enum AlbumRepositoryError: Error {
    case albumNotFound
    case unknown(Error)
}

protocol AlbumRepository {
    func fetchAlbum(id: Int) -> Single<Album>
    func fetchAlbums(name: String) -> Observable<[Album]>
}

final class AlbumRepositoryImpl: AlbumRepository {
    func fetchAlbum(id: Int) -> Single<Album> {
        return Single.create { [weak self] single in
            guard let self = self else {
                single(.error(TrackRepositoryError.trackNotFound))
                return Disposables.create()
            }
            // TODO: API request
            single(.success(Album(id: 0, year: 0, artist: nil, coverURL: "", thumbnailURL: "", title: "")))
            return Disposables.create()
        }
    }

    func fetchAlbums(name: String) -> Observable<[Album]> {
        return Observable.create { [weak self] observable in
            return Disposables.create()
        }
    }
}
