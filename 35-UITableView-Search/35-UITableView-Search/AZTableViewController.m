//
//  AZTableViewController.m
//  35-UITableView-Search
//
//  Created by iMac on 29/04/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import "AZTableViewController.h"
#import "EmpDao.h"

@interface AZTableViewController ()
@property (strong, nonatomic) EmpDao *dao;
@property (strong, nonatomic) NSString *filter;
@property (strong, nonatomic) NSArray<EmpBirthsdayBlock*> *data;
@end

@implementation AZTableViewController

- (void)loadView{
    [super loadView];
    self.dao = [EmpDao new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSArray<EmpBirthsdayBlock*>*) data {
    
    
    dispatch_queue_t global_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(global_queue, ^{
       self.data = [self.dao dataWithFilter:self.filter];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"ASYNC!");
        });
    });
    return _data;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data[section].employees.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", self.data[indexPath.section].employees[indexPath.row].name, self.data[indexPath.section].employees[indexPath.row].surName];
    cell.detailTextLabel.text = self.data[indexPath.section].employees[indexPath.row].birthDateString;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.data[section].dateString;
}


#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    self.filter = searchText;
    [self.tableView reloadData];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated: YES];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *arr = [NSMutableArray new];
    for (EmpBirthsdayBlock *section in self.data)
    {
        [arr addObject:section.dateString];
    }
    return arr;
}

@end
