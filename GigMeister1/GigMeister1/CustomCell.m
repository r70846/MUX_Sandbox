//
//  CustomCell.m
//  GigMeister1
//
//  Created by Russell Gaspard on 5/17/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // Initialization code
        
        //Doesn't seem to be doing anything
        self.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(240/255.0) blue:(250/255.0) alpha:1];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//Refresh data in custom cell
-(void)refreshCellWithInfo:(NSString*)dayString dateString:(NSString*)dateString eventString:(NSString*)eventString cellImage:(UIImage*)cellImage
{
    //Fill UI elements in custom cell
    dayLabel.text = dayString;
    dateLabel.text = dateString;
    eventLabel.text = eventString;
    cellImageView.image = cellImage;
    
}
@end
