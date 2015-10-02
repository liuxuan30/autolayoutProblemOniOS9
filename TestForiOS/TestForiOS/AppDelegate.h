//
//  AppDelegate.h
//  TestForiOS
//
//  Created by Xuan on 9/15/15.
//  Copyright © 2015 Wingzero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestNavigationControllerDelegate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// for custrom navigation transition animation
@property (strong, nonatomic) UINavigationController *AppNavigationController;
@property (assign, nonatomic) CGPoint UserTouchPoint;
@property (strong, nonatomic) UIView *UserTouchView;
@property (strong, nonatomic) TestNavigationControllerDelegate *NaviDelegate;
@end

