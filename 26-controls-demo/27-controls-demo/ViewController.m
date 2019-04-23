//
//  ViewController.m
//  27-controls-demo
//
//  Created by Zolotoverkhov Artem on 23/04/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:(1 - self.slider.value) alpha:1.0f];
    self.label.text = [NSString stringWithFormat:@"%d", self.segmentedControl.selectedSegmentIndex];
    // Do any additional setup after loading the view, typically from a nib.
    [self.segmentedControl addTarget:self action:@selector(myMethod:) forControlEvents:UIControlEventValueChanged];
}

-(void) myMethod:(UISegmentedControl*) control{
    self.label.text = [NSString stringWithFormat:@"%d", control.selectedSegmentIndex];
}

- (IBAction)sliderAction:(UISlider*)slider {
    self.view.backgroundColor = [UIColor colorWithWhite:(1 - slider.value) alpha:1.0f];
}

- (IBAction)switchAction:(UISwitch *) toggle {
    if (toggle.isOn){
        [self.loader startAnimating];
    }
    if (!toggle.isOn){
        [self.loader stopAnimating];
    }
}
@end
