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

@property (nonatomic, strong) NSString *sampleCanvas;
@property (nonatomic, strong) NSString *sampleLine;
@property (nonatomic, strong) NSString *sampleRect;
@property (nonatomic, strong) NSString *sampleBucket;
@property (nonatomic, strong) NSString *sample;

@property (nonatomic, strong) CanvasCalculation *canvasCalc;

@end

@implementation TestCanvasValidations

- (void)setUp {
    [super setUp];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
