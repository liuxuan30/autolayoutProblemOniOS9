//
//  ViewController.m
//  TestForiOS
//
//  Created by Xuan on 9/15/15.
//  Copyright © 2015 Wingzero. All rights reserved.
//

#import "ViewController.h"
#import "DetailCollectionViewCell.h"

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

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(90, 64); // 90 is the width of 本周市场份额 with systemFontSize:15 in UILabel
}

@end
