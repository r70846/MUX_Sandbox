//
//  CalendarViewController.h
//  GigMeister1
//
//  Created by Russell Gaspard on 5/31/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *calTableView;    //Table view reference
    NSMutableArray *gigWeekArray;          //Reference to main array that will hold my GigDate objects
}
@end
