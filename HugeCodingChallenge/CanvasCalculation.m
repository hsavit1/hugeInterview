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

-(BOOL)checkIfNumericString:(NSArray*)arr{
    for(int i = 0; i < arr.count; i++) {
        if (![self stringIsNumeric:arr[i]]) {
            return NO;
        }
    }
    return YES;
}

-(BOOL)stringIsNumeric:(NSString *) str {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:str];
    return !!number; // If the string numberic, return YES
}



//check if horizontal line / vertical line
- (BOOL)checkIfLineValid:(NSArray*)arr withCanvasWidth:(NSNumber*)width withCanvasHeight:(NSNumber*)height{
    
    if ([self checkIfNumericString:arr]) {

        //check if in bounds
        if ( [arr[0] integerValue] > [width integerValue] ){
            return NO;
        }
        else if ( [arr[2] integerValue] > [width integerValue])  {
            return NO;
        }
        else if( [arr[1] integerValue] > [height integerValue] ) {
            return NO;
        }
        else if( [arr[3] integerValue] > [height integerValue]){
            return NO;
        }
        
//        //check if horizontal or vertical line
//        if([ [arr[0] integerValue] == [arr[2] integerValue] ]){ //vertical
//            if (arr[1] == arr[3]) {
//                return NO;
//            }
//            else{
//                return YES;
//            }
//        }
//        else if(arr[0] == arr[2]){ //horizontal
//            if (arr[1] == arr[3]) {
//                return NO;
//            }
//            else{
//                return YES;
//            }
//        }
//        else{
//            return NO;
//        }
    }
    else{
        return NO;
    }
    return YES;
}

-(BOOL)checkIfRectangleValid:(NSArray *)arr withCanvasWidth:(NSNumber*)width withCanvasHeight:(NSNumber*)height{
    
    if ([self checkIfNumericString:arr]) {
        //check if in bounds
        if ((arr[0] || arr[2]) > (int)width) {
            return NO;
        }
        else if((arr[1] || arr[3]) > (int)height) {
            return NO;
        }
        else if(arr[0] >= arr[2]){
            return NO;
        }
        else if(arr[1] >= arr[3]){
            return NO;
        }
        else{
            return YES;
        }
    }
    else{
        return NO;
    }
        
    
}

- (BOOL)checkIfBucketFillValid:(NSArray *)arr withCanvasWidth:(NSNumber *)width withCanvasHeight:(NSNumber *)height{

    if ( [self stringIsNumeric:arr[0]] && [self stringIsNumeric:arr[1]]) {
        
    }
    return NO;
}



@end
