//
//  ViewController.m
//  40-KVC-KVO
//
//  Created by iMac on 02/06/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UITextField *nameField;
@property (strong, nonatomic) UITextField *lastNameField;
@property (strong, nonatomic) UITextField *bdayField;
@property (strong, nonatomic) UISegmentedControl *genderSwitch;
@property (strong, nonatomic) UITextField *grade;

@end

@implementation ViewController

- (void)dealloc
{
    [self.student removeObserver:self forKeyPath:@"firstName"];
}

- (void)addObservers {
    [self.student addObserver:self
                   forKeyPath:@"firstName"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
    
    [self.student addObserver:self forKeyPath:@"lastName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    [self.student addObserver:self forKeyPath:@"dateOfBirth" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    [self.student addObserver:self forKeyPath:@"grade" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect tableFrame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height / 2);
    UITableView* table = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview: table];
    self.student = [Student new];
    Student *student1 = [Student new];
    self.student.friend = student1;
    Student *student2 = [Student new];
    student1.friend = student2;
    Student *student3 = [Student new];
    student2.friend = student3;
    student3.friend = self.student;
    self.students = @[self.student, student1, student2, student3];
    [self addObservers];
    //                                      st2     st3   self.st  st1
    [student1 setValue:@"Ivan" forKeyPath:@"friend.friend.friend.firstName"];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeSystem];
    [but setTitle:@"reset" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [but setFrame:CGRectMake(0, 500, 200, 50)];
    [self.view addSubview:but];
    
}

-(void) reset{
    [self.student reset];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"keyPath = %@, object = %@, change = %@, context = %@",keyPath,object,change,context);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (!cell){
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                       reuseIdentifier:@"reuseIdentifier"];
    }
    
    self.nameField = [[UITextField alloc] init];
    [self.nameField setRestorationIdentifier:@"nameField"];
    self.nameField.frame = cell.bounds;
    self.nameField.delegate = self;
    
    self.lastNameField = [[UITextField alloc] init];
    [self.lastNameField setRestorationIdentifier:@"lastNameField"];
    self.lastNameField.frame = cell.bounds;
    self.lastNameField.delegate = self;
    
    self.bdayField = [[UITextField alloc] init];
    [self.bdayField setRestorationIdentifier:@"bdayField"];
    self.bdayField.frame = cell.bounds;
    self.bdayField.delegate = self;
    
    NSArray *items = [NSArray arrayWithObjects:@"Male", @"Female", nil];
    self.genderSwitch = [[UISegmentedControl alloc] initWithItems:items];
    [self.genderSwitch setRestorationIdentifier:@"gender"];
    //self.genderSwitch.frame = cell.bounds;
    [self.genderSwitch addTarget:self action:@selector(switchGender:) forControlEvents:UIControlEventValueChanged];
    
    self.grade = [[UITextField alloc] init];
    [self.grade setRestorationIdentifier:@"grade"];
    self.grade.frame = cell.bounds;
    self.grade.delegate = self;
    
    switch (indexPath.row) {
        case 0:
            [cell addSubview: self.nameField];
            break;
        case 1:
            [cell addSubview: self.lastNameField];
            break;
        case 2:
            [cell addSubview: self.bdayField];
            break;
        case 3:
            [cell addSubview: self.genderSwitch];
            break;
        case 5:
            [cell addSubview: self.grade];
            break;
        default:
            break;
    }
    return cell;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField.restorationIdentifier isEqualToString:@"nameField"]) {
        self.student.firstName = textField.text;
    } else if ([textField.restorationIdentifier isEqualToString:@"lastNameField"]){
        self.student.lastName = textField.text;
    } else if ([textField.restorationIdentifier isEqualToString:@"bdayField"]){
        NSDateFormatter *df = [NSDateFormatter new];
        [df setDateFormat:@"dd.MM.yyyy"];
        self.student.dateOfBirth= [df dateFromString:textField.text];
    } else if ([textField.restorationIdentifier isEqualToString:@"grade"]){
        self.student.grade = [textField.text integerValue];
    }
}

-(void) switchGender: (UISegmentedControl*) control{
    NSInteger selected = [control selectedSegmentIndex];
    if (selected == 1){
        self.student.gender = Male;
    } else if (selected == 2) {
        self.student.gender = Female;
    }
}
@end
