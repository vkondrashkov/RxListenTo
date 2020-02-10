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
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let trackSectionLabel = UILabel()
    private let trackSectionMoreButton = UIButton(type: .system)
    private let trackTableView = SearchTrackTableView()

    private let albumSectionLabel = UILabel()
    private let albumSectionMoreButton = UIButton(type: .system)
    private let albumCollectionViewLayout = UICollectionViewFlowLayout()
    private lazy var albumCollectionView = SearchAlbumCollectionView(
        frame: .zero,
        collectionViewLayout: albumCollectionViewLayout
    )

    private let artistSectionLabel = UILabel()
    private let artistSectionMoreButton = UIButton(type: .system)
    private let artistCollectionViewLayout = UICollectionViewFlowLayout()
    private lazy var artistCollectionView = SearchArtistCollectionView(
        frame: .zero,
        collectionViewLayout: artistCollectionViewLayout
    )

    var viewModel: SearchViewModel!
    let search = BehaviorRelay(value: "")

    private let disposeBag = DisposeBag()

    override func loadView() {
        view = UIView()

        view.addSubview(scrollView)
        scrollView.delaysContentTouches = false
        scrollView.contentInset.bottom = 30
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().priority(.low)
        }

        contentView.addSubview(trackSectionLabel)
        trackSectionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }

        contentView.addSubview(trackSectionMoreButton)
        trackSectionMoreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(trackSectionLabel.snp.bottom)
        }

        contentView.addSubview(trackTableView)
        trackTableView.snp.makeConstraints {
            $0.top.equalTo(trackSectionLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }

        contentView.addSubview(albumSectionLabel)
        albumSectionLabel.snp.makeConstraints {
            $0.top.equalTo(trackTableView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }

        contentView.addSubview(albumSectionMoreButton)
        albumSectionMoreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(albumSectionLabel.snp.bottom)
        }

        contentView.addSubview(albumCollectionView)
        albumCollectionView.snp.makeConstraints {
            $0.top.equalTo(albumSectionLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(155)
        }

        contentView.addSubview(artistSectionLabel)
        artistSectionLabel.snp.makeConstraints {
            $0.top.equalTo(albumCollectionView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }

        contentView.addSubview(artistSectionMoreButton)
        artistSectionMoreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(artistSectionLabel.snp.bottom)
        }

        contentView.addSubview(artistCollectionView)
        artistCollectionView.snp.makeConstraints {
            $0.top.equalTo(artistSectionLabel.snp.bottom).offset(10)
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Search" /// TODO: localization using code generation
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false

        let search = UISearchController(searchResultsController: nil)
        definesPresentationContext = true
        search.searchResultsUpdater = self
        navigationItem.searchController = search

        trackSectionLabel.text = "Tracks"
        trackSectionLabel.font = .boldSystemFont(ofSize: 24)

        trackSectionMoreButton.setTitle("Show all", for: .normal)

        albumSectionLabel.text = "Albums"
        albumSectionLabel.font = .boldSystemFont(ofSize: 24)

        albumSectionMoreButton.setTitle("Show all", for: .normal)

        albumCollectionViewLayout.scrollDirection = .horizontal
        albumCollectionViewLayout.sectionInset.left = 20
        albumCollectionViewLayout.sectionInset.right = 20
        albumCollectionView.showsHorizontalScrollIndicator = false

        artistSectionLabel.text = "Artists"
        artistSectionLabel.font = .boldSystemFont(ofSize: 24)

        artistSectionMoreButton.setTitle("Show all", for: .normal)

        artistCollectionViewLayout.scrollDirection = .horizontal
        artistCollectionViewLayout.sectionInset.left = 20
        artistCollectionViewLayout.sectionInset.right = 20
        artistCollectionView.showsHorizontalScrollIndicator = false
    }

    private func bindViewModel() {
        search
            .bind(to: viewModel.input.search)
            .disposed(by: disposeBag)

        viewModel.output.tracks
            .asObservable()
            .bind(to: trackTableView.rx.items(cellIdentifier: SearchTrackTableViewCell.reuseId, cellType: SearchTrackTableViewCell.self)) { index, item, cell in
                cell.textLabel?.text = item.title
                cell.detailTextLabel?.text = item.authorName
                cell.durationLabel.text = item.duration
                cell.imageView?.downloaded(from: item.thumbnailURL ?? "")
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
