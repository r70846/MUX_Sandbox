//
//  ViewController.h
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

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *mainTableView;    //Table view reference
    NSMutableArray *gigDateArray;          //Reference to main array that will hold my GigDate objects
}


@end
