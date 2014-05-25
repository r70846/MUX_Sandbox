//
//  DetailViewController.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 2
 Mobile Development
 MUX 1405
 
 */

#import "DetailViewController.h"

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
    NSString *callTime = [[NSString alloc] initWithFormat:@"%@", [timeFormatter stringFromDate: self.currentGigDate.call]];
    
    //Build the start into a string based on my time format
    NSString *startTime = [[NSString alloc] initWithFormat:@"%@", [timeFormatter stringFromDate: self.currentGigDate.start]];
    
    
    //Fill label elements with data specific to object that was chosen from he table view
    gigDayLabel.text = dateDay;
    gigDateLabel.text = dateDate;
    
    callTimeLabel.text = callTime;
    startTimeLabel.text = startTime;
    
    
    //Set confirmation switch to current state
    if(self.currentGigDate.confirmed)
    {
        switchConfirmed.on = YES;
    }
    
    //Fill Text Fileds
    venueName.text = self.currentGigDate.venue;
    venueAddress.text = self.currentGigDate.address;
    contactName.text = self.currentGigDate.contact;
    contactPhone.text = self.currentGigDate.phone;
    
    //Fill time pickers
    //callPicker.date = self.currentGigDate.call;
    //startPicker.date = self.currentGigDate.start;
    

    //detailImage.image = self.currentMusician.instImage;
    
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
    if(btn.tag == 1) //Edit Button
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
            //self.currentGigDate.call = callPicker.date;
            //self.currentGigDate.start = startPicker.date;
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
        [self performSegueWithIdentifier:@"GigDateTime" sender:sender];
        NSLog(@"Made it here");
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
    
    //TimeViewController *timeView = segue.sourceViewController;
    //GigDateClass *currentGigDate = timeView.currentGigDate;
    //gigDateArray[currentGigDate.index] = currentGigDate;
    
    
    NSLog(@"Back to etail view");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
