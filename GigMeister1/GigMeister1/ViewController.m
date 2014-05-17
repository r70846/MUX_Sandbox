//
//  ViewController.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController


//Number of rows in table will equal the number of BandMateClass objects in my data array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [musicianArray count];
    return 3;
}

//Set each custom cell to reflect data from the same index of my BandMateClass objects array
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    

    
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
        cell.textLabel.text = [gigDateArray objectAtIndex:indexPath.row];
        
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
        detailViewController.gigDateString = [gigDateArray objectAtIndex:indexPath.row];
        
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

- (void)viewDidLoad
{
    
    
    gigDateArray = [[NSMutableArray alloc] initWithObjects:@"date1", @"date2", @"date3", nil];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
