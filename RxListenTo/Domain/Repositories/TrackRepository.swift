//
//  TrackRepository.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import RxSwift

enum TrackRepositoryError: Error {
    case trackNotFound
    case unknown(Error)
}

protocol TrackRepository {
    func fetchTrack(id: Int) -> Single<Track>
    func fetchTracks(name: String) -> Observable<[Track]>
}

final class TrackRepositoryImpl: TrackRepository {
    func fetchTrack(id: Int) -> Single<Track> {
        return Single.create { [weak self] single in
            guard let self = self else {
                single(.error(TrackRepositoryError.trackNotFound))
                return Disposables.create()
            }
            // TODO: API request
            single(.success(Track(id: 0, title: "", duration: 0, artist: nil, album: nil)))
            return Disposables.create()
        }
    }

    func fetchTracks(name: String) -> Observable<[Track]> {
        return Observable.create { [weak self] observable in
            return Disposables.create()
        }
    }
}
