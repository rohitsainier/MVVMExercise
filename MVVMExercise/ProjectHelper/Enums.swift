//
//  Enums.swift
//  VIPERExercise
//
//  Created by Rohit Saini on 27/02/21.
//

import UIKit


enum Storyboard{
    case Main
    var load: UIStoryboard{
        switch self {
        case .Main:
            return UIStoryboard(name: "Main", bundle: nil)
        }
    }
}
