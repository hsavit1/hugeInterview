//
//  CanvasCalculation.m
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/11/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "CanvasCalculation.h"

@implementation CanvasCalculation

- (NSArray*)separateNumbers:(NSString*)text{
    NSArray * arr = [text componentsSeparatedByString:@" "];
    
    NSMutableArray *mArr = [[NSMutableArray alloc]initWithArray:arr];
    [mArr removeObjectAtIndex:0];
    
    NSArray *final = mArr;
    return final;
}

- (NSString*)determineOperation:(NSString*)input{
    NSArray * arr = [input componentsSeparatedByString:@" "];

    return arr[0];
}


@end
