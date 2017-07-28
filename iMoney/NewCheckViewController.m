#import "NewCheckViewController.h"
#import "NewPositionInCheckTableViewCell.h"


NSString const *kNewpositionCellID = @"NewPositionCellID";

@interface NewCheckViewController () <UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UISwitch *debtSwitch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalSumLabel;
@property (weak, nonatomic) IBOutlet UIStepper *positionCounter;



@end

@implementation NewCheckViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma marks - TableViewDataSourse implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)self.positionCounter.value;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewPositionInCheckTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNewpositionCellID];
#warning TODO: cell initialization
    return cell;
}

@end
