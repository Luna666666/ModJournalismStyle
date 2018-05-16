//
//  ModJournalismStyle1SearchView.m
//  CompBaiduMap
//
//  Created by admin on 2018/4/28.
//

#import "ModJournalismStyle1SearchView.h"

@implementation ModJournalismStyle1SearchView
- (instancetype)initWithFrame:(CGRect)frame buttonColor:(NSString *)buttonColor withModuleSign:(NSString *)moduleSign{
    self = [super initWithFrame:frame];
    if (self) {
        _cancelBtn = [[MxuAsyncButton alloc] init];
        _cancelBtn.translatesAutoresizingMaskIntoConstraints = NO;
        _cancelBtn.tag=666;
        _cancelBtn.backgroundColor = [UIColor clearColor];
        _cancelBtn.needShowPlaceholder =NO;
        [_cancelBtn setTitle:@"" forState:UIControlStateNormal];  //取消
        [_cancelBtn setTitleColor:[UIColor hexChangeFloat:@"8B8B8F"] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont loadFontStyleWithDefaultFontNum:15 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:moduleSign];
        [_cancelBtn addTarget:self action:@selector(cancelBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelBtn];
        
        _bgview = [[UIView alloc]initConstraints];
        _bgview.tag=777;
        _bgview.backgroundColor =[UIColor hexChangeFloat:@"E66961"];
        _bgview.layer.masksToBounds = YES;
        _bgview.layer.cornerRadius =14;
        [self addSubview:_bgview];
        
        _searchImage = [[MxuAsyncImageView alloc] init];
        _searchImage.tag=888;
        _searchImage.backgroundColor = [UIColor clearColor];
        _searchImage.normalLocalImageName = @"search_hot_Key";
        [_bgview addSubview:_searchImage];
        
        _textField = [[UITextField alloc]initConstraints];
        _textField.tag=999;
        [_textField setValue:[UIFont loadFontStyleWithDefaultFontNum:13 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:moduleSign] forKeyPath:@"_placeholderLabel.font"];
        _textField.textColor=[UIColor hexChangeFloat:@"8B8B8F"];
        _textField.backgroundColor =[UIColor hexChangeFloat:@"E66961"];
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [_textField setValue:[UIColor hexChangeFloat:@"8B8B8F"] forKeyPath:@"_placeholderLabel.textColor"];
        _textField.font = [UIFont loadFontStyleWithDefaultFontNum:13 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:moduleSign];
        _textField.clearButtonMode = UITextFieldViewModeAlways;
        _textField.returnKeyType = UIReturnKeySearch;
        [_bgview addSubview:_textField];
        WEAKSELF
        [_bgview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo( weakSelf);
            make.left.mas_equalTo( weakSelf.mas_left).offset(15);
            make.top.mas_equalTo( weakSelf.mas_top).offset(0);
            make.right.mas_equalTo( weakSelf.cancelBtn.mas_left).offset(-16);
            make.height.mas_equalTo(28);
        }];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo( weakSelf);
            make.right.mas_equalTo( weakSelf.mas_right).offset(-17);
            make.width.mas_equalTo(40);
            make.height.equalTo(@20);
            
        }];
        [_searchImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo( weakSelf.bgview.mas_left).offset(6);
            make.centerY.equalTo( weakSelf.bgview);
            make.size.mas_equalTo( CGSizeMake(15, 15));
        }];
        
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo( weakSelf.bgview);
            make.left.mas_equalTo( weakSelf.searchImage.mas_right).offset(5);
            make.right.mas_equalTo( weakSelf.bgview.mas_right).offset( 0);
            make.width.mas_equalTo(28);
        }];
    }
    return self;
}
@end
