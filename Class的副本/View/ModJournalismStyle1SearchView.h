//
//  ModJournalismStyle1SearchView.h
//  CompBaiduMap
//
//  Created by admin on 2018/4/28.
//

#import <UIKit/UIKit.h>

@interface ModJournalismStyle1SearchView : UIView
@property (nonatomic, strong) UIView      *      bgview;
@property (nonatomic, strong) MxuAsyncButton    *    cancelBtn;
@property (nonatomic, strong) MxuAsyncImageView * searchImage;
@property (nonatomic, strong) UITextField * textField;

- (instancetype)initWithFrame:(CGRect)frame buttonColor:(NSString *)buttonColor withModuleSign:(NSString *)moduleSign;
@end
