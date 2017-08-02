#import "NewCheckViewController.h"
#import "NewPositionInCheckTableViewCell.h"
#import "PositionInCheck.h"
#import "NewPositionCellDelegate.h"


NSString const *kNewPositionCellID = @"NewPositionCellID";


@interface NewCheckViewController () <UITableViewDataSource, UITextFieldDelegate,NewPositionCellDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UISwitch *debtSwitch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalSumLabel;
@property (weak, nonatomic) IBOutlet UIStepper *positionCounter;

@property (nonatomic) NSMutableArray<PositionInCheck *> *check;

@end

@implementation NewCheckViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"NewPositionInCheckTableViewCell" bundle:nil] forCellReuseIdentifier:kNewPositionCellID];
    PositionInCheck *position = [[PositionInCheck alloc] init];
    self.check = [NSMutableArray arrayWithObject:position];
    [self reloadCheck];
}


- (void)reloadCheck
{
    float sum = 0.0;
    for (PositionInCheck *position in self.check) {
        float price = 0.0;
        if ([self.debtSwitch isOn]) {
            price = -position.rate*position.price;
        }
        else {
            price = (1-position.rate)*position.price;
        }
        sum += price;
    }
    self.totalSumLabel.text = [NSString stringWithFormat:@"Total: %1.1f",sum];
}


#pragma marks - TableViewDataSourse implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)self.positionCounter.value;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewPositionInCheckTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNewPositionCellID];
    PositionInCheck *position = [self.check objectAtIndex:indexPath.row];
    [cell setPosition:position];
    cell.index = indexPath.row;
    cell.delegate = self;
    return cell;
}


#pragma mark - TextFieldDelegate implementation

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - NewPositionCellDelegate implementation

- (void)updatePosition:(PositionInCheck *)position atIndex:(NSUInteger)index
{
    [self.check setObject:position atIndexedSubscript:index];
    [self reloadCheck];
}

#pragma mark - Action

- (IBAction)counterValueChanged:(id)sender
{
    if ((NSInteger)self.positionCounter.value > [self.check count]) {
        PositionInCheck *position = [[PositionInCheck alloc] init];
        [self.check addObject:position];
    }
    else {
        [self.check removeLastObject];
    }
    [self.tableView reloadData];
    [self reloadCheck];
}


- (IBAction)completeButtonTapped:(id)sender
{
    
}

@end
