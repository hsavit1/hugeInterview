//
//  CanvasCalculation.h
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/11/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CanvasCalculation : NSObject

- (NSArray*)separateNumbers:(NSString*)text;

- (NSString*)determineOperation:(NSString*)input;

- (BOOL)checkIfNumericString:(NSArray*)arr;

- (BOOL)checkIfLineValid:(NSArray*)arr withCanvasWidth:(NSNumber*)width withCanvasHeight:(NSNumber*)height;

- (BOOL)checkIfRectangleValid:(NSArray*)arr withCanvasWidth:(NSNumber*)width withCanvasHeight:(NSNumber*)height;

- (BOOL)checkIfBucketFillValid:(NSArray*)arr withCanvasWidth:(NSNumber*)width withCanvasHeight:(NSNumber*)height;

- (BOOL)checkIfNegativeInput:(NSArray*)arr;

@end

