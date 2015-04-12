//
//  CanvasViewController.h
//  HugeCodingChallenge
//
//  Created by Henry Savit on 4/11/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CanvasCalculation;
@class CanvaslCollectionViewCell;

@interface CanvasViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *canvasTextField;
@property (nonatomic, strong) NSNumber *canvasWidth;
@property (nonatomic, strong) NSNumber *canvasHeight;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

/*!
 @param cc - check if input is good
 
 Create canvas if everything checks out
 */
-(void)createCanvas:(CanvasCalculation*)cc;

/*!
 @param cc - check if input is good
 
 Create line in canvas if everything checks out
 */
-(void)createLine:(CanvasCalculation*)cc;

/*!
 @param cc - check if input is good
 
 Create rect in canvas if everything checks out
 */
-(void)createRect:(CanvasCalculation*)cc;

/*!
 @param cc - check if input is good
 
 Calls the flood fill method if everything checks out
 */
-(void)createBucketFill:(CanvasCalculation*)cc;

/*!
 @param b - the color to be put in the cell
 @param indexPath - indexPath of cell to be tested
 
 Flood-fill (node, target-color, replacement-color):
 1. if no CollectionViewCell, return
 2. If target-color is equal to replacement-color, return.
 3. If the color of node is not equal to target-color, return.
 4. Set the color of node to replacement-color.
 5. Perform Flood-fill (one step to the west of node, target-color, replacement-color).
 Perform Flood-fill (one step to the east of node, target-color, replacement-color).
 Perform Flood-fill (one step to the north of node, target-color, replacement-color).
 Perform Flood-fill (one step to the south of node, target-color, replacement-color).
 6. Return.
 */
-(void)floodFillWithColor:(NSString*)b indexPath:(NSIndexPath*)indexPath;

/*!
 @param cc - alert message

 Trigger alert message
*/
-(void)triggerAlertWithString:(NSString*)string;

#pragma mark delegate methods

/*!
 @param cv - collection view
 @param iP - indexPath
 @return - the cell
 Trigger alert message
 */
- (CanvaslCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
