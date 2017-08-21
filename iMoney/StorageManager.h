#import <Foundation/Foundation.h>

@interface StorageManager : NSObject

@property (nonatomic) float totalSum;

+ (instancetype)manager;

- (void)saveStorage;

@end
