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
    GigDateClass *gigDate1 = [[GigDateClass alloc] init];
    gigDate1.status = @"Open";
    gigDate1.notes = @"";
    //gigDate1.date = Now();
    gigDate1.flag = [UIImage imageNamed:@"clear25.png"];
    
    GigDateClass *gigDate2 = [[GigDateClass alloc] init];
    gigDate2.status = @"Open";
    gigDate2.notes = @"";
    //gigDate2.date = Now();
    gigDate2.flag = [UIImage imageNamed:@"grey25.png"];
    
    GigDateClass *gigDate3 = [[GigDateClass alloc] init];
    gigDate3.status = @"Open";
    gigDate3.notes = @"";
    //gigDate3.date = Now();
    gigDate3.flag = [UIImage imageNamed:@"green25.png"];
    
    gigDateArray = [[NSMutableArray alloc] initWithObjects: gigDate1, gigDate2, gigDate3, nil];
    
    
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
    

    
    /*
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicianCell"];
    
    if (cell != nil)
    {
        BandMateClass *currentMusician = [musicianArray objectAtIndex:indexPath.row];
        
        [cell refreshCellWithInfo:currentMusician.name instString:currentMusician.instrument cellImage:currentMusician.instImage];
        
    }
    return cell;
     
     */
    if (cell != nil)
    {
        
        GigDateClass *currentGigDate = [gigDateArray objectAtIndex:indexPath.row];
        
        [cell refreshCellWithInfo:currentGigDate.status dateString:currentGigDate.status cellImage:currentGigDate.flag];

        
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
        
        //detailViewController.gigDateString = @"My Gig Date";
        //detailViewController.gigDateString = [gigDateArray objectAtIndex:indexPath.row];

        GigDateClass *currentGigDate = [gigDateArray objectAtIndex:indexPath.row];
        detailViewController.currentGigDate = currentGigDate;
        
    }
    
    
    //GigDateDetail is segue name
    /*
    DetailViewController *detailViewController = segue.destinationViewController;
    
    if (detailViewController != nil)
    {
        //Cast the "sender" as a TableView Cell
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [mainTableView indexPathForCell:cell];
        
        //Get Band Mate object from the array based on the item in the tableview we clicked on
        BandMateClass *currentMusician = [musicianArray objectAtIndex:indexPath.row];
        
        //Set the currentMusician property in detail view to the chosen one
        detailViewController.currentMusician = currentMusician;
    }
    */
}
/////////////////////////////



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
