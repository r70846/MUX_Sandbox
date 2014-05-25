//
//  TimeViewController.h
//  GigMeister1
//
//  Created by Russell Gaspard on 5/25/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 3
 Mobile Development
 MUX 1405
 
 */

#import <UIKit/UIKit.h>
#import "GigDateClass.h"

@interface TimeViewController : UIViewController
{
    
    IBOutlet UIButton *btnSave;
    IBOutlet UIButton *btnCall;
    IBOutlet UIButton *btnStart;
    
    
    IBOutlet UILabel *gigDayLabel;
    IBOutlet UILabel *gigDateLabel;
    IBOutlet UILabel *callTimeLabel;
    IBOutlet UILabel *startTimeLabel;
    
    

    IBOutlet UIDatePicker *timePicker;
    
    
};

-(IBAction)onClick:(id)sender;
-(IBAction)onChange:(id)sender;

@property (nonatomic, strong)GigDateClass *currentGigDate;
@property (nonatomic, strong)NSDate *calltime;
@property (nonatomic, strong)NSDate *starttime;

//@property (nonatomic, strong)NSString *payment;
//@property (nonatomic, strong)NSString *notes;

@property int caller;

@end
