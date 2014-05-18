//
//  DetailViewController.h
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GigDateClass.h"

@interface DetailViewController : UIViewController
{
    //Set up data outlets in detail view
    IBOutlet UILabel *gigDayLabel;
    IBOutlet UILabel *gigDateLabel;
    
    IBOutlet UITextField *venueName;
    IBOutlet UITextField *venueAddress;
    
    IBOutlet UITextField *contactName;
    IBOutlet UITextField *contactPhone;
    
    IBOutlet UIButton *btnEdit;
    IBOutlet UIButton *btnSave;
    
}


-(IBAction)onClick:(id)sender;


//@property (nonatomic, strong)NSString *gigDateString;
@property (nonatomic, strong)GigDateClass *currentGigDate;

@end
