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
    
    
    IBOutlet UIButton *btnClose;
    IBOutlet UIButton *btnDone;
    IBOutlet UIButton *btnClear;
    
    IBOutlet UIButton *btnCall;
    IBOutlet UIButton *btnStart;
    
    IBOutlet UITextView *termsView;
    
    IBOutlet UILabel *gigDateLabel;
    IBOutlet UILabel *venueLabel;
    IBOutlet UILabel *callTimeLabel;
    IBOutlet UILabel *startTimeLabel;
    
    

    IBOutlet UIDatePicker *timePicker;
    
    
};

-(IBAction)onClick:(id)sender;
-(IBAction)onChange:(id)sender;

@property (nonatomic, strong)GigDateClass *currentGigDate;
@property (nonatomic, strong)NSString *venue;
@property (nonatomic, strong)NSDate *calltime;
@property (nonatomic, strong)NSDate *starttime;
@property (nonatomic, strong)NSString *notes;

@property int caller;

@end
