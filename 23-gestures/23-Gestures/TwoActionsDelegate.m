//
//  TwoActionsDelegate.m
//  23-Gestures
//
//  Created by Zolotoverkhov Artem on 12/04/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "TwoActionsDelegate.h"

@implementation TwoActionsDelegate 
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
