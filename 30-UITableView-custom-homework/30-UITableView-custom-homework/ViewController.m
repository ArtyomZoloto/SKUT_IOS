
#import "ViewController.h"
#import "AZTeam.h"
static NSString* kData = @"Data";
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property(strong, nonatomic) NSArray<AZTeam*>* teams;
@end

@implementation ViewController

- (void)loadView{
    [super loadView];
    AZTeam *t1 = [AZTeam new];
    t1.po = @"Maks";
    t1.participants = @[@"Masha", @"Armen", @"Fedor", @"Vera", @"Vitya"].mutableCopy;
    
    AZTeam *t2 = [AZTeam new];
    t2.po = @"Oksana";
    t2.participants = @[@"Dima", @"Olga", @"Sasha", @"Tema", @"Lesha", @"Igor", @"Pavlik", @"Elena N" ,@"Elena Z"].mutableCopy;
    
    self.teams = @[t1,t2];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = self.view.bounds;
    UITableView* tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.editing = YES;
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.teams.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.teams[section].participants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* customerCare = @"customerCare";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:customerCare];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:customerCare];
    }
    
    cell.textLabel.text = self.teams[indexPath.section].participants[indexPath.row];
    cell.detailTextLabel.textColor = [UIColor redColor];
    cell.detailTextLabel.text = @"Рабочий крестьянин";
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.teams[section].po;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    NSString *source = [self.teams[sourceIndexPath.section].participants[sourceIndexPath.row] copy];
    NSLog(@"source = %@", source);
    
    NSString *dest = [self.teams[destinationIndexPath.section].participants[destinationIndexPath.row] copy];
    NSLog(@"destination = %@", dest);
    
    self.teams[sourceIndexPath.section].participants[sourceIndexPath.row] = dest;
    self.teams[destinationIndexPath.section].participants[destinationIndexPath.row] = source;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
