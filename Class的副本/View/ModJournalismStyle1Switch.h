//
//  ModJournalismStyle1Switch.h
//  CompBaiduMap
//
//  Created by admin on 2018/4/28.
//

#import <UIKit/UIKit.h>

@interface ModJournalismStyle1Switch : UIControl
/**
 背景色
 */
@property (strong, nonatomic) UIColor *backgroundColor;
/**
 滑块颜色
 */
@property (strong, nonatomic) UIColor *sliderColor;
/**
 滑块内部label颜色
 */
@property (strong, nonatomic) UIColor *labelTextColorInsideSlider;
/**
 滑块外部label颜色
 */
@property (strong, nonatomic) UIColor *labelTextColorOutsideSlider;
/**
 字体大小
 */
@property (strong, nonatomic) UIFont *font;
/**
 圆角半径
 */
@property (nonatomic) CGFloat cornerRadius;
/**
 滑块偏移量
 */
@property (nonatomic) CGFloat sliderOffset;
/**
 初始化类方法
 @param strings 字符串数组
 */
+ (instancetype)switchWithStringsArray:(NSArray *)strings;
/**
 初始化对象方法
 @param strings 字符串数组
 */
- (instancetype)initWithStringsArray:(NSArray *)strings;
/**
 初始化对象方法
 @param strings 富文本字符串数组
 */
- (instancetype)initWithAttributedStringsArray:(NSArray *)strings;
/**
 强制选中下标
 @param index 选中下标
 */
- (void)forceSelectedIndex:(NSInteger)index animated:(BOOL)animated;
/**
 点击下标
 @param index 回调index
 */
- (void)setPressedHandler:(void (^)(NSUInteger index))handler;
/**
 点击下标
 @param index 回调index
 */
- (void)setWillBePressedHandler:(void (^)(NSUInteger index))handler;
/**
 选中下标
 @param index 选中index
  @param animated 是否带动画效果
 */
- (void)selectIndex:(NSInteger)index animated:(BOOL)animated;
@end
