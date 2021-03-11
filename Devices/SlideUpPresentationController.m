//
//  SlideUpPresentationController.m
//  react-native-connect-sdk
//
//  Created by Shwet Solanki on 10/03/21.
//

#import "SlideUpPresentationController.h"

@implementation SlideUpPresentationController {
    UIView * dimmingView;
}

-(CGRect)frameOfPresentedViewInContainerView {
    CGRect frame = CGRectZero;
    frame.size =
    [self sizeForChildContentContainer:self.presentedViewController withParentContainerSize:self.containerView.bounds.size];
    frame.origin.y = self.containerView.bounds.size.height - 210;
    return frame;
}

-(instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
        [self setupDimmingView];
    }
    return self;
}

-(void)setupDimmingView {
    dimmingView = [UIView new];
    [dimmingView setTranslatesAutoresizingMaskIntoConstraints: false];
    [dimmingView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5]];
    [dimmingView setAlpha:0];
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [dimmingView addGestureRecognizer:tapGesture];
}

-(void)handleTap: (UITapGestureRecognizer *)gesture {
    [[self presentingViewController] dismissViewControllerAnimated:true completion:NULL];
}

- (void)presentationTransitionWillBegin {
    [self.containerView insertSubview:dimmingView atIndex:0];
    [NSLayoutConstraint
     activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[dimmingView]|" options: 0 metrics:NULL views:@{@"dimmingView" : dimmingView}]];
    [NSLayoutConstraint
     activateConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[dimmingView]|" options: 0 metrics:NULL views:@{@"dimmingView" : dimmingView}]];
    
    if(self.presentedViewController.transitionCoordinator == nil) {
        dimmingView.alpha = 1.0;
    } else {
        [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self->dimmingView.alpha = 1.0;
        } completion: NULL];
    }
}

- (void)dismissalTransitionWillBegin {
    if(self.presentedViewController.transitionCoordinator == nil) {
        dimmingView.alpha = 0.0;
    } else {
        [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self->dimmingView.alpha = 0.0;
        } completion: NULL];
    }
}

- (void)containerViewWillLayoutSubviews {
    [self.presentedView.layer setCornerRadius:16];
    [self.presentedView setFrame:[self frameOfPresentedViewInContainerView]];
}

- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width, 210);
}
@end
