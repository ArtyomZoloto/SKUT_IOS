//
//  ViewController.m
//  skut-21-animations
//
//  Created by Zolotoverkhov Artem on 29/03/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "ViewController.h"

typedef void(^animationBlock)(void);

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 100, 100)];
    view1.backgroundColor = [UIColor blackColor];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 100, 100)];
    view3.backgroundColor = [UIColor redColor];
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 500, 100, 100)];
    view4.backgroundColor = [UIColor yellowColor];
    
    NSArray *views = @[view1,view2,view3,view4];
    
    for (UIView *v in views){
        [super.view addSubview:v];
    }
    
    
    for (int i = 0; i < views.count; i++){
        __weak UIView *weakView = views[i];
        [self moveView:weakView withOptions: [self getOptionsFor:i] andAnimation:^{
            weakView.center = CGPointMake(CGRectGetWidth(self.view.bounds)-CGRectGetMidX(weakView.bounds),
                                          CGRectGetMinY(weakView.frame)+CGRectGetMidY(weakView.bounds));
        }];
    }
}

-(UIViewAnimationOptions) getOptionsFor: (NSInteger) key {
    switch(key){
        case 0:
            return UIViewAnimationOptionCurveEaseInOut;
            break;
        case 1:
            return UIViewAnimationOptionCurveEaseIn;
            break;
        case 2:
            return UIViewAnimationOptionCurveEaseOut;
        case 3:
            return UIViewAnimationOptionCurveLinear;
            break;
        default:
            return UIViewAnimationOptionCurveEaseInOut;
            break;
    }
}

- (void)moveView:(UIView *)view1 withOptions:(UIViewAnimationOptions)options andAnimation:(animationBlock) animationBlock {
    [UIView animateWithDuration:3
                          delay:2
                        options: options
                     animations:animationBlock
                     completion:^(BOOL finished) {
                         NSLog(@"finished? %i", finished);
                     }];
}

@end
