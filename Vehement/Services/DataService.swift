//
//  DataService.swift
//  Vehement
//
//  Created by Marcus Lewis on 24/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import Foundation

class DataService {
   static let instance = DataService()
    
    private let categories = [
        Category(title: "ALL WORKOUTS", imageName: "weightbelt.png"),
        Category(title: "FEATURED", imageName: "bicepcurl.png"),
        Category(title: "MY PLAN", imageName: "gloves.png"),
        Category(title: "OTHER", imageName: "sixplates.png")
    ]
    
    private let allWorkouts = [
        Workout(title: "Chest Press", imageName: "bicepcurl.png"),
        Workout(title: "Dumbbell Press", imageName: "bicepcurl.png"),
        Workout(title: "Pectoral Fly", imageName: "bicepcurl.png"),
        Workout(title: "Chest Machine", imageName: "bicepcurl.png")
    ]
    
    /*
    private let featuredWorkouts = [
        Workout(title: "", imageName: ".png"),
        Workout(title: "", imageName: ".png"),
        Workout(title: "", imageName: ".png"),
        Workout(title: "", imageName: ".png")
    ]
    
    private let myPlanWorkouts = [
        Workout(title: "", price: "$40", imageName: ".png"),
        Workout(title: "", price: "$25", imageName: ".png"),
        Workout(title: "", price: "$30", imageName: ".png"),
        Workout(title: "", price: "$30", imageName: ".png"),
        Workout(title: "", price: "$60", imageName: ".png")
    ]
    
    private let digitalGoods = [Workout]()
    */
    func getCategories() -> [Category] {
        return categories
    }
    
    func getWorkout(forCategoryTitle title: String) -> [Workout] {
        switch title {
        case "ALLWORKOUTS":
            return getAllWorkouts()
        //case "FEATURED":
        //    return getFeatured()
        //case "MYPLAN":
        //    return getMyPlan()
        //case "OTHER":
        //    return getOther()
        default:
            return getAllWorkouts()
        }
        
    }
    
    func getAllWorkouts() -> [Workout] {
        return allWorkouts
    }
    /*
    func getFeatured() -> [Workout] {
        return featured
    }
    
    func getMyPlan() -> [Workout] {
        return myPlan
    }
    
    func getOther() -> [Workout] {
        return other
    }
    */
}
