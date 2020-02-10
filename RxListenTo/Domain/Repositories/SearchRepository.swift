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
                [Track(id: 0, title: "Foo", duration: 234, artist: Artist(id: 0, name: "Bar"), album: nil)],
                [],
                []
            )))
            return Disposables.create()
        }
    }
}
