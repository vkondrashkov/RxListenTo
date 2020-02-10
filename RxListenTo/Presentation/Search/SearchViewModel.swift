//
//  SearchViewModel.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import RxSwift
import RxCocoa

final class SearchViewModel {
    private let interactor: SearchInteractor
    private let router: SearchRouter

    struct Input {
        let search: AnyObserver<String>
        let select: AnyObserver<IndexPath>
    }

    struct Output {
        let tracks: Driver<[SearchTrackTableItem]>
    }

    let input: Input
    let output: Output

    private let searchSubject = PublishSubject<String>()
    private let selectSubject = PublishSubject<IndexPath>()

    private let disposeBag = DisposeBag()

    init(interactor: SearchInteractor,
         router: SearchRouter) {
        self.interactor = interactor
        self.router = router

        let search = searchSubject
            .startWith("")
            .distinctUntilChanged()
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .flatMap {
                interactor.fetchAll(text: $0)
            }

        let tracks = search
            .map {
                $0.0.map {
                    SearchTrackTableItem(
                        id: $0.id,
                        title: $0.title,
                        authorName: $0.artist?.name ?? "",
                        duration: String($0.duration),
                        thumbnailURL: $0.album?.thumbnailURL ?? ""
                    )
                }
            }

        let albums = search
            .map { $0.1 }

        let artists = search
            .map { $0.2 }

        input = Input(
            search: searchSubject.asObserver(),
            select: selectSubject.asObserver()
        )

        output = Output(
            tracks: tracks.asDriver(onErrorJustReturn: [])
        )
    }
}
