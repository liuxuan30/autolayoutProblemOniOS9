//
//  BDPNavigationControllerDelegate.h
//  MCompass
//
//  Created by Xuan on 2/28/15.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushAnimator.h"
#import "PopAnimator.h"

@interface TestNavigationControllerDelegate : NSObject<UINavigationControllerDelegate>

/**
 *  give a chance to change the push animation
 */
@property (strong, nonatomic) PushAnimator *pushAnimator;
/**
 *  give a chance to change the pop animation
 */
@property (strong, nonatomic) PopAnimator *popAnimator;

// init BDPNavigationControllerDelegate object
-(id)init;

@end
