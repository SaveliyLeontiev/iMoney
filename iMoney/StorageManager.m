#import "StorageManager.h"


NSString const *kTotalSum = @"TotalSum";


@implementation StorageManager

+ (instancetype) manager
{
    static StorageManager *storageManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        storageManager = [[StorageManager alloc] init];
    });
    return storageManager;
}


- (instancetype)init
{
    if (self = [super init]) {
        _totalSum = [[[NSUserDefaults standardUserDefaults] objectForKey:kTotalSum] floatValue];
    }
    return self;
}


- (void)saveStorage
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:self.totalSum]
                                              forKey:kTotalSum];
}
@end
