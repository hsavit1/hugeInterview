//
//  CanvasViewController.h
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/11/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CanvasCalculation;

@interface CanvasViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *canvasTextField;
@property (nonatomic, strong) NSNumber *canvasWidth;
@property (nonatomic, strong) NSNumber *canvasHeight;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


-(void)createCanvas:(CanvasCalculation*)cc;
-(void)createLine:(CanvasCalculation*)cc;
-(void)createRect:(CanvasCalculation*)cc;
-(void)createBucketFill:(CanvasCalculation*)cc;
-(void)triggerAlertWithString:(NSString*)string;


@end
