//
//  CalendarViewController.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/31/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "CalendarViewController.h"
#import "SelectionViewController.h"
#import "GigDateClass.h"
#import "DataStore.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    //Setup my variable as shared instance of my data store
    dataStore = [DataStore sharedInstance];

    dataStore.globalArray = [[NSMutableArray alloc] initWithObjects:@"hello", @"goodbye", @"taco", @"paco", nil];
    
    //Built mutable array to hold gig dates (GigDateClass objects)
    //gigWeekArray = [[NSMutableArray alloc] initWithObjects:@"hello", @"goodbye", @"taco", @"paco", nil];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Number of rows in table will equal the number of BandMateClass objects in my data array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
}

//Set each custom cell to reflect data from the same index of my GigDateClass objects array
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalCell"];
    
    if (cell != nil)
    {
        GigDateClass *currentGigDate = [dataStore.gigDateArray objectAtIndex:indexPath.row];
        
        //Create format for date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (dateFormatter != nil)
        {
            [dateFormatter setDateFormat:@"M/dd/YY"];
        }
        
        //Build the date into a string based on my day format
        NSString *dateString = [[NSString alloc] initWithFormat:@"%@", [dateFormatter stringFromDate: currentGigDate.date]];
        
        cell.textLabel.text = dateString;
        //cell.textLabel.text = [gigWeekArray objectAtIndex:indexPath.row];
        
            
    }
    return cell;
    
    /*
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
    */
}

//Called when we go to the detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    SelectionViewController *selectionViewController = segue.destinationViewController;
    
    if (selectionViewController != nil)
    {
        
        //Cast the "sender" as a TableView Cell
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [calTableView indexPathForCell:cell];
        
        
        selectionViewController.dataString = [gigWeekArray objectAtIndex:indexPath.row];
    }
    /*
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
    */
}

@end
