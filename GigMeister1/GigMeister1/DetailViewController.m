//
//  DetailViewController.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
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
    
    //Build the date into a string based on my day format
    NSString *dateDate = [[NSString alloc] initWithFormat:@"%@", [dateFormatter stringFromDate: self.currentGigDate.date]];
    
    //Fill label elements with data specific to object that was chosen from he table view
    gigDayLabel.text = dateDay;
    gigDateLabel.text = dateDate;
    
    //Fill Text Fileds
    venueName.text = self.currentGigDate.venue;
    venueAddress.text = self.currentGigDate.address;
    contactName.text = self.currentGigDate.contact;
    contactPhone.text = self.currentGigDate.phone;

    //detailImage.image = self.currentMusician.instImage;
    
    [super viewWillAppear:(BOOL)animated];
}

-(IBAction)onClick:(id)sender
{
    UIButton *btn = sender;
    if(btn.tag == 1) //Edit Button
    {
        NSLog(@"Button WAS the edit button");
        
        venueName.enabled = true;
        venueName.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
        
        venueAddress.enabled = true;
        venueAddress.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
        
        contactName.enabled = true;
        contactName.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
        
        contactPhone.enabled = true;
        contactPhone.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(250/255.0) blue:(190/255.0) alpha:1];
        
        //venueName.userInteractionEnabled = true;
        
        
    }
     else if (btn.tag == 2) //Save Button
    {
        self.currentGigDate.status = @"Tenative";
        self.currentGigDate.venue = venueName.text;
        self.currentGigDate.address = venueAddress.text;
        self.currentGigDate.contact = contactName.text;
        self.currentGigDate.phone = contactPhone.text;
        self.currentGigDate.notes = @"";
        self.currentGigDate.flag = [UIImage imageNamed:@"green25.png"];
        
        [self performSegueWithIdentifier:@"unwindToMainView" sender:sender];
        
    }

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
