#import <Foundation/Foundation.h>

@interface SettingsManager : NSObject

@property (nonatomic, readonly) float totalSum;

+ (instancetype)manager;

@end
