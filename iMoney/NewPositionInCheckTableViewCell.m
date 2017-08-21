#import "NewPositionInCheckTableViewCell.h"
#import <UIKit/UITextField.h>


typedef NS_ENUM(NSInteger, OwnerState)
{
    kCommonState,
    kFirstOwmnerState,
    kSecondOwnerState,
    kCustomState
};


@interface NewPositionInCheckTableViewCell ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *ownerButton;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *priceField;
@property (weak, nonatomic) IBOutlet UITextField *rateField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rateWidht;
@property (nonatomic) OwnerState state;
@property (nonatomic) NSNumberFormatter *nf;

@end


@implementation NewPositionInCheckTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.rateWidht.constant = 50;
    
    self.nf = [NSNumberFormatter new];
    self.nf.minimumSignificantDigits = 1;
    self.nf.minimumFractionDigits = 1;
    self.nf.maximumFractionDigits = 2;
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    self.priceField.inputAccessoryView = numberToolbar;
    self.rateField.inputAccessoryView = numberToolbar;
}


- (void)setPosition:(PositionInCheck *)position
{
    _position = position;
    self.titleField.text = position.title;
    self.rateField.text = [self.nf stringFromNumber:[NSNumber numberWithFloat:position.rate]];
    self.priceField.text = [self.nf stringFromNumber:[NSNumber numberWithFloat:position.price]];
    if (position.rate == 0) {
        self.state = kSecondOwnerState;
    }
    else if (position.rate == 0.5) {
        self.state = kCommonState;
    }
    else if (position.rate == 1) {
        self.state = kFirstOwmnerState;
    }
    else {
        self.state = kCustomState;
    }
}


- (void)setState:(OwnerState)state
{
    _state = state;
    switch (state) {
        case kFirstOwmnerState:
            [self.ownerButton setImage:[UIImage imageNamed:@"Minus"]
                              forState:UIControlStateNormal];
            self.rateWidht.constant = 0.0;
            break;
        case kSecondOwnerState:
            [self.ownerButton setImage:[UIImage imageNamed:@"Plus"]
                              forState:UIControlStateNormal];
            self.rateWidht.constant = 0.0;
            break;
        case kCommonState:
            [self.ownerButton setImage:[UIImage imageNamed:@"Point"]
                              forState:UIControlStateNormal];
            self.rateWidht.constant = 0.0;
            break;
        case kCustomState:
            [self.ownerButton setImage:[UIImage imageNamed:@"Question"]
                              forState:UIControlStateNormal];
            self.rateWidht.constant = 50.0;
            break;
    }
}


#pragma  mark - UITextFieldDelegate implementation

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.titleField resignFirstResponder];
    return YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.rateField) {
        self.position.rate = [[self.nf numberFromString:self.rateField.text] floatValue];
    }
    else if (textField == self.titleField) {
        self.position.title = self.titleField.text;
    }
    else {
        self.position.price = [[self.nf numberFromString:self.priceField.text ] floatValue];
    }
    [self.delegate updatePosition:self.position atIndex:self.index];
}

#pragma mark - Action

- (void)doneWithNumberPad
{
    if ([self.rateField isFirstResponder]) {
        [self.rateField resignFirstResponder];
    }
    else {
        [self.priceField resignFirstResponder];
    }
}


- (IBAction)ownerButtonTapped:(id)sender
{
    switch (self.state) {
        case kCommonState:
            self.state = kFirstOwmnerState;
            self.position.rate = 1.0;
            break;
        case kFirstOwmnerState:
            self.state = kSecondOwnerState;
            self.position.rate = 0.0;
            break;
        case kSecondOwnerState:
            self.state = kCustomState;
            self.position.rate = 0.5;
            self.rateField.text = [self.nf stringFromNumber:[NSNumber numberWithFloat:self.position.rate]];
            break;
        case kCustomState:
            self.state = kCommonState;
            self.position.rate = 0.5;
            break;
    }
    [self.delegate updatePosition:self.position atIndex:self.index];
}

@end
