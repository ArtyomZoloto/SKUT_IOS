
#import "ViewController.h"
#import "AZTeam.h"
#import "AddViewController.h"
static NSString* kData = @"Data";
@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property(strong, nonatomic) NSArray<AZTeam*>* teams;
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) UITextField *tf;

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
    
#pragma mark - UINavigationController
    self.navigationItem.title = @"Customer Care";
    UIBarButtonItem *bi_edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(handleEdit:)];
    UIBarButtonItem *bi_add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleAdd:)];
    self.navigationItem.rightBarButtonItems = @[bi_edit, bi_add];
    
    CGRect frame = self.view.bounds;
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(void) handleAdd: (id) elem {
//    UIViewController *addVc = [UIViewController new];
//    UIPickerView *pw = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 100)];
//    pw.layer.borderWidth = 2.0f;
//    pw.layer.borderColor = [UIColor brownColor].CGColor;
//    pw.dataSource = self;
//    pw.delegate = self;
//    [addVc.view addSubview:pw];
//
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 50)];
//    label.text = @"Придумайте имя участника";
//    [addVc.view addSubview:label];
//
//    //self.tf = [[UITextField alloc] init];
//    self.tf = [[UITextField alloc] initWithFrame: CGRectMake(0, 200, self.view.bounds.size.width, 50)];
//    [addVc.view addSubview:self.tf];
//
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 250, 100, 50)];
//    btn.layer.borderColor = [UIColor brownColor].CGColor;
//    btn.layer.borderWidth = 2.0f;
//    btn.titleLabel.text = @"Добавить";
//    btn.titleLabel.textColor = [UIColor blackColor];
//    [btn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
//    [addVc.view addSubview:btn];
//    [self.navigationController pushViewController: addVc animated:YES];
    
    AddViewController *addVC = [AddViewController new];
    [self.navigationController pushViewController:addVC animated:YES];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.teams[indexPath.section].participants removeObjectAtIndex:indexPath.row];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [self.tableView endUpdates];
    }
    
}

-(void) handleEdit: (id) elem {
    self.tableView.editing = !self.tableView.isEditing ;
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


#pragma mark - UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.teams.count;
}

#pragma mark - UIPickerViewDelegate

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.teams[row].po;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.isFirstResponder){
        [textField resignFirstResponder];
    }
    return YES;
}

@end
