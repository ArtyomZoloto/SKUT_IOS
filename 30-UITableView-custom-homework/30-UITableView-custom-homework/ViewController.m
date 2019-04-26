//
//  ViewController.m
//  30-UITableView-custom-homework
//
//  Created by Zolotoverkhov Artem on 26/04/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "ViewController.h"
#import "AZTeam.h"

@interface ViewController () <UITableViewDataSource>
@property(strong, nonatomic) NSArray<AZTeam*>* teams;
@end

@implementation ViewController

- (void)loadView{
    [super loadView];
    AZTeam *t1 = [AZTeam new];
    t1.po = @"Maks";
    t1.participants = [NSArray arrayWithObject:@"ff"];
    t1.participants = @[@"Masha", @"Armen", @"Fedor", @"Vera", @"Vitya"];
    
    AZTeam *t2 = [AZTeam new];
    t2.po = @"Oksana";
    t2.participants = @[@"Dima", @"Olga", @"Sasha", @"Tema", @"Lesha", @"Igor", @"Pavlik", @"Elena N" ,@"Elena Z"];
    
    self.teams = @[t1,t2];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat x = CGRectGetMaxX(self.view.bounds);
    CGFloat y = CGRectGetMaxY(self.view.bounds);
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, x, y) style:UITableViewStylePlain];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.teams.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.teams[section].participants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static const NSString* customerCare = @"customerCare";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:customerCare];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:customerCare];
    }
    
    cell.textLabel.text = self.teams[indexPath.section].participants[indexPath.row];\
    cell.detailTextLabel.text = @"Рабочий крестьянин";
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.teams[section].po;
}

@end
