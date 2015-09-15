//
//  DetailCollectionViewCell.m
//  TestForiOS
//
//  Created by Xuan on 9/15/15.
//  Copyright © 2015 Wingzero. All rights reserved.
//

#import "DetailCollectionViewCell.h"

@implementation DetailCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"%@", self.topLabel);
}

@end
