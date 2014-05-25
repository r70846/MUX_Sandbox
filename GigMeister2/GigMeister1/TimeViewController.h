//
//  TimeViewController.h
//  GigMeister1
//
//  Created by Russell Gaspard on 5/25/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GigDateClass.h"

@interface TimeViewController : UIViewController
{
    
    
    IBOutlet UIDatePicker *timePicker;
    
    
}



@property (nonatomic, strong)GigDateClass *currentGigDate;
@property (nonatomic, strong)NSDate *calltime;
@property (nonatomic, strong)NSDate *starttime;
@property (nonatomic, strong)NSString *payment;
@property (nonatomic, strong)NSString *notes;

@end
