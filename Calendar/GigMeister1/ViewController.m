//
//  ViewController.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 3
 Mobile Development
 MUX 1405
 
 */

#import "ViewController.h"
#import "DetailViewController.h"
#import "GigDateClass.h"
#import "CustomCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //Call method to load data into array
    [self loadGigDates];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//Number of rows in table will equal the number of BandMateClass objects in my data array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [gigDateArray count];
}

//Set each custom cell to reflect data from the same index of my GigDateClass objects array
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    if (cell != nil)
    {
        
        GigDateClass *currentGigDate = [gigDateArray objectAtIndex:indexPath.row];
 
        
        //Create format for day
        NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
        if (dayFormatter != nil)
        {
            [dayFormatter setDateFormat:@"EEE"];
        }
        
        //Build the date into a string based on my day format
        NSString *dateDay = [[NSString alloc] initWithFormat:@"%@", [dayFormatter stringFromDate: currentGigDate.date]];
        
        //Create format for date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (dateFormatter != nil)
        {
            [dateFormatter setDateFormat:@"M/dd/YY"];
        }
        
        //Build the date into a string based on my day format
        NSString *dateDate = [[NSString alloc] initWithFormat:@"%@", [dateFormatter stringFromDate: currentGigDate.date]];
        
  
        [cell refreshCellWithInfo:dateDay dateString:dateDate eventString:currentGigDate.venue cellImage:currentGigDate.flag];

    }
    return cell;
}


//Called when we go to the detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    DetailViewController *detailViewController = segue.destinationViewController;
    
    if (detailViewController != nil)
    {
        
        //Cast the "sender" as a TableView Cell
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [mainTableView indexPathForCell:cell];

        //Get GigDate object from the array based on the item in the tableview we clicked on
        GigDateClass *currentGigDate = [gigDateArray objectAtIndex:indexPath.row];
        
        //Set the currentGigDate property in detail view to the chosen one
        detailViewController.currentGigDate = currentGigDate;
        
    }
    
}

//Function to load hard coded data into array of BandMate objects
- (void)loadGigDates
{
    //Built mutable array to hold gig dates (GigDateClass objects)
    gigDateArray = [[NSMutableArray alloc] init];
    
 
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
    for (int x=0; x < 10 ; x++)
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
        [gigDateArray addObject:oTemp];
        
        oDate = [oCalendar dateByAddingComponents:dayComponent toDate:oDate options:0];
    }
    
}

-(IBAction)done:(UIStoryboardSegue*)segue
{
    DetailViewController *detailView = segue.sourceViewController;
    GigDateClass *currentGigDate = detailView.currentGigDate;
    gigDateArray[currentGigDate.index] = currentGigDate;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self->mainTableView reloadData]; // to reload selected cell
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
