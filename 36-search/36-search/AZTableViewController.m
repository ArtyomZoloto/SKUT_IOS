#import "AZTableViewController.h"
#import "AZEmployee.h"
#import "AZRandomEmployeeGenerator.h"

@interface AZTableViewController ()
@property(strong, nonatomic) NSMutableArray<AZEmployee*>* employees;
@property(strong, nonatomic) NSArray<AZEmployee*>* showedEmployees;

@property(strong, nonatomic) NSMutableDictionary<NSNumber*, NSMutableArray<AZEmployee*>*> *dictionary;
@end

@implementation AZTableViewController

-(void) loadView {
    [super loadView];
    self.employees = [NSMutableArray new];
    AZRandomEmployeeGenerator *generator = [AZRandomEmployeeGenerator new];
    for(int i = 0; i < 50000; i++){
        [self.employees addObject: [generator randomEmployee]];
    }
    self.showedEmployees = [self employees:self.employees byFilter:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSArray<AZEmployee*>*) employees:(NSArray<AZEmployee*>*) emp_arr byFilter:(NSString*)string{
    NSMutableArray *arr = [NSMutableArray new];
    for (AZEmployee *emp in emp_arr){
        if (string && [emp.name rangeOfString:string].location == NSNotFound){
            if (string && [emp.name rangeOfString:string].location == NSNotFound){
                continue;
            }
        }
        [arr addObject:emp];
    }
    return arr;
}

#pragma mark - UITableViewDataSource


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    if (self.showedEmployees.count > 1){
    AZEmployee *emp = self.showedEmployees[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", emp.name, emp.surName];
    cell.detailTextLabel.text = emp.dateString;
    } else {
        cell.textLabel.text = @"Nothing found :-(";
    }
    return cell;
}

//- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"Header";
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.employees.count;
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"newText = %@", searchText);
    self.showedEmployees = [self employees:self.employees byFilter:searchText];
    [self.tableView reloadData];
}




@end
