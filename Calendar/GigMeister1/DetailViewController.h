//
//  DetailViewController.h
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
#import "GigDateClass.h"

@interface DetailViewController : UIViewController
{
    //Set up data outlets in detail view
    
    //IBOutlet UIButton *btnEdit;
    
    IBOutlet UIButton *btnClose;
    IBOutlet UIButton *btnSave;

    
    IBOutlet UILabel *gigDayLabel;
    IBOutlet UILabel *gigDateLabel;
    
    IBOutlet UISwitch *switchConfirmed;
    
    IBOutlet UITextField *venueName;
    IBOutlet UITextField *venueAddress;
    
    IBOutlet UITextField *contactName;
    IBOutlet UITextField *contactPhone;
    
    IBOutlet UILabel *callTimeLabel;
    IBOutlet UILabel *startTimeLabel;
    
    IBOutlet UITextView *termsView;
}


-(IBAction)onClick:(id)sender;

-(void)editMode;

//Set the object property
@property (nonatomic, strong)GigDateClass *currentGigDate;

//Set individual properties - before saving to object
@property (nonatomic, strong)NSDate *calltime;
@property (nonatomic, strong)NSDate *starttime;
@property (nonatomic, strong)NSString *callstring;
@property (nonatomic, strong)NSString *startstring;
@property (nonatomic, strong)NSString *venueNameString;
@property (nonatomic, strong)NSString *venueAddressString;
@property (nonatomic, strong)NSString *contactNameString;
@property (nonatomic, strong)NSString *contactPhoneString;
@property (nonatomic, strong)NSString *notes;

@end
