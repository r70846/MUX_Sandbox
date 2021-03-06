//
//  ViewController.h
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

#import <UIKit/UIKit.h>
#import "DataStore.h"


@interface ViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *mainTableView;    //Table view reference
    
    //Variable to hold shared instance of my data store object
    DataStore *dataStore;
    
}


@end
