#import "AZFileManagerTableViewController.h"

@interface AZFileManagerTableViewController ()
@property(strong, nonatomic) NSArray *contents;
@end

@implementation AZFileManagerTableViewController

- (void)loadView{
    [super loadView];
    if (!self.path){
        self.path = @"/Users/imac";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    if([[[self navigationController] viewControllers] count] > 1){
        UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithTitle:@"To root" style:UIBarButtonItemStylePlain target:self action:@selector(goToRoot:)];
        self.navigationItem.rightBarButtonItem = b;
    }
}

-(void) goToRoot: (id) id{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(NSArray *) contents {
    NSError *error = nil;
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:&error];
    return error ? nil : contents;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSError *error = nil;
    NSInteger count =  [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:&error].count;
    return error ? 0 : count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    }
    NSError *error = nil;
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:&error];
    cell.textLabel.text = contents[indexPath.row];
    NSString *currentPath = [self pathFor:indexPath];
    if ([self isDirectory: currentPath]){
        cell.imageView.image = [UIImage imageNamed:@"AZDirectory"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"AZFile"];
        NSDictionary<NSFileAttributeKey, id> *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:currentPath error:&error];
        NSNumber *fileSizeNumber = [fileAttributes objectForKey:NSFileSize];
        long long fileSize = [fileSizeNumber longLongValue];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%lld bytes",fileSize];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *desiredPath = [self pathFor:indexPath];
    if ([self isDirectory:desiredPath]){
        AZFileManagerTableViewController *fmVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FileManIdentifier"];
        fmVC.path = desiredPath;
        [self.navigationController pushViewController:fmVC animated:YES];
    }
}

-(BOOL) isDirectory: (NSString *) desiredPath {
    BOOL isDirectory;
    [[NSFileManager defaultManager] fileExistsAtPath:desiredPath isDirectory:&isDirectory];
    return isDirectory;
}

-(NSString*) pathFor: (NSIndexPath *) indexPath{
    NSString *currentItem = self.contents[indexPath.row];
    NSString *desiredPath = [self.path stringByAppendingPathComponent:currentItem];
    return desiredPath;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
