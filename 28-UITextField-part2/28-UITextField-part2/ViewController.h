//
//  ViewController.h
//  28-UITextField-part2
//
//  Created by Zolotoverkhov Artem on 24/04/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
- (IBAction)submitButton:(id)sender;


@end

