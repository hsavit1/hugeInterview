//
//  ViewController.h
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/10/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectionsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *inputField;

- (void)triggerAlertWithString:(NSString*)string;
- (void)createCanvasCalculation;

@end

