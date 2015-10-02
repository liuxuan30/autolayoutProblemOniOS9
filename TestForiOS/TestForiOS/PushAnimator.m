//
//  PushAnimator.m
//  MCompass
//
//  Created by Xuan on 2/28/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "PushAnimator.h"
#import "AppDelegate.h"

@implementation PushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

-(CGPoint)getOriginPointFrom:(UIView *)fromView To:(UIView *)toView {

    UIView *parentView = fromView;
    CGPoint fromPoint = fromView.frame.origin;
    CGFloat x = fromPoint.x;
    CGFloat y = fromPoint.y;
    
    while (parentView != toView) {
        parentView = [parentView superview];
        x += parentView.frame.origin.x;
        y += parentView.frame.origin.y;
    }
    return CGPointMake(x, y);
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//#ifdef __IPHONE_9_0
//    //Xuan: with the first release of iOS 9, auto layout engine has problems calculating the width and set the      frame correctly
//    // Try comment this out and restore it to see the difference
//    // I have to re-calculate for it again.
//    toViewController.view.frame = fromViewController.view.frame;
//#endif
    [[transitionContext containerView] addSubview:toViewController.view];
    
    fromViewController.view.userInteractionEnabled = NO;
    toViewController.view.userInteractionEnabled = NO;
    toViewController.view.alpha = 0;
    toViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.transform = CGAffineTransformIdentity;
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        fromViewController.view.userInteractionEnabled = YES;
        toViewController.view.userInteractionEnabled = YES;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
