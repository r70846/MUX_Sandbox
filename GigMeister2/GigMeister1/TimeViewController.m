//
//  TimeViewController.m
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


#import "TimeViewController.h"

@interface TimeViewController ()

@end

@implementation TimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    //Hide keyboard retract button
    btnClose.hidden = true;
    
    //Deal with the keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    //Create format for date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (dateFormatter != nil)
    {
        [dateFormatter setDateFormat:@"EEE MMM d, yyyy"];
    }
    
    //Build the date into a string based on my date format
    NSString *dateDate = [[NSString alloc] initWithFormat:@"%@", [dateFormatter stringFromDate: self.currentGigDate.date]];
    
    //Create format for times
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"h:mm a"];
    
    //Build the call into a string based on my time format
    NSString *callTime = [[NSString alloc] initWithFormat:@"%@", [timeFormatter stringFromDate: self.calltime]];
    
    //Build the start into a string based on my time format
    NSString *startTime = [[NSString alloc] initWithFormat:@"%@", [timeFormatter stringFromDate: self.starttime]];
    
    //Fill label elements with data from the other views
    gigDateLabel.text = dateDate;
    venueLabel.text = self.venue;
    callTimeLabel.text = callTime;
    startTimeLabel.text = startTime;
    termsView.text = self.notes;
    
    //Fill time picker
    if(self.caller == 3) //call time button tag
    {
        
            callTimeLabel.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
        timePicker.date = self.calltime;
    }
    else if(self.caller == 4) //start time button tag
    {
       startTimeLabel.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
        timePicker.date = self.starttime;
    }
    
    if(self.caller == 5)
    {
        [termsView becomeFirstResponder];
    }
    
    [super viewWillAppear:(BOOL)animated];
}

-(void)keyboardWillShow:(NSNotification *)notification
{
    //Show keyboard retract button
    btnClose.hidden = false;
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    //Hide keyboard retract button
    btnClose.hidden = true;
}

-(IBAction)onClick:(id)sender
{
    
    UIButton *btn = sender;
    
    
    if(btn.tag == 1) //Close (Retract Keyboard Button)
    {
        //This should also dismiss the keyboard
        [termsView resignFirstResponder];
    }
    
    else if (btn.tag == 2) //Save ("Done") Button
    {
        //Back to detail view
        self.caller = 2;
        
        //Update notes view
        self.notes = termsView.text;
        
        [self performSegueWithIdentifier:@"unwindToDetailView" sender:sender];

    }
    
    else if (btn.tag == 3) //Select call time control
    {
        self.caller = 3;
        
            timePicker.date = self.calltime;
        
            callTimeLabel.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
        
            startTimeLabel.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    }
    
    else if (btn.tag == 4)  //Select start time control
    {
        self.caller = 4;
        
            timePicker.date = self.starttime;
        
            startTimeLabel.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
        
            callTimeLabel.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    }
    else if (btn.tag == 6)  //Clear Terms View
    {
        termsView.text = @"";
    }
}

-(IBAction)onChange:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)sender;
    if(picker != nil)
    {
        NSDate *oTime = picker.date;
        
        //Create format for times
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setDateFormat:@"h:mm a"];

        //Build the call into a string based on my time format
        NSString *newTime = [[NSString alloc] initWithFormat:@"%@", [timeFormatter stringFromDate: oTime]];

        if(self.caller == 3) //call time button tag
        {
            callTimeLabel.text = newTime;
            self.calltime = oTime;
            
        }
        else if(self.caller == 4) //start time button tag
        {
            startTimeLabel.text = newTime;
            self.starttime = oTime;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
