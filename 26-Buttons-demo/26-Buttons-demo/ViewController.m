//
//  ViewController.m
//  26-Buttons-demo
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
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 200, 50);
    button.backgroundColor = [UIColor magentaColor];
    [button setTitle:@"Рассчитать" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(calculate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) calculate: (UIButton*) button {
    // [button ]
    self.view.backgroundColor = [UIColor yellowColor];
    NSLog([NSString stringWithFormat:@"%d", 1+1]);
}

@end
