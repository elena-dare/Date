//
//  Date.swift
//  Date
//
//  Created by Elena Da Re on 11/1/14.
//  Copyright (c) 2014 John Doe. All rights reserved.
//

import UIKit

class Date: NSObject {
	//year, month, and day are stored properties.
	var year: Int;
	
	var month: Int {
		willSet(newMonth) {	//a property observer
			if newMonth < 1 || newMonth > 12 {
				println("bad month \(newMonth)");
			}
		}
	}
	
	var day: Int {
		willSet(newDay) {
			if newDay < 1 || newDay > monthLength() {
				println("bad day \(newDay) for month \(month)");
			}
		}
	}
	
	//description is a read-only computed property.
	
	override var description: String {
		return "\(month)/\(day)/\(year)";
	}
	
	init(month: Int, day: Int, year: Int) {
		self.year = year;	//self.year is the property, year is the parameter
		self.month = month;
		self.day = day;
		super.init();
	}
	
	//Put today's date into the newborn Date object.
	
	override init() {
		let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!;
		let today: NSDate = NSDate();
		let unitFlags: NSCalendarUnit =
		NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.DayCalendarUnit;
		let components: NSDateComponents = calendar.components(unitFlags, fromDate: today);
		
		year  = components.year;
		month = components.month;
		day   = components.day;
		super.init();
	}
	
	//Return the number of days in the month property (1 to 31 inclusive).
	
	func monthLength() -> Int {
		let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!;
		
		let components: NSDateComponents = NSDateComponents();
		components.year = year;
		components.month = month;
		components.day = day;
		
		let range: NSRange = calendar.rangeOfUnit(NSCalendarUnit.CalendarUnitDay,
			inUnit: NSCalendarUnit.CalendarUnitMonth,
			forDate: calendar.dateFromComponents(components)!);
		
		return range.length;
	}
	
	//Advance this Date one day into the future.
	//This method accepts no parameters.
	
	func next() -> Void {
		if day < monthLength() {
			++day;
			return;
		}
		
		day = 1;
		if month < Date.yearLength() {
			++month;
			return;
		}
		
		month = 1;
		++year;
	}
	
	
	//Func to go one day backward
	
	func prev() -> Void {
		
		if day > 1 {
			--day;
			
		} else {
			if month > 1 {
				--month;
			} else {
				month = Date.yearLength();
				--year;
			}
			day = monthLength();
		}
		
	}
	
	/*
	Advance this Date many days into the future.
	This method accepts one parameter.
	It does the bulk of its work by calling the above method next() over and over.
	*/
	
	func next(distance: Int) {
		if distance < 0 {
			println("argument \(distance) of next must be non-negative");
			return;
		}
		
		for var i: Int = 1; i <= distance; ++i {
			next();
		}
	}
	
	/*
	Advance this Date many days into the past.
	This method accepts one parameter.
	It does the bulk of its work by calling the above method prev() over and over.
	*/
	
	func prev(distance: Int) {
		if distance < 0 {
			println("argument \(distance) of next must be non-negative");
			return;
		}
		
		for var i: Int = 1; i <= distance; ++i {
			prev();
		}
	}
	
	// Return the number of months in a year.  A type method is marked with the keyword "class".
	
	class func yearLength() -> Int {
		return 12;
	}
	
	
	
}
