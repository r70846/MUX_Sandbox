//
//  AddRoleTVC.h
//  Staff Manager
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//


/*
#import <UIKit/UIKit.h>

@interface AddRoleTVC : UITableViewController

@end
 
*/



//#import
#import <UIKit/UIKit.h>

@class AddRoleTVC;
@protocol AddRoleTVCDelegate
-(void)theSaveButtonOnTheAddRoleTVCWasTapped:(AddRoleTVC *)controller;
@end

@interface AddRoleTVC : UITableViewController
@property (nonatomic, weak) id <AddRoleTVCDelegate> delegate;

-(IBAction)save:(id)sender;

@end

