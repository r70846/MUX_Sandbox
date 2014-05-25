//
//  DetailViewController.m
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

#import "DetailViewController.h"
#import "TimeViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    //Create format for day
    NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
    if (dayFormatter != nil)
    {
        [dayFormatter setDateFormat:@"EEEE"];
    }
    
    //Build the date into a string based on my day format
    NSString *dateDay = [[NSString alloc] initWithFormat:@"%@", [dayFormatter stringFromDate: self.currentGigDate.date]];
    
    //Create format for date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (dateFormatter != nil)
    {
        [dateFormatter setDateFormat:@"MMM d, yyyy"];
    }
    
    //Build the date into a string based on my date format
    NSString *dateDate = [[NSString alloc] initWithFormat:@"%@", [dateFormatter stringFromDate: self.currentGigDate.date]];
    
    //Create format for times
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"h:mm a"];
    
    //Build the call into a string based on my time format
    self.callstring = [[NSString alloc] initWithFormat:@"%@", [timeFormatter stringFromDate: self.currentGigDate.call]];
    
    //Build the start into a string based on my time format
    self.startstring = [[NSString alloc] initWithFormat:@"%@", [timeFormatter stringFromDate: self.currentGigDate.start]];
    
    //Fill label elements with data specific to object that was chosen from he table view
    gigDayLabel.text = dateDay;
    gigDateLabel.text = dateDate;
    
    //Fill Internal Properties with Object Properties
    self.venueNameString = self.currentGigDate.venue;
    self.venueAddressString = self.currentGigDate.address;
    self.contactNameString = self.currentGigDate.contact;
    self.contactPhoneString = self.currentGigDate.phone;
    self.calltime = self.currentGigDate.call;
    self.starttime = self.currentGigDate.start;
    
    
    //Enable input cells
    [self editMode];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated
{
    //Hide keyboard retract button
    btnDone.hidden = true;
    
    //Deal with the keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    //Fill Time Labels here - after 'viewDidLoad' so I can modify)
    callTimeLabel.text = self.callstring;
    startTimeLabel.text = self.startstring;
    
    
    //Set confirmation switch to current state
    if(self.currentGigDate.confirmed)
    {
        switchConfirmed.on = YES;
    }
    
    //Fill Text Fileds
    venueName.text = self.venueNameString;
    venueAddress.text = self.venueAddressString;
    contactName.text = self.contactNameString;
    contactPhone.text = self.contactPhoneString;
    
    [super viewWillAppear:(BOOL)animated];
}

-(void)keyboardWillShow:(NSNotification *)notification
{
    //Show keyboard retract button
    btnDone.hidden = false;
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    //Hide keyboard retract button
    btnDone.hidden = true;
}


-(IBAction)onClick:(id)sender
{
    UIButton *btn = sender;
    
    if(btn.tag == 1) //Done Button
    {

        //This should also dismiss the keyboard
        [venueName resignFirstResponder];
        [venueAddress resignFirstResponder];
        [contactName resignFirstResponder];
        [contactPhone resignFirstResponder];
        
    }
     else if (btn.tag == 2) //Save Button
    {
        if(venueName.text.length != 0)
        {
            //self.currentGigDate.status = @"Tenative";
            self.currentGigDate.venue = venueName.text;
            self.currentGigDate.address = venueAddress.text;
            self.currentGigDate.contact = contactName.text;
            self.currentGigDate.phone = contactPhone.text;
            self.currentGigDate.call = self.calltime;
            self.currentGigDate.start = self.starttime;
            self.currentGigDate.notes = @"";
            self.currentGigDate.booked = true;
            self.currentGigDate.flag = [UIImage imageNamed:@"grey25.png"];
            
            if(switchConfirmed.isOn)
            {
                self.currentGigDate.confirmed = true;
                self.currentGigDate.flag = [UIImage imageNamed:@"green25.png"];
            }
        }
        
        [self performSegueWithIdentifier:@"unwindToMainView" sender:sender];
        
    }
    else if (btn.tag == 4)
    {
        //Go to Time view controller by this alternate button push
        [self performSegueWithIdentifier:@"GigDateTime" sender:sender];
    }
    
}

-(void)editMode
{
    venueName.enabled = true;
    venueName.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
    
    venueAddress.enabled = true;
    venueAddress.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
    
    contactName.enabled = true;
    contactName.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
    
    contactPhone.enabled = true;
    contactPhone.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
    
    
}

-(IBAction)done:(UIStoryboardSegue*)segue
{
    
    TimeViewController *timeView = segue.sourceViewController;
    NSLog(@"Back in detail view. %d", timeView.caller);
    
    if(timeView.caller == 2)
    {
        //Save times chosen from Time Picker
        self.calltime = timeView.calltime;
        self.starttime = timeView.starttime;
        
        //Create format for times
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setDateFormat:@"h:mm a"];
        
        //Build the call into a string based on my time format
        self.callstring = [[NSString alloc] initWithFormat:@"%@", [timeFormatter stringFromDate: self.calltime]];
        
        //Build the start into a string based on my time format
        self.startstring = [[NSString alloc] initWithFormat:@"%@", [timeFormatter stringFromDate: self.starttime]];

    }
    else
    {

    }
}

//Called when we are about to segue (but which direction?)
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //Cast the "sender" as a Button
    UIButton *button = (UIButton*)sender;
    
    //NSString *from = self.caller[button.tag];
    int tag = button.tag;
    
    //NSLog(@"%d",tag);
    
    if(tag == 3 || tag == 4) //On our way to the "time" view controller
    {
        
        //Save any tenative user entry data
        self.venueNameString = venueName.text;
        self.venueAddressString = venueAddress.text;
        self.contactNameString = contactName.text;
        self.contactPhoneString = contactPhone.text;
        
        TimeViewController *timeViewController = segue.destinationViewController;
        
        if (timeViewController != nil)
        {
            //Set the currentGigDate property in time view
            timeViewController.currentGigDate = self.currentGigDate;
            
            //Pass along the source of my button click
            timeViewController.caller = tag;
        }
        
    }
    else //On our way home
    {
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
