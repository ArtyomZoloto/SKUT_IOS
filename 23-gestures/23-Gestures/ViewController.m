//
//  ViewController.m
//  23-Gestures
//
//  Created by Zolotoverkhov Artem on 10/04/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "ViewController.h"
#import "TwoActionsDelegate.h"

typedef NS_ENUM (NSInteger, RotationDirection){
    ClockWise,
    CounterClockWise
};

@interface ViewController ()
@property(weak, nonatomic) UIView * imageView;
@property(assign, nonatomic) CGFloat currentScale;
@property(assign, nonatomic) CGFloat currentRotation;

@property(weak, nonatomic) id <UIGestureRecognizerDelegate> delegate;
@end

static NSString *const kImage = @"ryzen.jpg";

@implementation ViewController

- (void)dealloc
{
    [self.imageView release];
    [self.delegate release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = [TwoActionsDelegate new];
    
    self.imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: kImage]];
    self.imageView.frame = CGRectMake(0, 0, 300, 300);
    [self.view addSubview:self.imageView];
    [self.imageView release];
    
    
#pragma mark - SimpleTap
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    [tapGestureRecognizer release];
    
    
#pragma mark - Swipe
    
    UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGestureRecognizer];
    [rightSwipeGestureRecognizer release];
    
    UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGestureRecognizer];
    [leftSwipeGestureRecognizer release];
    
    
    
#pragma mark - Double tap stop animations
    
    UITapGestureRecognizer *twoFingersDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingersDoubleTap:)];
    twoFingersDoubleTap.numberOfTapsRequired = twoFingersDoubleTap.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer: twoFingersDoubleTap];
    [twoFingersDoubleTap release];
    
    
#pragma mark - Pinch
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchGestureRecognizer.delegate = self.delegate;
    [self.view addGestureRecognizer:pinchGestureRecognizer];
    [pinchGestureRecognizer release];
    
#pragma mark - rotation
    UIRotationGestureRecognizer *rotationGestrureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    rotationGestrureRecognizer.delegate = self.delegate;
    [self.view addGestureRecognizer:rotationGestrureRecognizer];
    [rotationGestrureRecognizer release];
    
#pragma mark - pan
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
    [pan release];
}

-(void) handleTap: (UITapGestureRecognizer*) gestureRecognizer {
    CGPoint touchPoint = [gestureRecognizer locationInView:self.view];
    [UIView animateWithDuration:5.0f
                          delay:0.0f
                        options: UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.imageView.center = touchPoint;
                     } completion:^(BOOL finished) {
                         NSLog(@"%d", finished);
                     }];
}

-(void) handleSwipe: (UISwipeGestureRecognizer*) gestureRecognizer {
    RotationDirection direction = gestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight ? ClockWise : CounterClockWise;
    [UIView animateWithDuration:5.0f delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        for (int i = 0; i < 2; i++){
            [self rotateView: direction];
        }
    } completion:^(BOOL finished) {
        NSLog(@"Animation complete");
    }];
}

-(void) rotateView:(RotationDirection) direction{
    float angle = direction == ClockWise ? -M_PI : M_PI;
    CGAffineTransform currentTransform = self.imageView.transform;
    self.imageView.transform = CGAffineTransformRotate(currentTransform, angle);
}

-(void) handleTwoFingersDoubleTap: (UITapGestureRecognizer*) tapGesture {
    NSLog(@"Double tap!");
    [self.imageView.layer removeAllAnimations];
}

-(void) handlePinch: (UIPinchGestureRecognizer*) pinch{
    if (pinch.state == UIGestureRecognizerStateBegan){
        NSLog(@"BEGAN!");
        self.currentScale = 1.0f;
    }
    CGFloat newScale = 1.0f + pinch.scale - self.currentScale;
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, newScale, newScale);
    self.currentScale = pinch.scale;
}

-(void) handleRotation: (UIRotationGestureRecognizer*) gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan){
        self.currentRotation = 0;
    }
    CGFloat newRotation = gestureRecognizer.rotation - self.currentRotation;
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, newRotation);
    self.currentRotation = gestureRecognizer.rotation;
    NSLog(@"%f", gestureRecognizer.rotation);
}

-(void) handlePan: (UIPanGestureRecognizer*) pan {
    self.imageView.center = [pan locationInView:self.view];
}

@end
