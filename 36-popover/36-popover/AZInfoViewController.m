//
//  AZInfoViewController.m
//  36-popover
//
//  Created by iMac on 02/05/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import "AZInfoViewController.h"

@interface AZInfoViewController ()

@end

@implementation AZInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)hide:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismissed");
    }];
}
@end
