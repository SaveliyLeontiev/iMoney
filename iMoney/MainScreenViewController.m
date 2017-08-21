#import "MainScreenViewController.h"
#import "StorageManager.h"

@interface MainScreenViewController ()

@property (weak, nonatomic) IBOutlet UILabel *totalSum;

@end


@implementation MainScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    self.totalSum.text = [NSString stringWithFormat:@"%1.1f",[[StorageManager manager] totalSum]];
}

@end
