//
//  DataStore.h
//  GigMeister1
//
//  Created by Russell Gaspard on 5/31/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStore : NSObject
{
    
}

+ (DataStore *) sharedInstance;



@property (nonatomic, strong)NSMutableArray *gigDateArray;
@property (nonatomic, strong)NSMutableDictionary *sectionTitleDict;
@property (nonatomic, strong)NSMutableDictionary *calendarDict;
@property (nonatomic, strong)NSArray *sectionTitleArray;
@end

