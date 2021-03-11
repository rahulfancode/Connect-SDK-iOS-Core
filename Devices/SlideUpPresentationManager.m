//
//  SlideUpPresentationManager.m
//  react-native-connect-sdk
//
//  Created by Shwet Solanki on 10/03/21.
//

#import "SlideUpPresentationManager.h"
#import "SlideUpPresentationController.h"

@implementation SlideUpPresentationManager

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    SlideUpPresentationController * presentationController = [[SlideUpPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return presentationController;
}

@end
