#import "PositionInCheck.h"

NSString const *kTitle = @"Title";
NSString const *kPrice = @"Price";
NSString const *kRate = @"Rate";


@implementation PositionInCheck

- (instancetype)init
{
    return [self initWithTitle:@"" price:0.0 rate:0.5];
}


- (instancetype)initWithTitle:(NSString *)title price:(float)price rate:(float)rate
{
    self = [super init];
    if (self) {
        _title = title;
        _price = price;
        _rate = rate;
    }
    return self;
}


#pragma mark - NSCoding implementation

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSString *title = [aDecoder decodeObjectForKey:kTitle];
    float price = [aDecoder decodeFloatForKey:kPrice];
    float rate = [aDecoder decodeFloatForKey:kRate];
    
    return [self initWithTitle:title price:price rate:rate];
}


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:kTitle];
    [aCoder encodeFloat:self.price forKey:kPrice];
    [aCoder encodeFloat:self.rate forKey:kRate];
}

@end
