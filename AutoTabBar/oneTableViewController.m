
#import "oneTableViewController.h"

@interface oneTableViewController ()

@end

@implementation oneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *item  = [[UIBarButtonItem alloc]initWithTitle:@"push" style:UIBarButtonItemStyleDone target:self action:@selector(push)];

    self.navigationItem.leftBarButtonItem = item;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)push {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor darkGrayColor];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
