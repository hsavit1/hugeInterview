//
//  CanvasViewController.m
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/11/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "CanvasViewController.h"
#import "CanvasCalculation.h"
#import "CanvaslCollectionViewCell.h"

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
        [self createCanvas:cc];
    }
    //line
    else if([operation isEqualToString:@"L"]){
        [self createLine:cc];
    }
    //rect
    else if([operation isEqualToString:@"R"] ){
        [self createRect:cc];
    }
    //bucket fill
    else if([operation isEqualToString:@"B"]){
        [self createBucketFill:cc];
    }
    //invalid
    else{
        [self triggerAlertWithString:@"Invalid Input. Please create a canvas"];
    }
}

-(void)createCanvas:(CanvasCalculation*)cc{
    NSArray *arr = [cc separateNumbers:self.canvasTextField.text];
    if (arr.count != 2) {
        [self triggerAlertWithString:@"Invalid input. Canvas can only have a width and a height"];
    }
    else{
        int maxWidth =  (self.view.frame.size.width / 18);
        int maxHeight = ((self.view.frame.size.height - 143) / 19);
        if ([arr[0] integerValue] > maxWidth) {
            [self triggerAlertWithString:@"Canvas width too much for this screen size"];
        }
        else if ([arr[1] integerValue] > maxHeight) {
            [self triggerAlertWithString:@"Canvas height too much for this screen size"];
        }
        else{
            self.canvasWidth = arr[0];
            self.canvasHeight = arr[1];
            self.indicator = nil;
            [self.collectionView reloadData];
        }
    }
}

-(void)createLine:(CanvasCalculation*)cc{
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

- (void)createRect:(CanvasCalculation*)cc{
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

- (void)createBucketFill:(CanvasCalculation*)cc{
    NSArray *arr = [cc separateNumbers:self.canvasTextField.text];
    if (arr.count != 3) {
        [self triggerAlertWithString:@"invalid input. need 3 numbers"];
    }
    else{
        if ([cc checkIfBucketFillValid:arr withCanvasWidth:self.canvasWidth withCanvasHeight:self.canvasHeight]) {
            NSInteger x = [arr[0] integerValue];
            NSInteger y = [arr[1] integerValue];
            NSString *b = arr[2];
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:x inSection:y];
            [self floodFillWithColor:b indexPath:indexPath];
        }
        else{
            [self triggerAlertWithString:@"invalid input. need 2 valid numbers within range and 1 color"];
        }
    }
}

-(void)floodFillWithColor:(NSString*)b indexPath:(NSIndexPath*)indexPath{
    //            Flood-fill (node, target-color, replacement-color):
    //            1. if no CollectionViewCell, return
    //            2. If target-color is equal to replacement-color, return.
    //            3. If the color of node is not equal to target-color, return.
    //            4. Set the color of node to replacement-color.
    //            5. Perform Flood-fill (one step to the west of node, target-color, replacement-color).
    //               Perform Flood-fill (one step to the east of node, target-color, replacement-color).
    //               Perform Flood-fill (one step to the north of node, target-color, replacement-color).
    //               Perform Flood-fill (one step to the south of node, target-color, replacement-color).
    //            6. Return.

    //NSString* currentColor = ((CanvaslCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath]).letterLabel.text;
    //NSLog(@"%@", currentColor);
    
    
    if ([self.collectionView cellForItemAtIndexPath:indexPath] == nil) {
        return;
    }
    else if(![((CanvaslCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath]).letterLabel.text isEqualToString:@""]){// && (currentColor != nil)) {
        return;
    }
    else if ([[self.collectionView cellForItemAtIndexPath:indexPath].reuseIdentifier isEqualToString:@"Xcell"]) {
        return;
    }
    
    ((CanvaslCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath]).letterLabel.text = b;
    
    NSIndexPath *west = [NSIndexPath indexPathForItem:(indexPath.item - 1) inSection:indexPath.section];
    [self floodFillWithColor:b indexPath:west];
    
    NSIndexPath *east = [NSIndexPath indexPathForItem:(indexPath.item + 1) inSection:indexPath.section];
    [self floodFillWithColor:b indexPath:east];
    
    NSIndexPath *north = [NSIndexPath indexPathForItem:indexPath.item inSection:(indexPath.section - 1)];
    [self floodFillWithColor:b indexPath:north];
    
    NSIndexPath *south = [NSIndexPath indexPathForItem:indexPath.item inSection:(indexPath.section + 1)];
    [self floodFillWithColor:b indexPath:south];
    
    return;
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
- (CanvaslCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CanvaslCollectionViewCell* newCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if([self.indicator isEqualToString:@"X"])
        newCell.letterLabel.text = self.indicator;
    
    return newCell;
}
@end
