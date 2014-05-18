//
//  ViewController.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

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

//Set each custom cell to reflect data from the same index of my BandMateClass objects array
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
        
  
        [cell refreshCellWithInfo:dateDay dateString:dateDate cellImage:currentGigDate.flag];

    }
    
    /*
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicianCell"];
    
    if (cell != nil)
    {
        BandMateClass *currentMusician = [musicianArray objectAtIndex:indexPath.row];
        
        [cell refreshCellWithInfo:currentMusician.name instString:currentMusician.instrument cellImage:currentMusician.instImage];
        
    }
    return cell;
    */
    
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
    
    
    //Get todays date
    NSDate *oDate = [NSDate date];

    //Create component to iterated the date
    NSCalendar *oCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 1;
    
    
    //Load Array with GigDate Objects
    for (int x=0; x < 10 ; x++)
    {
        //Create temporary GigDate object to load array
        GigDateClass *oTemp = [[GigDateClass alloc] init];
        oTemp.status = @"Open";
        oTemp.notes = @"";
        oTemp.date = oDate;
        oTemp.flag = [UIImage imageNamed:@"white25.png"];
        [gigDateArray addObject:oTemp];
        
        oDate = [oCalendar dateByAddingComponents:dayComponent toDate:oDate options:0];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
