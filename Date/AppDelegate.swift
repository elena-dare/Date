//
//  AppDelegate.swift
//  Date
//
//  Created by Elena Da Re on 11/1/14.
//  Copyright (c) 2014 John Doe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		
		//Demonstrate that we can call a type method
		//even when no objects of the type currently exist.
		println("A year has \(Date.yearLength()) months.");
		
		//Call the init method that takes no parameters.
		var today: Date = Date();
		
		//Two ways to do print the same string.
		println("Today is \(today.description).");
		println("Today is \(today).");
		
		println("Today is day number \(today.day) out of \(today.monthLength()) in month number \(today.month).");
		
		//Also calls the willSet and didSet property observers (if any) for the day property.
		today.day = 1;
		
		//Move the object one day forward.
		today.next();
		println("The second day of this month is \(today).");
		
		today.day = 1;
		
		//Move the object one day backward.
		today.prev();
		println("The day before today was \(today).");
		
		//Call the init method that takes three parameters.
		var independenceDay: Date = Date(month: 7, day: 4, year: 1776);
		println("Independence Day was \(independenceDay).");
		
		//Move the object one month forward.
		independenceDay.next(independenceDay.monthLength());
		println("America was one month old on \(independenceDay).");
		
		//Move the object one month backward.
		independenceDay.prev(independenceDay.monthLength());
		println("America was newborn on \(independenceDay).");
		
		
		return true
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

