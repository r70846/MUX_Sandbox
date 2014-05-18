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
    
    //Fill UI elements with data specific to object that was chosen from he table view
    gigDayLabel.text = dateDay;
    gigDateLabel.text = dateDate;
    
    
    //instLabel.text = self.currentMusician.instrument;
    //phoneLabel.text = self.currentMusician.phone;
    //emailLabel.text = self.currentMusician.email;
    //notesLabel.text = self.currentMusician.notes;
    //detailImage.image = self.currentMusician.instImage;
    
    [super viewWillAppear:(BOOL)animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
