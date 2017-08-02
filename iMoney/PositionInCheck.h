#import <Foundation/Foundation.h>


@interface PositionInCheck : NSObject <NSCoding>

@property(nonatomic, readwrite) NSString *title;
@property(nonatomic, readwrite) float price;
@property(nonatomic, readwrite) float rate;

- (instancetype)initWithTitle:(NSString *)title
                        price:(float)price
                         rate:(float)rate NS_DESIGNATED_INITIALIZER;

@end
