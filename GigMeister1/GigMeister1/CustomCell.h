//
//  CustomCell.h
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

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UILabel *dayLabel;
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *eventLabel;
    IBOutlet UIImageView *cellImageView;
    
}

-(void)refreshCellWithInfo:(NSString*)dayString dateString:(NSString*)dateString eventString:(NSString*)eventString cellImage:(UIImage*)cellImage;


@end
