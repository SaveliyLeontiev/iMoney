@class PositionInCheck;

@protocol NewPositionCellDelegate <NSObject>

- (void)updatePosition:(PositionInCheck *)position atIndex:(NSUInteger)index;

@end
