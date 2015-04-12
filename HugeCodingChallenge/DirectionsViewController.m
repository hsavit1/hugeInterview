//
//  ViewController.m
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/10/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "DirectionsViewController.h"
#import "CanvasCalculation.h"
#import "CanvasViewController.h"

@interface DirectionsViewController ()

@end

@implementation DirectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)inputButtonPressed:(UIButton*)sender {
    if (self.inputField.text != nil) {
        if ([[self.inputField.text uppercaseString] isEqualToString:@"Q"] ) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            [self createCanvasCalculation];
        }
    }
}

- (void)createCanvasCalculation{
    CanvasCalculation *cc = [[CanvasCalculation alloc]init];
    NSString *operation = [[cc determineOperation:self.inputField.text] uppercaseString];
    if ([operation isEqualToString:@"C"]) {
        NSArray *arr = [cc separateNumbers:self.inputField.text];
        if (arr.count != 2) {
            [self triggerAlertWithString:@"Invalid input. Canvas can only have a width and a height"];
        }
        else{
            
            int maxWidth =  (self.view.frame.size.width / 19);
            int maxHeight = ((self.view.frame.size.height - 143) / 19);
            if ([arr[0] integerValue] > maxWidth) {
                [self triggerAlertWithString:@"Canvas width too much for this screen size"];
            }
            else if ([arr[1] integerValue] > maxHeight) {
                [self triggerAlertWithString:@"Canvas height too much for this screen size"];
            }
            else{
                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                CanvasViewController *cvc = [sb instantiateViewControllerWithIdentifier:@"canvas"];
                cvc.canvasWidth = arr[0];
                cvc.canvasHeight = arr[1];
                [self.navigationController showViewController:cvc sender:self];
            }
        }
    }
    else if([operation isEqualToString:@"L"]){
        [self triggerAlertWithString:@"Must create a canvas before you can give a commmand like this!"];
    }
    else if([operation isEqualToString:@"R"]){
        [self triggerAlertWithString:@"Must create a canvas before you can give a commmand like this!"];
    }
    else if([operation isEqualToString:@"B"]){
        [self triggerAlertWithString:@"Must create a canvas before you can fill a line like this!"];
    }
    else{
        [self triggerAlertWithString:@"Invalid Input. Please create a canvas"];
    }
}

- (void)triggerAlertWithString:(NSString*)string{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Invalid Command to create canvas"
                                  message:string
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action){
                             [self dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
