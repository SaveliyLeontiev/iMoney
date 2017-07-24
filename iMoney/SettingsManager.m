#import "SettingsManager.h"


NSString const *kTotalSum = @"TotalSum";


@implementation SettingsManager

+ (instancetype) manager
{
    static SettingsManager *settingsManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        settingsManager = [[SettingsManager alloc] init];
    });
    return settingsManager;
}


- (instancetype)init
{
    if (self = [super init]) {
        _totalSum = [[[NSUserDefaults standardUserDefaults] objectForKey:kTotalSum] floatValue];
    }
    return self;
}

@end
