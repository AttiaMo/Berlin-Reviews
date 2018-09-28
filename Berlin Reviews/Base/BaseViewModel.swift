//
//  BaseViewModel.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 9/4/18.
//  Copyright (c) 2018 Attia Mo. All rights reserved.
//

import RxSwift
import RxCocoa

class BaseViewModel {

    // input
    var loading  : BehaviorRelay<Bool> = BehaviorRelay(value: false)

    // output

    // internal

    init() {
        setupRx()
    }
}

// MARK: Setup
private extension BaseViewModel {

    func setupRx() {

    }
}
