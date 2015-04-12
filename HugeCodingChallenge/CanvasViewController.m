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

@property (nonatomic, strong) NSString *indicator;
@property (nonatomic, strong) NSMutableArray *indexPathsSaved;
@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.indexPathsSaved = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addInstructionPressed:(UIButton*)sender {
    if (self.canvasTextField.text != nil) {
        if ([[self.canvasTextField.text uppercaseString] isEqualToString:@"Q"] ) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else{
            [self createCanvasCalculation];
        }
    }
}

- (void)createCanvasCalculation{
    CanvasCalculation *cc = [[CanvasCalculation alloc]init];
    NSString *operation = [[cc determineOperation:self.canvasTextField.text] uppercaseString];
    
    //canvas
    if ([operation isEqualToString:@"C"]) {
        NSArray *arr = [cc separateNumbers:self.canvasTextField.text];
        if (arr.count != 2) {
            [self triggerAlertWithString:@"Invalid input. Canvas can only have a width and a height"];
        }
        else{
            self.canvasWidth = arr[0];
            self.canvasHeight = arr[1];
            self.indicator = nil;
            [self.collectionView reloadData];
        }
    }
    //line
    else if([operation isEqualToString:@"L"]){
        NSArray *arr = [cc separateNumbers:self.canvasTextField.text];
        if (arr.count != 4 ) {
            [self triggerAlertWithString:@"invalid input. need 4 numbers"];
        }
        else{
            if ([cc checkIfLineValid:arr withCanvasWidth:self.canvasWidth withCanvasHeight:self.canvasHeight]) {
                
                NSInteger y1 = [arr[1] integerValue];
                NSInteger y2 = [arr[3] integerValue];
                NSInteger x1 = [arr[0] integerValue];
                NSInteger x2 = [arr[2] integerValue];
                
                if (x1 == x2) {
                    NSMutableArray *indexPaths = [[NSMutableArray alloc]initWithObjects:nil];
                    for (y1; y1 <= y2; ++y1){
                        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:y1-1 inSection:x1-1];
                        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];

                        [indexPaths addObject:indexPath];
                        self.indicator = @"X";
                    }
//                    self.indexPathsSaved = indexPaths;
//                    [self.collectionView reloadData];
                    
                    [self.collectionView reloadItemsAtIndexPaths:indexPaths];
                        self.indicator = nil;
                }
                else if(y1 == y2){
                    NSMutableArray *indexPaths = [[NSMutableArray alloc]init];
                    for (x1; x1 <= x2; ++x1){
                        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:y1-1 inSection:x1-1];
                        [indexPaths addObject:indexPath];
                        self.indicator = @"X";
                    }
//                    self.indexPathsSaved = indexPaths;
                    [self.collectionView reloadItemsAtIndexPaths:indexPaths];
                    self.indicator = nil;
                }
            }
            else{
                [self triggerAlertWithString:@"invalid input. need 4 valid numbers within range"];
            }
        }
    }
    //rect
    else if([operation isEqualToString:@"R"] ){
        NSArray *arr = [cc separateNumbers:self.canvasTextField.text];
        if (arr.count != 4) {
            [self triggerAlertWithString:@"invalid input. need 4 numbers"];
        }
        else{
            if ([cc checkIfRectangleValid:arr withCanvasWidth:self.canvasWidth withCanvasHeight:self.canvasHeight]) {
                NSInteger y1 = [arr[1] integerValue];
                NSInteger y2 = [arr[3] integerValue];
                NSInteger x1 = [arr[0] integerValue];
                NSInteger x2 = [arr[2] integerValue];
            
                NSInteger y1Copy = y1;
                NSInteger y2Copy = y2;
                NSInteger x1Copy = x1;
                NSInteger x2Copy = x2;
                NSMutableArray *indexPaths = [[NSMutableArray alloc]init];
            
                NSIndexPath *indexPathTopLeft = [NSIndexPath indexPathForItem:(y1-1) inSection:(x1-1)];
                NSIndexPath *indexPathTopRight = [NSIndexPath indexPathForItem:(y1-1) inSection:(x2-1)];
                NSIndexPath *indexPathBottomLeft = [NSIndexPath indexPathForItem:(y2-1) inSection:(x1-1)];
                NSIndexPath *indexPathBottomRight = [NSIndexPath indexPathForItem:(y2-1) inSection:(x2-1)];
            
            [indexPaths addObject:indexPathTopLeft];
            [indexPaths addObject:indexPathTopRight];
            [indexPaths addObject:indexPathBottomLeft];
            [indexPaths addObject:indexPathBottomRight];
            
                for (y1Copy; y1Copy < y2Copy-1; ++y1Copy) {
                    NSIndexPath *indexPathLeft = [NSIndexPath indexPathForItem:(y1Copy) inSection:(x1Copy-1)];
                    NSIndexPath *indexPathRight = [NSIndexPath indexPathForItem:(y1Copy) inSection:(x2Copy-1)];
                    [indexPaths addObject:indexPathLeft];
                    [indexPaths addObject:indexPathRight];
                }
                for (x1; x1 < x2-1; ++x1) {
                    NSIndexPath *indexPathTop = [NSIndexPath indexPathForItem:y1-1 inSection:x1];
                    NSIndexPath *indexPathBottom = [NSIndexPath indexPathForItem:y2-1 inSection:x1];
                    [indexPaths addObject:indexPathTop];
                    [indexPaths addObject:indexPathBottom];
                }


                self.indicator = @"X";
                [self.collectionView reloadItemsAtIndexPaths:indexPaths];

            }
            else{
                [self triggerAlertWithString:@"invalid input. need 4 valid numbers within range"];
            }
        }
    }
    //bucket fill
    else if([operation isEqualToString:@"B"]){
        NSArray *arr = [cc separateNumbers:self.canvasTextField.text];
        if (arr.count != 3) {
            [self triggerAlertWithString:@"invalid input. need 3 numbers"];
        }
        else{
            if ([cc checkIfBucketFillValid:arr withCanvasWidth:self.canvasWidth withCanvasHeight:self.canvasHeight]) {
                
            }
            else{
                [self triggerAlertWithString:@"invalid input. need 2 valid numbers within range and 1 color"];
            }
        }
    }
    //invalid
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

- (IBAction)restartButtonPressed:(UIBarButtonItem*)sender {
    if([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]){
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma Mark collection view dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    return [self.canvasWidth integerValue];
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.canvasHeight integerValue];
}

#pragma Mark collection view delegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell* newCell;
    
    if([self.indicator isEqualToString:@"X"])
        newCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Xcell" forIndexPath:indexPath];
    else
        newCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return newCell;
}
@end
