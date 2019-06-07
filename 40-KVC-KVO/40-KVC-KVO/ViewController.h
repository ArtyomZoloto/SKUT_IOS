//
//  ViewController.h
//  40-KVC-KVO
//
//  Created by iMac on 02/06/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (strong, nonatomic) Student* student;
@property (strong, nonatomic) NSArray<Student*>* students;

@end

