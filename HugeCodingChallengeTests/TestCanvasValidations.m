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
//#import "OCMock.h"

@interface TestCanvasValidations : XCTestCase

@property (nonatomic, strong) NSString *sampleCanvas;
@property (nonatomic, strong) NSString *sampleLine;
@property (nonatomic, strong) NSString *sampleRect;
@property (nonatomic, strong) NSString *sampleBucket;
@property (nonatomic, strong) NSString *sample;

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
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];

}

- (void)testRecognizeCanvasInput {
    NSString *validCanvasInput = @"C 20 4";
    NSString *returned = [self.canvasCalc determineOperation:validCanvasInput];
    XCTAssertEqualObjects(@"C", returned, @"doesn't return valid expression to create canvas");
}

- (void)testRecognizeLineInput {
    NSString *validCanvasInput = @"L 2 9 9 9";
    NSString *returned = [self.canvasCalc determineOperation:validCanvasInput];
    XCTAssertEqualObjects(@"L", returned, @"doesn't return valid expression to create line");
}

- (void)testRecognizeRectInput {
    NSString *validCanvasInput = @"R 16 1 20 3";
    NSString *returned = [self.canvasCalc determineOperation:validCanvasInput];
    XCTAssertEqualObjects(@"R", returned, @"doesn't return valid expression to create rectangle");
}

- (void)testRecognizeBucketInput {
    NSString *validCanvasInput = @"B 10 3 o";
    NSString *returned = [self.canvasCalc determineOperation:validCanvasInput];
    XCTAssertEqualObjects(@"B", returned, @"doesn't return valid expression to create bucket");
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
