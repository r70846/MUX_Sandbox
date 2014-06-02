//
//  ViewController.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 4
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
    
    //Setup my variable as shared instance of my data store
    dataStore = [DataStore sharedInstance];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//Number of rows in table will equal the number of BandMateClass objects in my data array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [dataStore.gigDateArray count];
}

//Set each custom cell to reflect data from the same index of my GigDateClass objects array
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    if (cell != nil)
    {
        
        GigDateClass *currentGigDate = [dataStore.gigDateArray objectAtIndex:indexPath.row];
        
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
        GigDateClass *currentGigDate = [dataStore.gigDateArray objectAtIndex:indexPath.row];
        
        //Set the currentGigDate property in detail view to the chosen one
        detailViewController.currentGigDate = currentGigDate;
        
    }
    
}

-(IBAction)done:(UIStoryboardSegue*)segue
{
    DetailViewController *detailView = segue.sourceViewController;
    GigDateClass *currentGigDate = detailView.currentGigDate;
    dataStore.gigDateArray[currentGigDate.index] = currentGigDate;
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
