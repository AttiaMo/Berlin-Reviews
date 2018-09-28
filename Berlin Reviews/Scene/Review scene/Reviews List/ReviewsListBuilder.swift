//
//  ReviewsListBuilder.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 9/14/18.
//  Copyright (c) 2018 Attia Mo. All rights reserved.
//

import UIKit

struct ReviewsListBuilder {
    
    static func viewController() -> ReviewsListViewController {
        let router = ReviewsListRouter()
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrdersListViewController") as! ReviewsListViewController
        router.viewController = viewController
        
        return viewController
    }
    
    static func navigationController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: ReviewsListBuilder.viewController())
        navigationController.navigationBar.barTintColor = UIColor.init(red: 236/255, green: 97/255, blue: 65/255, alpha: 1)
        navigationController.navigationBar.isTranslucent = false
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController.navigationBar.titleTextAttributes = textAttributes
        return navigationController
    }
    
}

