//
//  SearchRepository.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import RxSwift

enum SearchRepositoryError: Error {
    case notFound
    case unknown(Error)
}

protocol SearchRepository {
    func fetchAll(text: String, page: Int) -> Observable<([Track], [Album], [Artist])>
}

final class SearchRepositoryImpl: SearchRepository {
    func fetchAll(text: String, page: Int) -> Observable<([Track], [Album], [Artist])> {
        return Observable.create { observer in
            observer.on(.next((
                [Track(id: 0, title: "Foo", duration: 234, artist: Artist(id: 0, name: "Bar"), album: Album(id: 0, year: 0, artist: nil, coverURL: "https://images.squarespace-cdn.com/content/v1/5aa98f23ee1759b91c064e1e/1558555550305-K03A45K9ZLKF5P1L4VYB/ke17ZwdGBToddI8pDm48kDHPSfPanjkWqhH6pl6g5ph7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0kT3PXaDTw6fk-7hFv8qtuO9cQCsc0TvODI6VkiZtuEfknLoiRIu-kWfCHsqWGB43w/dots-space-crop-thumb-canopy.png", thumbnailURL: "https://images.squarespace-cdn.com/content/v1/5aa98f23ee1759b91c064e1e/1558555550305-K03A45K9ZLKF5P1L4VYB/ke17ZwdGBToddI8pDm48kDHPSfPanjkWqhH6pl6g5ph7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0kT3PXaDTw6fk-7hFv8qtuO9cQCsc0TvODI6VkiZtuEfknLoiRIu-kWfCHsqWGB43w/dots-space-crop-thumb-canopy.png", title: ""))],
                [],
                []
            )))
            return Disposables.create()
        }
    }
}
