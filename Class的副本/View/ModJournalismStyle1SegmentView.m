//
//  ModJournalismStyle1SegmentView.m
//  CompBaiduMap
//
//  Created by admin on 2018/5/2.
//

#import "ModJournalismStyle1SegmentView.h"

@interface ModJournalismStyle1SegmentView ()
@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, assign) UIButton *lastButton;
@property (nonatomic, assign) CGFloat buttonWidth;
@property (nonatomic, assign) NSInteger clickCount;
@property (nonatomic, assign) CGFloat lastPercent;

@end
@implementation ModJournalismStyle1SegmentView
- (instancetype)init
{
    self = [self initWithFrame:CGRectNull];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleColor =[UIColor grayColor];
        self.indicatorColor = self.selectedColor =[UIColor orangeColor];
        self.showSeparator = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.titleColor =[UIColor grayColor];
        self.indicatorColor = self.selectedColor =[UIColor orangeColor];
        self.showSeparator = YES;
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    self.buttonWidth = self.bounds.size.width == 0 ? SCREEN_WIDTH / _titleArray.count : self.bounds.size.width / _titleArray.count;
    [self initView];
}

- (void)initView {
    self.buttonArray = [NSMutableArray array];
    for (NSInteger i = 0; i < _titleArray.count; i ++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        btn.tag = i + 1;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:_titleColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickedItem:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.buttonArray addObject:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(_buttonWidth);
            make.height.centerY.equalTo(self);
            make.left.equalTo(self).with.offset(_buttonWidth * i);
        }];
        
        if (_showSeparator && i < _titleArray.count - 1) {
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor darkGrayColor];
            [self addSubview:lineView];
            
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(btn.mas_right).with.offset(-0.5);
                make.width.mas_equalTo(1);
                make.height.mas_equalTo(15);
                make.centerY.equalTo(self);
            }];
        }
    }
    
    self.indicatorView = [[UIView alloc] init];
    self.indicatorView.backgroundColor = _indicatorColor;
    self.indicatorView.layer.cornerRadius = 1;
    self.indicatorView.layer.masksToBounds = YES;
    [self addSubview:_indicatorView];
    
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(_buttonWidth / 2);
        make.height.mas_equalTo(2);
        make.width.mas_equalTo(_buttonWidth * 0.7);
        make.bottom.equalTo(self).offset(-0.4);
    }];
    self.lastButton = _buttonArray[0];
    [self.lastButton setTitleColor:_selectedColor forState:UIControlStateNormal];
}

- (void)clickedItem:(UIButton *)btn {
    if (btn == _lastButton) {
        return;
    }
    [btn setTitleColor:_selectedColor forState:UIControlStateNormal];
    [self.lastButton setTitleColor:_titleColor forState:UIControlStateNormal];
    self.lastButton = btn;
    self.clickCount++;
    [UIView animateWithDuration:0.3 animations:^{
        [self.indicatorView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_left).offset(_buttonWidth / 2 + _buttonWidth * (btn.tag - 1));
        }];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.clickCount--;
    }];
    
    if (self.clickedItemHandle) {
        self.clickedItemHandle(btn.tag - 1);
    }
}

- (void)setOffsetPercent:(CGFloat)percent {
    if (self.clickCount > 0) {
        return;
    }
    [self.indicatorView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(_buttonWidth / 2 + (_buttonWidth * (_titleArray.count - 1)) * percent);
    }];
    CGFloat criticalPoint = 1.f / (_titleArray.count - 1) / 2;
    NSInteger temp = percent / criticalPoint;
    NSInteger index = temp / 2 + temp % 2;
    UIButton *btn = _buttonArray[index];
    if (btn == _lastButton) {
        return;
    }
    [btn setTitleColor:_selectedColor forState:UIControlStateNormal];
    [self.lastButton setTitleColor:_titleColor forState:UIControlStateNormal];
    self.lastButton = btn;
}
@end
