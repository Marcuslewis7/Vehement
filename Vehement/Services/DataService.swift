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
        Workout(title: "Chest Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Pectoral Fly", imageName: "sixplates.png", timeLength: "1:24", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Incline", imageName: "sixplates.png", timeLength: "2:53", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Decline", imageName: "gloves.png", timeLength: "1:42", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Flat", imageName: "bicepcurl.png", timeLength: "4:45", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Machine", imageName: "sixplates.png", timeLength: "0:45", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Dips", imageName: "gloves.png", timeLength: "3:41", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Pull", imageName: "weightbelt.png", timeLength: "2:25", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Machine", imageName: "gloves.png", timeLength: "2:43", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Curl", imageName: "sixplates.png", timeLength: "1:44", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    private let mostViewedWorkouts = [
        Workout(title: "Chest Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Pectoral Fly", imageName: "sixplates.png", timeLength: "1:24", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    private let mostLikedWorkouts = [
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Pectoral Fly", imageName: "sixplates.png", timeLength: "1:24", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    private let recommendedWorkouts = [
        Workout(title: "Tricep Dips", imageName: "gloves.png", timeLength: "3:41", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Pull", imageName: "weightbelt.png", timeLength: "2:25", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Machine", imageName: "gloves.png", timeLength: "2:43", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Curl", imageName: "sixplates.png", timeLength: "1:44", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    private let muscleBuildingWorkouts = [
        Workout(title: "Chest Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Dips", imageName: "gloves.png", timeLength: "3:41", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    private let bodyToningWorkouts = [
        Workout(title: "Pectoral Fly", imageName: "sixplates.png", timeLength: "1:24", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Incline", imageName: "sixplates.png", timeLength: "2:53", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Decline", imageName: "gloves.png", timeLength: "1:42", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    /*
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
        case "FEATURED":
            return getMostViewedWorkouts()
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
    
    func getMostViewedWorkouts() -> [Workout] {
        return mostViewedWorkouts
    }
    
    func getMostLikedWorkouts() -> [Workout] {
        return mostLikedWorkouts
    }
    
    func getRecommendedWorkouts() -> [Workout] {
        return recommendedWorkouts
    }
    
    func getMuscleBuildingWorkouts() -> [Workout] {
        return muscleBuildingWorkouts
    }
    
    func getBodyToningWorkouts() -> [Workout] {
        return bodyToningWorkouts
    }
    
    /*
    func getMyPlan() -> [Workout] {
        return myPlan
    }
    
    func getOther() -> [Workout] {
        return other
    }
    */
}
