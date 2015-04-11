//
//  CanvasViewController.m
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/11/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "CanvasViewController.h"
#import "CanvasCalculation.h"

@interface CanvasViewController ()

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addInstructionPressed:(UIButton*)sender {

}

- (IBAction)restartButtonPressed:(UIBarButtonItem*)sender {
    if([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]){
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
