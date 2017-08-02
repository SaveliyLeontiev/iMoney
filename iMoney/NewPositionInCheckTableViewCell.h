#import <UIKit/UIKit.h>
#import "PositionInCheck.h"
#import "NewPositionCellDelegate.h"


@interface NewPositionInCheckTableViewCell : UITableViewCell

@property (nonatomic, readwrite) PositionInCheck *position;
@property (nonatomic, readwrite) NSInteger index;
@property (nonatomic, weak) id<NewPositionCellDelegate> delegate;

@end
