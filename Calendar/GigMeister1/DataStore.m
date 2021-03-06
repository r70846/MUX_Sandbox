//
//  DataStore.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/31/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 4
 Mobile Development
 MUX 1405
 
 */

#import "DataStore.h"
#import "GigDateClass.h"

@implementation DataStore

static DataStore *_sharedInstance;


- (id) init
{
	if (self = [super init])
	{
        //Built mutable array to hold gig dates (GigDateClass objects)
        _gigDateArray = [[NSMutableArray alloc] init];
        
        //Built mutable dictionary to hold month titles
        _sectionTitleDict = [[NSMutableDictionary alloc] init];

        //Built mutable dictionary to hold month titles
        _calendarDict = [[NSMutableDictionary alloc] init];
        
        //Built mutable array to hold month titles
        _sectionTitleArray= [[NSArray alloc] init];
        
        
        //DATE & TIME FUNCTIONS ////////////////////////////
        
        //Get todays date
        NSDate *oToday = [NSDate date];
        
        // Create calendar object needed to use date components
        NSCalendar *oCalendar = [NSCalendar currentCalendar];
        
        //Create format for "Month Year" section header
        NSDateFormatter *monthHeaderForm = [[NSDateFormatter alloc] init];
        [monthHeaderForm setDateFormat:@"MMMM yyyy"];
        
        //Create format to sort "Month Year" headers by date
        NSDateFormatter *headerSortForm = [[NSDateFormatter alloc] init];
        [headerSortForm setDateFormat:@"yyyyMM"];
        
        
        //Initialize time to noon
        NSString *setTime = @"12:00 PM";
        
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setDateFormat:@"h:mm a"];
        
        NSDateComponents *timeComponents = [oCalendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:[timeFormatter dateFromString:setTime]];
        
        NSDateComponents *dateComponents = [oCalendar components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:oToday];
        
        //Use current date for the time object
        timeComponents.year = dateComponents.year;
        timeComponents.month = dateComponents.month;
        timeComponents.day = dateComponents.day;
        
        //Build final date entry
        NSDate *oDate = [oCalendar dateFromComponents:timeComponents];
        
        //Create "single day" component to iterated the date
        NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
        dayComponent.day = 1;
        
        
        //Load Array with GigDate Objects
        for (int x=0; x < 100 ; x++)
        {
            
            //Create temporary GigDate object to load array
            GigDateClass *oTemp = [[GigDateClass alloc] init];
            oTemp.index = x;
            oTemp.status = @"Open";
            oTemp.booked = false;
            oTemp.confirmed = false;
            oTemp.venue = @"";
            oTemp.address = @"";
            oTemp.contact = @"";
            oTemp.phone = @"";
            oTemp.notes = @"";
            oTemp.date = oDate;
            oTemp.call = oDate;
            oTemp.start = oDate;
            oTemp.end = oDate;
            oTemp.flag = [UIImage imageNamed:@"white25.png"];
            [_gigDateArray addObject:oTemp];
            
            
            //Build the date into a section header based on my date format
            NSString *sectionHeader = [[NSString alloc] initWithFormat:@"%@", [monthHeaderForm stringFromDate: oDate]];
            
            //Build the date into a sortable format
            NSString *sectionSorter = [[NSString alloc] initWithFormat:@"%@", [headerSortForm stringFromDate: oDate]];
            
            //Add to the dictionary (if its new or simply overwrite repeated key)
            [_sectionTitleDict setValue:sectionHeader forKey:sectionSorter];
            
            oDate = [oCalendar dateByAddingComponents:dayComponent toDate:oDate options:0];
        }
        
        //Sort the dictionary keys and dump into array
        _sectionTitleArray = [[_sectionTitleDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
        
        
        for (int z=0; z < _sectionTitleArray.count ; z++)
        {
            NSString *sKey = [_sectionTitleArray objectAtIndex:z];

            NSMutableArray* aTemp = [[NSMutableArray alloc] initWithCapacity:1];
            
            //Add keys to the new dictionary to build calendar
            [_calendarDict setValue:aTemp forKey:sKey];
        }
        
        
        
        ///////////////////////////////////////////////////////////////
        // DEBUG LOGGING
        ///////////////////////////////////////////////////////////////
        /*
        NSLog(@"Month section headers count %d", _sectionTitleArray.count);
        for (int z=0; z < _sectionTitleArray.count ; z++)
        {
            NSString *sKey = [_sectionTitleArray objectAtIndex:z];
            
            NSString *sTitle = [_sectionTitleDict objectForKey:sKey];
            
            NSLog(@"Key at index %d = %@", z, sTitle);
        }
        */
        //////////////////////////////////////////////////////////
        
        
	}
	return self;
}


+ (DataStore *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[DataStore alloc] init];
	}
    
	return _sharedInstance;
}



@end

