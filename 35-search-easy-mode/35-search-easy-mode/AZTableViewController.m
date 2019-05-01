#import "AZTableViewController.h"

@interface AZTableViewController ()
@property(strong, nonatomic) NSArray<NSString*> *randomNames;
@end

@implementation AZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [self randomNames]; //@[@"Anna", @"Eugen", @"Valera", @"Michael"];
    self.displayData = self.data;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.displayData.count;
}

-(void) setFilter:(NSString *)filter{
    _filter = filter;
    __weak AZTableViewController *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         [weakSelf updateDisplayData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    });
}
    

-(void) updateDisplayData{
    self.displayData = [self displayData:self.data WithFilter:self.filter];
}

-(NSArray*) displayData: (NSArray*)data WithFilter: (NSString*)filter{
    if (!filter || filter.length == 0){
        return self.data;
    }
    NSMutableArray *result = [NSMutableArray new];
    for (NSString *string in data){
        NSUInteger a = [string rangeOfString:filter options:NSCaseInsensitiveSearch].location;
        if (a != NSNotFound){
            [result addObject:string];
        }
    }
    return [NSArray arrayWithArray:result];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text = self.displayData[indexPath.row];
    return cell;
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    self.filter = searchText;
}


-(NSArray<NSString*>*) randomNames {
    NSArray* names = @[@"Josue",
                       @"Duane",
                       @"Chau",
                       @"Cammie",
                       @"Sophie",
                       @"Michale",
                       @"Shad",
                       @"Aron",
                       @"Cherryl",
                       @"Faye",
                       @"Maegan",
                       @"Rosalia",
                       @"Aida",
                       @"Rosie",
                       @"Lien",
                       @"Jessia",
                       @"Milagros",
                       @"Viva",
                       @"Samuel",
                       @"Terra"
                       ];
    
        NSMutableArray *arr = [NSMutableArray new];
        for (int i = 0; i < 50000; i++){

            [arr addObject: names[arc4random() % names.count]];
        }
        return [NSArray arrayWithArray:arr];
    }

//- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    NSMutableArray *arr = [NSMutableArray new];
//    for (NSString *s in _displayData){
//        NSString *letter = [s substringWithRange:NSMakeRange(0, 1)];
//        [arr addObject:letter];
//    }
//    return [NSArray arrayWithArray:arr];
//}

@end
