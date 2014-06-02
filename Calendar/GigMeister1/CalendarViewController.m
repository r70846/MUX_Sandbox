//
//  CalendarViewController.m
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

#import "CalendarViewController.h"
#import "SelectionViewController.h"
#import "GigDateClass.h"
#import "DataStore.h"
#import "WeekCell.h"


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
    
    
    //SETUP SHARED INSTANCE OF DATASTORE
    dataStore = [DataStore sharedInstance];

    
    //INIT WEEKS ARRAY
    //gigWeekArray = [[NSMutableArray alloc] init];
    
    //Load Each Week
    [self loadWeeks];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self->calTableView reloadData]; // to reload selected cell
}

- (void)loadWeeks
{
    //INIT SINGLE WEEK ARRAY ((DO I NEED THIS??))
    NSMutableArray *aWeek = [[NSMutableArray alloc] init];
    for (int i=0; i < 7 ; i++)
    {
        [aWeek addObject:[NSNumber numberWithInteger:-1]];
        //[aWeek addObject:nil];
    }
    
    //LOOP ALL DATES IN DATASTORE gigDateArray
    for (int x=0; x < dataStore.gigDateArray.count ; x++)
    {
        
        //Get the current gigDate object
        GigDateClass *currentGigDate = [dataStore.gigDateArray objectAtIndex:x];
        
        
        //Create format to sort "Month Year" headers by date
        NSDateFormatter *headerSortForm = [[NSDateFormatter alloc] init];
        [headerSortForm setDateFormat:@"yyyyMM"];
        
        
        //GET THE DAY
        NSDateFormatter *iDayFormatter = [[NSDateFormatter alloc] init];
        if (iDayFormatter != nil)
        {
            [iDayFormatter setDateFormat:@"e"];
        }
        int iDay = [[[NSString alloc] initWithFormat:@"%@", [iDayFormatter stringFromDate: currentGigDate.date]] intValue];
        
        //Place the day in the week (save index of currentGigDate)
        aWeek[iDay - 1] = [NSNumber numberWithInt:x];
        
        //If week is done, save current week in the Week array
        if(iDay == 7)
        {
            //[gigWeekArray addObject:aWeek];
            //Need to add this aWeek to my dataStore.calendarDict
            
            
            //Build the date into a sortable format
            NSString *sectionHeader = [[NSString alloc] initWithFormat:@"%@", [headerSortForm stringFromDate: currentGigDate.date]];
            
            //Pass the completed 'week' ans section header to support function
            [self addWeek:aWeek sectionHeader:sectionHeader];
            
            //INIT SINGLE WEEK ARRAY ((DO I NEED THIS??))
            NSMutableArray *aWeek = [[NSMutableArray alloc] init];
            for (int i=0; i < 7 ; i++)
            {
                [aWeek addObject:[NSNumber numberWithInteger:-1]];
                //[aWeek addObject:nil];
            }
        }
    }
}

-(void)addWeek:(NSMutableArray*)aData sectionHeader:(NSString*)sectionHeader
{
    //NSMutableArray *aTemp = aData;
    
    NSMutableArray *aTemp = [NSMutableArray arrayWithCapacity: [aData count]];
    for (int i=0; i < 7 ; i++)
    {
        //[aTemp addObject:[NSNumber numberWithInteger:[aData objectAtIndex:i] ]];
        
        [aTemp addObject:[aData objectAtIndex:i]];
        
        //[aWeek addObject:nil];
    }
    
    //Pull array of 'aWeeks' from global calendar dictionary
    NSMutableArray *sectionArray = [dataStore.calendarDict objectForKey:sectionHeader];
    
    //Add new week to array of 'aWeeks'
    [sectionArray addObject:aTemp];

    //Overwrite expanded 'aWeeks' array back to calendarDict
    [dataStore.calendarDict setValue:sectionArray forKey:sectionHeader];
    
    //Legacy code - add to my gigWeekArray - hopefully will not use this!
    //[gigWeekArray addObject:aTemp];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 Steps to set up a scrolling index
 
 1.	numberOfSectionsInTableView:
 
 2.	titleForHeaderInSection:
 
 3.	numberOfRowsInSection:
 
 4.	cellForRowAtIndexPath:
 
 5.	sectionIndexTitlesForTableView:
 
 6.	sectionForSectionIndexTitle:
 
 */


// 1.	numberOfSectionsInTableView:

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [dataStore.sectionTitleArray count];
}

// 2.	titleForHeaderInSection:

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSString *sKey = [dataStore.sectionTitleArray objectAtIndex:section];
    
    return [dataStore.sectionTitleDict objectForKey:sKey];
}

//3.	numberOfRowsInSection: //we have to tell the table view the number of rows for a particular section

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [dataStore.sectionTitleArray objectAtIndex:section];
    NSArray *sectionArray = [dataStore.calendarDict objectForKey:sectionTitle];
    
    //Debug Code
    //NSLog(@"Members in the %@ section: %d", sectionTitle, [sectionArray count]);
    
    //return [gigWeekArray count];
    return [sectionArray count];
    
}


// 4.	cellForRowAtIndexPath: //Set each custom cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeekCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalCell"];

    if (cell != nil)
    {
        // Configure the cell...
        ////NSString *sectionTitle = [animalSectionTitles objectAtIndex:indexPath.section];
        NSString *sectionTitle = [dataStore.sectionTitleArray objectAtIndex:indexPath.section];
    
        //NSArray *sectionAnimals = [animals objectForKey:sectionTitle];
        NSArray *sectionArray= [dataStore.calendarDict objectForKey:sectionTitle];
    
        NSMutableArray *aWeek = [sectionArray objectAtIndex:indexPath.row];
        
        //NSMutableArray *aWeek = [gigWeekArray objectAtIndex:indexPath.row];
        
        
        [cell refreshCellWithInfo:aWeek cellIndexPath:indexPath];
    }
    return cell;
}



//5.	sectionIndexTitlesForTableView:

//6.	sectionForSectionIndexTitle:


//Called if we go to a detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    SelectionViewController *selectionViewController = segue.destinationViewController;
    
    if (selectionViewController != nil)
    {
        
        //Cast the "sender" as a TableView Cell
        //UITableViewCell *cell = (UITableViewCell*)sender;
        //NSIndexPath *indexPath = [calTableView indexPathForCell:cell];
        
        
        //selectionViewController.dataString = [gigWeekArray objectAtIndex:indexPath.row];
    }
}

@end
