//
//  ServerManager.swift
//  Berlin ReviewsTests
//
//  Created by Attia Mo on 9/27/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxCocoa

@testable import Berlin_Reviews

class ServerManagerTest: QuickSpec {
    var server:ReviewsManager!
    let disposeBag = DisposeBag()
    
    override func spec() {
        
        describe("ServerManager") {
            beforeEach {
                self.server = ReviewsManager()
            }
            context("Test number of Reviews from API"){
                it("expect get Reviews not empty array"){
                    
                    self.server.getReviews(page: 0, count: 10).subscribe(onNext: { (reviews) in
                        expect(reviews?.count) == 10
                        }, onError: { (error) in
                            
                    }).disposed(by: self.disposeBag)
                }
            }
        }
    }
}
