//
//  ModJournalismStyle1SegmentView.h
//  CompBaiduMap
//
//  Created by admin on 2018/5/2.
//

#import <UIKit/UIKit.h>

@interface ModJournalismStyle1SegmentView : UIView
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) void (^clickedItemHandle)(NSInteger);
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, assign) BOOL showSeparator;

- (void)setOffsetPercent:(CGFloat)percent;
@end
