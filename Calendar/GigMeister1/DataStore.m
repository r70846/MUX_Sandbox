//
//  DataStore.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/31/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

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
        
        
        //DATE & TIME FUNCTIONS ////////////////////////////
        
        //Get todays date
        NSDate *oToday = [NSDate date];
        
        // Create calendar object needed to use date components
        NSCalendar *oCalendar = [NSCalendar currentCalendar];
        
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
        for (int x=0; x < 20 ; x++)
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
            
            oDate = [oCalendar dateByAddingComponents:dayComponent toDate:oDate options:0];
        }
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

