//
//  BDPNavigationControllerDelegate.m
//  MCompass
//
//  Created by Xuan on 2/28/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "TestNavigationControllerDelegate.h"
#import "AppDelegate.h"

@interface TestNavigationControllerDelegate()
@property (weak, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactionController;

@end

@implementation TestNavigationControllerDelegate

-(id)init {
    self = [super init];
    if (self) {
        self.pushAnimator = [[PushAnimator alloc] init];
        self.popAnimator = [[PopAnimator alloc] init];
        UIApplication * app = [UIApplication sharedApplication];
        AppDelegate *appDelegate = (AppDelegate *)app.delegate;
        self.navigationController = appDelegate.AppNavigationController;
//        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        // remove pan gesture as required
//        [self.navigationController.view addGestureRecognizer:panRecognizer];
    }
    return self;
}

/**
 *  handle user pan gestures to pop/push
 *
 *  @param recognizer the gesture recognizer
 */
- (void)pan:(UIPanGestureRecognizer *)recognizer {
    UIView * view = self.navigationController.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [recognizer locationInView:view];
        if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1) {
            self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:view];
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.interactionController updateInteractiveTransition:d];
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([recognizer velocityInView:view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            NSLog(@"%f",[recognizer velocityInView:view].x);
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}

#pragma mark - UINavigationControllerDelegate

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimator;
    }
    if (operation == UINavigationControllerOperationPop) {
        return self.popAnimator;
    }
    return nil;
}

-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    return self.interactionController;
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.view.userInteractionEnabled = NO;
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.view.userInteractionEnabled = YES;
}

@end
