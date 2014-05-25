//
//  GigDateClass.h
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

#import <Foundation/Foundation.h>

@interface GigDateClass : NSObject
{
    
}
@property int index;
@property (nonatomic, strong)NSString *status;
@property  BOOL booked;
@property  BOOL confirmed;
@property (nonatomic, strong)NSString *venue;
@property (nonatomic, strong)NSString *address;
@property (nonatomic, strong)NSString *contact;
@property (nonatomic, strong)NSString *phone;
@property (nonatomic, strong)NSString *notes;
@property (nonatomic, strong)NSDate *date;
@property (nonatomic, strong)UIImage *flag;

@end
