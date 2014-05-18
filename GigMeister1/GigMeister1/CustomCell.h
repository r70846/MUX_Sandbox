//
//  CustomCell.h
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UILabel *dayLabel;
    IBOutlet UILabel *dateLabel;
    IBOutlet UIImageView *cellImageView;
    
}

-(void)refreshCellWithInfo:(NSString*)dayString dateString:(NSString*)dateString cellImage:(UIImage*)cellImage;


@end
