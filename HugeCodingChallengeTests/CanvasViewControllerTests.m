//
//  HugeCodingChallengeTests.m
//  HugeCodingChallengeTests
//
//  Created by Henry Savit on 4/10/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CanvasViewController.h"
#import "CanvasCalculation.h"
//#import "OCMock.h"

@interface CanvasViewControllerTests : XCTestCase

@property (nonatomic, strong) CanvasViewController *cvc;
@property (nonatomic, strong) CanvasCalculation *cc;

@end

@implementation CanvasViewControllerTests

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

- (void)setUp {
    [super setUp];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.cvc = [sb instantiateViewControllerWithIdentifier:@"cvc"];
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
