//
//  TestCanvasValidations.m
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/12/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CanvasCalculation.h"

@interface TestCanvasValidations : XCTestCase

@property (nonatomic, strong) CanvasCalculation *canvasCalc;

@end

//XCTFail (format…)
//XCTAssertNil (a1, format…)
//XCTAssertNotNil (a1, format…)
//XCTAssert (a1, format…)
//XCTAssertTrue (a1, format…)
//XCTAssertFalse (a1, format…)
//XCTAssertEqualObjects (a1, a2, format…)
//XCTAssertEquals (a1, a2, format…)
//XCTAssertEqualsWithAccuracy (a1, a2, accuracy, format…)
//XCTAssertThrows (expression, format…)
//XCTAssertThrowsSpecific (expression, specificException, format…)
//XCTAssertThrowsSpecificNamed (expression, specificException, exceptionName, format…)
//XCTAssertNoThrow (expression, format…)
//XCTAssertNoThrowSpecific (expression, specificException, format…)
//XCTAssertNoThrowSpecificNamed (expression, specificExcepton, exceptionName, format…)

@implementation TestCanvasValidations

- (void)setUp {
    [super setUp];
//    self.sampleCanvas = @"One string, two string, three\n\nstring more. That's three. ... ,,, ;;;";
    self.canvasCalc = [[CanvasCalculation alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testNumericStringMethod {
    NSArray *validOutput = [[NSArray alloc]initWithObjects:@"2", @"9", @"9", nil] ;
    XCTAssertTrue([self.canvasCalc checkIfNumericString:validOutput] , @"numeric string method broken");
}

//canvas
- (void)testRecognizeInvalidCanvasInput {
    NSString *validCanvasInput = @"CX C 20 4";
    NSString *returned = [self.canvasCalc determineOperation:validCanvasInput];
    XCTAssertNotEqualObjects(@"C", returned, @"doesn't return valid expression to create canvas");
}

- (void)testRecognizeCanvasInput {
    NSString *validCanvasInput = @"C 20 4";
    NSString *returned = [self.canvasCalc determineOperation:validCanvasInput];
    XCTAssertEqualObjects(@"C", returned, @"doesn't return valid expression to create canvas");
}

- (void)testRecognizeNegativeNumberCanvasInput {
    NSArray *inVvalidCanvasInput = [[NSArray alloc]initWithObjects:@"C", @"-20", @"4", nil];
    XCTAssertFalse([self.canvasCalc checkIfNegativeInput:inVvalidCanvasInput], @"doesn't return valid expression to create canvas");
}

//line
- (void)testRecognizeInvalidLine {
    NSString *validCanvasInput = @"L 2 9 9 9";
    NSString *returned = [self.canvasCalc determineOperation:validCanvasInput];
    XCTAssertEqualObjects(@"L", returned, @"doesn't return valid expression to create line");
}

- (void)testRecognizeNotRightSizeInput {
    NSArray *validOutput = [[NSArray alloc]initWithObjects:@"1", @"30", @"6", @"2", nil] ;
    NSNumber *canvasWidth = [NSNumber numberWithInt:20];
    NSNumber *canvasHeight = [NSNumber numberWithInt:20];
    XCTAssertFalse([self.canvasCalc checkIfLineValid:validOutput withCanvasWidth:canvasWidth withCanvasHeight:canvasHeight], @"vinalid line input not showing false");
}

- (void)testLineIsValidMethod{
    NSArray *validOutput = [[NSArray alloc]initWithObjects:@"1", @"2", @"6", @"2", nil] ;
    NSNumber *canvasWidth = [NSNumber numberWithInt:20];
    NSNumber *canvasHeight = [NSNumber numberWithInt:20];
    XCTAssertTrue([self.canvasCalc checkIfLineValid:validOutput withCanvasWidth:canvasWidth withCanvasHeight:canvasHeight], @"valid line input not showing true");
}

- (void)testRecognizeNumberSeparationForLine {
    NSString *validCanvasInput = @"L 1 2 6 2";
    NSArray *validOutput = [[NSArray alloc]initWithObjects:@"1", @"2", @"6", @"2", nil] ;
    NSArray *returned = [self.canvasCalc separateNumbers:validCanvasInput];
    XCTAssertEqualObjects(validOutput, returned, @"doesn't return valid values for line input");
}

- (void)testRecognizeNegativeNumberLineInput {
    NSArray *inValidInput = [[NSArray alloc]initWithObjects:@"-1", @"2", @"6", @"2", nil] ;
    XCTAssertFalse([self.canvasCalc checkIfNegativeInput:inValidInput], @"doesn't return valid expression to create canvas");
}

//rect
- (void)testRecognizeRectInput {
    NSString *validCanvasInput = @"R 16 1 20 3";
    NSString *returned = [self.canvasCalc determineOperation:validCanvasInput];
    XCTAssertEqualObjects(@"R", returned, @"doesn't return valid expression to create rectangle");
}

- (void)testRecognizeNumberSeparationForRect {
    NSString *validCanvasInput = @"R 16 1 20 3";
    NSArray *validOutput = [[NSArray alloc]initWithObjects:@"16", @"1", @"20", @"3", nil] ;
    NSArray *returned = [self.canvasCalc separateNumbers:validCanvasInput];
    XCTAssertEqualObjects(validOutput, returned, @"doesn't return valid values for rect input");
}

- (void)testRectIsValidMethod{
    NSArray *validOutput = [[NSArray alloc]initWithObjects:@"16", @"1", @"20", @"3", nil] ;
    NSNumber *canvasWidth = [NSNumber numberWithInt:20];
    NSNumber *canvasHeight = [NSNumber numberWithInt:20];
    XCTAssertTrue([self.canvasCalc checkIfRectangleValid:validOutput withCanvasWidth:canvasWidth withCanvasHeight:canvasHeight], @"valid rext input not showing true");
}

//bucket
- (void)testRecognizeBucketInput {
    NSString *validCanvasInput = @"B 10 3 o";
    NSString *returned = [self.canvasCalc determineOperation:validCanvasInput];
    XCTAssertEqualObjects(@"B", returned, @"doesn't return valid expression to create bucket");
}

- (void)testBucketIsValidMethod{
    NSArray *validOutput = [[NSArray alloc]initWithObjects:@"10", @"3", @"o", nil] ;
    NSNumber *canvasWidth = [NSNumber numberWithInt:20];
    NSNumber *canvasHeight = [NSNumber numberWithInt:20];
    XCTAssertTrue([self.canvasCalc checkIfBucketFillValid:validOutput withCanvasWidth:canvasWidth withCanvasHeight:canvasHeight], @"valid bucket input not showing true");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
