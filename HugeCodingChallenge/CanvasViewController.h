//
//  CanvasViewController.h
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/11/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanvasViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *canvasTextField;

@property (nonatomic, strong) NSNumber *canvasWidth;
@property (nonatomic, strong) NSNumber *canvasHeight;
//@property (nonatomic, strong) NSMutableArray *

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
