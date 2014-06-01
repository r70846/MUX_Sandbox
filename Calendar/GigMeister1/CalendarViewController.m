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
#import "WeekClass.h"
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
    gigWeekArray = [[NSMutableArray alloc] init];
    
    //Load Each Week
    [self loadWeeks];

    //Load out contents of gigWeekArray
    //[self printWeeks];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)loadWeeks
{
    //INIT SINGLE WEEK ARRAY
    NSMutableArray *aWeek = [[NSMutableArray alloc] init];
    for (int i=0; i < 7 ; i++)
    {
        [aWeek addObject:[NSNumber numberWithInteger:-1]];
        //[aWeek addObject:nil];
    }
    
    //LOOP ALL DATES IN DATASTORE
    for (int x=0; x < dataStore.gigDateArray.count ; x++)
    {
        
        
        
        //Get the current gigDate object
        GigDateClass *currentGigDate = [dataStore.gigDateArray objectAtIndex:x];
        
        
        //GET THE "MONTH YEAR"
        NSDateFormatter *monthYrFormatter = [[NSDateFormatter alloc] init];
        if (monthYrFormatter != nil)
        {
            [monthYrFormatter setDateFormat:@"MMM yyyy"];
        }
        
        //NSString *strMonthYear = [[NSString alloc] initWithFormat:@"%@", [monthYrFormatter stringFromDate:currentGigDate.date]];
        
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
            [self addWeek:aWeek];
            
            //INIT SINGLE WEEK ARRAY
            NSMutableArray *aWeek = [[NSMutableArray alloc] init];
            for (int i=0; i < 7 ; i++)
            {
                [aWeek addObject:[NSNumber numberWithInteger:-1]];
                //[aWeek addObject:nil];
            }
        }
    }
}

-(void)addWeek:(NSMutableArray*)aData
{
    //NSMutableArray *aTemp = aData;
    
    NSMutableArray *aTemp = [NSMutableArray arrayWithCapacity: [aData count]];
    for (int i=0; i < 7 ; i++)
    {
        //[aTemp addObject:[NSNumber numberWithInteger:[aData objectAtIndex:i] ]];
        
        [aTemp addObject:[aData objectAtIndex:i]];
        
        //[aWeek addObject:nil];
    }
    
                             
    [gigWeekArray addObject:aTemp];
}


 
- (void)printWeeks
{
    //LOOP ALL DATES IN DATASTORE
    for (int y=0; y < gigWeekArray.count ; y++)
    {
        NSMutableArray *currentWeek = [gigWeekArray objectAtIndex:y];
        for (int z=0; z < 7 ; z++)
        {
           int iTmp = [[currentWeek objectAtIndex:z] integerValue];
            NSLog(@"Week: %d, Index %d", y, iTmp);
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
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
    NSArray *sectionMembers = [dataStore.sectionTitleDict objectForKey:sectionTitle];
    //return [sectionMembers count];
    
    return [gigWeekArray count];
    
}


// 4.	cellForRowAtIndexPath: //Set each custom cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WeekCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalCell"];
    
    if (cell != nil)
    {
        
        NSMutableArray *aWeek = [gigWeekArray objectAtIndex:indexPath.row];
        
        
        [cell refreshCellWithInfo:aWeek cellIndexPath:indexPath];
        
    }
    return cell;
}


//5.	sectionIndexTitlesForTableView:

//6.	sectionForSectionIndexTitle:





////////////////////////  Dealing with Section Headers  //////////////////////

/*

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [animalSectionTitles count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [animalSectionTitles objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [animalSectionTitles objectAtIndex:section];
    NSArray *sectionAnimals = [animals objectForKey:sectionTitle];
    return [sectionAnimals count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *sectionTitle = [animalSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionAnimals = [animals objectForKey:sectionTitle];
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    cell.textLabel.text = animal;
    cell.imageView.image = [UIImage imageNamed:[self getImageFilename:animal]];
    
    return cell;
}

*/
////////////////////////  Dealing with Section Headers  //////////////////////


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
}

@end
