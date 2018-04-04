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
        Category(title: "MUSCLE GROUP", imageName: "sixplates.png")
    ]
    
    let allWorkouts = [
        Workout(title: "Chest Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Pectoral Fly", imageName: "sixplates.png", timeLength: "1:24", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Incline", imageName: "sixplates.png", timeLength: "2:53", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Decline", imageName: "gloves.png", timeLength: "1:42", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Flat", imageName: "bicepcurl.png", timeLength: "4:45", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Machine", imageName: "sixplates.png", timeLength: "0:45", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Dips", imageName: "gloves.png", timeLength: "3:41", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Pull", imageName: "weightbelt.png", timeLength: "2:25", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Machine", imageName: "gloves.png", timeLength: "2:43", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Curl", imageName: "sixplates.png", timeLength: "1:44", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let mostViewedWorkouts = [
        Workout(title: "Chest Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Pectoral Fly", imageName: "sixplates.png", timeLength: "1:24", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let mostLikedWorkouts = [
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Pectoral Fly", imageName: "sixplates.png", timeLength: "1:24", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let recommendedWorkouts = [
        Workout(title: "Tricep Dips", imageName: "gloves.png", timeLength: "3:41", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Pull", imageName: "weightbelt.png", timeLength: "2:25", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Machine", imageName: "gloves.png", timeLength: "2:43", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Curl", imageName: "sixplates.png", timeLength: "1:44", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let muscleBuildingWorkouts = [
        Workout(title: "Chest Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Dips", imageName: "gloves.png", timeLength: "3:41", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let bodyToningWorkouts = [
        Workout(title: "Pectoral Fly", imageName: "sixplates.png", timeLength: "1:24", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Incline", imageName: "sixplates.png", timeLength: "2:53", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Decline", imageName: "gloves.png", timeLength: "1:42", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let backWorkouts = [
        Workout(title: "High Row", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY?playsinline=1&autoplay=1", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Low Row", imageName: "gloves.png", timeLength: "0:29", videoCode: "8zqv9dZvxB0?ecver=2?playsinline=1&autoplay=1", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Lateral Pull", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "_kAlQ5Bh5aY?playsinline=1&autoplay=1", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Close Grip", imageName: "bicepcurl.png", timeLength: "4:45", videoCode: "8zqv9dZvxB0?ecver=2?playsinline=1&autoplay=1", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Lateral Fly", imageName: "bicepcurl.png", timeLength: "4:45", videoCode: "_kAlQ5Bh5aY?playsinline=1&autoplay=1", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bent Over Row", imageName: "bicepcurl.png", timeLength: "4:45", videoCode: "8zqv9dZvxB0?ecver=2?playsinline=1&autoplay=1", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Back Fly", imageName: "bicepcurl.png", timeLength: "4:45", videoCode: "_kAlQ5Bh5aY?playsinline=1&autoplay=1", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    
    let shoulderWorkouts = [
        Workout(title: "Shoulder Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Shoulder Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Plate Raise", imageName: "bicepcurl.png", timeLength: "4:45", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Shoulder Fly", imageName: "bicepcurl.png", timeLength: "4:45", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let chestWorkouts = [
        Workout(title: "Chest Press", imageName: "bicepcurl.png", timeLength: "5:30", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Dumbbell Press", imageName: "gloves.png", timeLength: "0:29", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Pectoral Fly", imageName: "sixplates.png", timeLength: "1:24", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Machine", imageName: "weightbelt.png", timeLength: "2:59", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Incline", imageName: "sixplates.png", timeLength: "2:53", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Decline", imageName: "gloves.png", timeLength: "1:42", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Chest Flat", imageName: "bicepcurl.png", timeLength: "4:45", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let bicepWorkouts = [
        Workout(title: "Bicep Machine", imageName: "gloves.png", timeLength: "2:43", videoCode: "_kAlQ5Bh5aY?", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Curl", imageName: "sixplates.png", timeLength: "1:44", videoCode: "8zqv9dZvxB0?ecver=2?", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Preacher Curl", imageName: "sixplates.png", timeLength: "1:44", videoCode: "8zqv9dZvxB0?ecver=2?", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Bicep Curl 2", imageName: "sixplates.png", timeLength: "1:44", videoCode: "8zqv9dZvxB0?ecver=2?", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let tricepWorkouts = [
        Workout(title: "Tricep Machine", imageName: "sixplates.png", timeLength: "0:45", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Dips", imageName: "gloves.png", timeLength: "3:41", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Pull Down Cable", imageName: "weightbelt.png", timeLength: "2:25", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Tricep Pull Down Bar", imageName: "weightbelt.png", timeLength: "2:25", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
    ]
    
    let abdominalWorkouts = [
        Workout(title: "Crunches", imageName: "sixplates.png", timeLength: "0:45", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Plank", imageName: "gloves.png", timeLength: "3:41", videoCode: "8zqv9dZvxB0?ecver=2", level: "Beginner", type: "Strength", likes: "5 Likes"),
        Workout(title: "Russian Twist", imageName: "weightbelt.png", timeLength: "2:25", videoCode: "_kAlQ5Bh5aY", level: "Beginner", type: "Strength", likes: "5 Likes")
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
    
    func getBackWorkouts() -> [Workout] {
        return backWorkouts
    }
    
    func getShoulderWorkouts() -> [Workout] {
        return shoulderWorkouts
    }
    
    func getChestWorkouts() -> [Workout] {
        return chestWorkouts
    }
    
    func getBicepWorkouts() -> [Workout] {
        return bicepWorkouts
    }
    
    func getTricepWorkouts() -> [Workout] {
        return tricepWorkouts
    }
    
    func getAbdominalWorkouts() -> [Workout] {
        return abdominalWorkouts
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
