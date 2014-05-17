//
//  ViewController.h
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>
{
    
    NSMutableArray *gigDateArray;          //Reference to main array that will hold my GigDate objects
}


@end
