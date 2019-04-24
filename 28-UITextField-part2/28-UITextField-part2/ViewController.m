//
//  ViewController.m
//  28-UITextField-part2
//
//  Created by Zolotoverkhov Artem on 24/04/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailTextField.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    NSMutableCharacterSet *allowedCharacters = [NSMutableCharacterSet alphanumericCharacterSet];
    [allowedCharacters addCharactersInString:@"._@"];
    return [string rangeOfCharacterFromSet:allowedCharacters].length;
}


- (IBAction)submitButton:(id)sender {
}
@end
