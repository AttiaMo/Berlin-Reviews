//
//  StoryboaedExtension.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 9/9/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    case Main = "Main"
}

extension UIStoryboard {
    class func instantiateInitialViewController(_ board: AppStoryboard) -> UIViewController {
        let story = UIStoryboard(name: board.rawValue, bundle: nil)
        return story.instantiateInitialViewController()!
    }
}

