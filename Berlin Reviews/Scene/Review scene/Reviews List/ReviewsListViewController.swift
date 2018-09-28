//
//  ReviewsListViewController.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 9/14/18.
//  Copyright (c) 2018 Attia Mo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ReviewsListViewController: BaseViewController {
    lazy var router = ReviewsListRouter()
    lazy var viewModel = ReviewsListViewModel()
    var refreshControl: UIRefreshControl!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func tryAgainTapped(_ sender: Any) {
        viewModel.getReviews()
    }
}

// MARK: Setup
private extension ReviewsListViewController {
    
    func setupViews() {
        title = "Tempelhof Airport History"
        tableView.estimatedRowHeight = 120.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.frame = self.view.frame
        tableView.addSubview(activity)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(startRefreshControl(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    
    func setupRx() {
        
        let noReaultObservable:Observable<Bool> =  viewModel.ordersRX.asObservable().map({ (orders) -> Bool in
            return orders.count <= 0
        }).asObservable().share()
        
        noReaultObservable.subscribe(onNext: { [unowned self] noResult in
            self.refreshControl.endRefreshing()
            if noResult != true {
                self.tableView.dataSource = nil
                
                self.viewModel.ordersRX.asObservable().catchError({ (error) -> Observable<[ReviewItem]> in
                    return Observable.from([])
                }).bind(to: self.tableView.rx.items(cellIdentifier: ReviewTableViewCell.id)){ row,cellData,cell in
                    if let cell = cell as? ReviewTableViewCell{
                        cell.configureCellWith(review: cellData)
                    }
                    }.disposed(by: self.disposeBag)
            }
        }).disposed(by: disposeBag)
        
        viewModel.loading.asObservable().share().bind(to: activity.rx_animating).disposed(by: disposeBag)
        self.observeViewModelState()
        viewModel.getReviews()
    }
    // observe ViewModel for changes
    func observeViewModelState(){
        viewModel.state.asObservable().subscribe(onNext: {[weak self] (state) in
            self?.handleState(state: state)
        }).disposed(by: disposeBag)
    }
    
    // handle different state
    func handleState(state: ViewModelState) {
        switch state {
            
        case .loading:
            self.emptyView.isHidden = true
            
        case .loadedWithEmptyData:
            self.tableView.isHidden = true
            self.emptyView.isHidden = false
            
        case .loadedWithData:
            self.tableView.isHidden = false
            self.emptyView.isHidden = true
            self.tableView.reloadData()
            
        case .loadedWithError(let error):
            self.tableView.isHidden = true
            self.emptyView.isHidden = false
            self.emptyLabel.text = error.localizedDescription
        }
    }
    @objc func startRefreshControl(_ sender: Any) {
        viewModel.getReviews()
    }
    
}
// MARK: - UITableViewDelegate
extension ReviewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.loadMoreData(indexPath)
    }
}
