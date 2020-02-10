//
//  SearchViewController.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import RxCocoa
import RxSwift

final class SearchViewController: UIViewController {
    private let tracksTableView = UITableView()

    var viewModel: SearchViewModel!
    let search = BehaviorRelay(value: "")

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        view.backgroundColor = .white

        tracksTableView.register(SearchTrackTableViewCell.self)
        tracksTableView.tableFooterView = UIView()
        view.addSubview(tracksTableView)
        tracksTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        let search = UISearchController(searchResultsController: nil)
        definesPresentationContext = true
        search.searchResultsUpdater = self
        navigationItem.searchController = search
    }

    private func bindViewModel() {
        search
            .bind(to: viewModel.input.search)
            .disposed(by: disposeBag)

        viewModel.output.tracks
            .asObservable()
            .bind(to: tracksTableView.rx.items(cellIdentifier: SearchTrackTableViewCell.reuseId, cellType: SearchTrackTableViewCell.self)) { index, item, cell in
                cell.textLabel?.text = item.title
                cell.detailTextLabel?.text = item.authorName
                cell.durationLabel.text = item.duration
                // download image
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UISearchResultsUpdating implementation

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        search.accept(searchController.searchBar.text ?? "")
    }
}
