//
//  ViewController.m
//  TestForiOS
//
//  Created by Xuan on 9/15/15.
//  Copyright © 2015 Wingzero. All rights reserved.
//

#import "ViewController.h"
#import "DetailCollectionViewCell.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self registerNibs];
    self.detailCollectionView.dataSource = self;
    self.detailCollectionView.delegate = self;
}

- (void)registerNibs {
    UINib *nib = [UINib nibWithNibName:@"DetailCollectionViewCell" bundle:nil];
    [self.detailCollectionView registerNib:nib forCellWithReuseIdentifier:@"DetailCollectionViewCell"];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailCollectionViewCell" forIndexPath:indexPath];
    cell.topLabel.text = @"本周市场份额";
    cell.bottomLabel.text = @"17.06";
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(90, 64); // 90 is the width of 本周市场份额 with systemFontSize:15 in UILabel
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailCollectionViewCell *cell = (DetailCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *appDelegate = (AppDelegate *)app.delegate;
    appDelegate.UserTouchView = cell;
    appDelegate.UserTouchPoint = cell.frame.origin;
    // TODO: move ModelIsSubChartModel to a better class
    DetailViewController *vc = [[DetailViewController alloc] init];
    appDelegate.AppNavigationController.delegate = appDelegate.NaviDelegate;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
