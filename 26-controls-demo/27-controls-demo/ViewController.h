//
//  ViewController.h
//  27-controls-demo
//
//  Created by Zolotoverkhov Artem on 23/04/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)sliderAction:(UISlider*) slider;
- (IBAction)switchAction:(UISwitch*) toggle;


@end

