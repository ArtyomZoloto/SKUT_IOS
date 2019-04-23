//
//  ViewController.m
//  27-UITextField-part1
//
//  Created by Zolotoverkhov Artem on 23/04/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray<UITextField*>* textFields;
@property (weak, nonatomic) IBOutlet UIView *DataView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray <UILabel*>* DataLabels;

- (IBAction)editingChangedAction:(UITextField *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (UITextField *t in self.textFields){
        t.delegate = self;
    }
    self.DataView.layer.borderColor = [UIColor greenColor].CGColor;
    self.DataView.layer.borderWidth = 2.0f;
    for (UILabel *l in self.DataLabels){
        l.text = @"";
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSArray *sortedFields = [self.textFields sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        UITextField *v1 = (UITextField*) obj1;
        UITextField *v2 = (UITextField*) obj2;
        NSNumber *n1 = [NSNumber numberWithFloat:v1.frame.origin.y];
        NSNumber *n2 = [NSNumber numberWithFloat:v2.frame.origin.y];
        return [n2 compare:n1];
    }];
    
    for (UITextField *t in sortedFields){
        if (t.text.length == 0){
            [t becomeFirstResponder];
        } else {
            [t resignFirstResponder];
        }
    }
    return YES;
}

- (IBAction)editingChangedAction:(UITextField *)sender {
    self.DataLabels[sender.tag].text = sender.text;
}
@end
