//
//  ReviewsListViewModel.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 9/14/18.
//  Copyright (c) 2018 Attia Mo. All rights reserved.
//

import RxSwift
import RxCocoa

enum ViewModelState{
    case loading
    case loadedWithEmptyData
    case loadedWithData(data: [ReviewItem]?)
    case loadedWithError(error: Error)
}

class ReviewsListViewModel : BaseViewModel {
    
    // output
    var ordersRX  : BehaviorRelay<[ReviewItem]> = BehaviorRelay(value: [])
    var state = BehaviorRelay<ViewModelState>(value: .loading)
    let disposeBag = DisposeBag()
    
    // internal
    let manager = ReviewsManager()
    fileprivate var page = 0
    fileprivate var canLoadMore = true
    
    let pageCount = 10
    
    func instance() -> ReviewsListViewModel{
        getReviews()
        return self
    }
    
    func loadMoreData(_ index: IndexPath) {
        let count =  self.ordersRX.value.count
        if count > 8, index.item == count - 5 && canLoadMore {
            page += 1
            getReviews()
        }
    }
    
    func getReviews(){
        self.state.accept(.loading)
        self.loading.accept(true)
        
        manager.getReviews(page: page, count: pageCount).subscribe(onNext: { [weak self] (reviews) in
            self?.loading.accept(false)
            
            if reviews?.count ?? 0 <= 0{
                self?.state.accept(.loadedWithEmptyData)
            }else{
                
                var tempOrderArray = self?.ordersRX.value
                for review in reviews!{
                    tempOrderArray?.append(review)
                }
                self?.ordersRX.accept(tempOrderArray!)
                self?.state.accept(.loadedWithData(data: reviews))
            }
            }, onError: { [weak self] (error) in
                self?.state.accept(.loadedWithError(error: error))
        }).disposed(by: self.disposeBag)
    }
}
