//
//  ModJournalismStyle1Cell.m
//  CompBaiduMap
//
//  Created by admin on 2018/4/24.
//

#import "ModJournalismStyle1Cell.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "ModJournalismStyleLocalized.h"
#import "ModJournalismStyleBaseHeader.h"

@implementation ModJournalismStyle1Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        self.userInteractionEnabled=YES;
        [self addModJournalismStyle1SubViews];
        [self configModJournalismStyle1Layout];
    }
    return self;
}
/**
  添加ModJournalismStyle1Cell子视图
 */
-(void)addModJournalismStyle1SubViews{
    [self.contentView addSubview:self.headIcon];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.praise];
    [self.contentView addSubview:self.bottomGrayLine];
}
/**
 配置ModJournalismStyle1Layout
 */
- (void)configModJournalismStyle1Layout{
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(16);
        make.top.equalTo(self.contentView.mas_top).with.offset(17);
        make.width.equalTo(@57);
        make.height.equalTo(@57);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIcon.mas_right).with.offset(15);
        make.top.equalTo(self.contentView.mas_top).with.offset(23);
        make.height.equalTo(@16);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-27);
        make.top.equalTo(self.contentView.mas_top).with.offset(28);
        make.height.equalTo(@11);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIcon.mas_right).with.offset(15);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-27);
        make.height.equalTo(@16);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel);
        make.right.mas_equalTo(-27);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(14);
    }];
    [self.praise mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).with.offset(12);
        make.right.equalTo(self.contentView.mas_right).with.offset(-27);
        make.height.equalTo(@14);
    }];
    [self.bottomGrayLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-27);
        make.top.equalTo(self.praise.mas_bottom).with.offset(12);
        make.height.equalTo(@0.5);
        
    }];
    self.hyb_lastViewInCell = self.bottomGrayLine;
    self.hyb_bottomOffsetToCell =0.01;
}
-(void)loadJournalismStyle1TextWithModel:(ModJournalismStyle1Model*)model{
    _headIcon.normalLocalImageName=[NSString stringWithFormat:@"%@",@"user_default_icon.png"];
    [self.nameLabel setText:model.userName afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange range1 = NSMakeRange(0,2);
        NSRange range2 = NSMakeRange(2,model.userName.length-2);
        [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont loadFontStyleWithDefaultFontNum:20 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil] range:range1];
        [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont loadFontStyleWithDefaultFontNum:9 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil] range:range2];
        return mutableAttributedString;
    }];
    self.dateLabel.text=[NSString stringWithFormat:@"%@",model.date];
    self.titleLabel.text=[NSString stringWithFormat:@"%@",model.title];
    self.detailLabel.text=[NSString stringWithFormat:@"%@",model.detail];
    if ([model.is_Zan isEqualToNumber:@0]) {
        [self.praise setImage:[UIImage imageNamed:@"modJournalismStyle1_Zan.png"] forState:UIControlStateNormal];
        [self.praise setTitle:[NSString stringWithFormat:@"%@",model.zanCount] forState:UIControlStateNormal];
        [self.praise setTitleColor:[UIColor hexChangeFloat:@"737171"] forState:UIControlStateNormal];
    }else if ([model.is_Zan isEqualToNumber:@1]){
        [self.praise setImage:[UIImage imageNamed:@"modJournalismStyle1_alreadyZan.png"] forState:UIControlStateNormal];
        [self.praise setTitle:[NSString stringWithFormat:@"%@",model.zanCount] forState:UIControlStateNormal];
        [self.praise setTitleColor:[UIColor hexChangeFloat:@"E04339"] forState:UIControlStateNormal];
    }
    
}
/**
  跳转个人中心
  @param sender 当前点按手势
 */
- (void)modJournalismStyle1CellJumpPersonalCenterTap:(UIGestureRecognizer *)gestureRecognizer{
    if ([_delegate respondsToSelector:@selector(selectModJournalismStyle1Cell:modJournalismStyle1jumpPersonalCenterAction:)]){
        [_delegate selectModJournalismStyle1Cell:self modJournalismStyle1jumpPersonalCenterAction:gestureRecognizer];
    }
}
/**
 点击点赞
 @param sender 当前点击按钮
 */
-(void)modJournalismStyle1CellPraiseClicked:(UIButton*)sender{
    if ([_delegate respondsToSelector:@selector(selectModJournalismStyle1Cell:modJournalismStyle1praiseAction:)]){
        [_delegate selectModJournalismStyle1Cell:self modJournalismStyle1praiseAction:sender];
    }
}
/**
 ModJournalismStyle1Cell子控件懒加载
 */
-(MxuAsyncImageView*)headIcon{
    if (!_headIcon) {
        _headIcon = [[MxuAsyncImageView alloc]init];
        _headIcon.backgroundColor =[UIColor clearColor];
        _headIcon.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(modJournalismStyle1CellJumpPersonalCenterTap:)];
        [_headIcon addGestureRecognizer:singleTap];
        _headIcon.contentMode = UIViewContentModeScaleAspectFill;
        _headIcon.clipsToBounds = YES;
        _headIcon.layer.cornerRadius=21;
        [_headIcon setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_headIcon setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    }
    return _headIcon;
}
-(TTTAttributedLabel*)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor =[UIColor hexChangeFloat:@"03266F"];
        _nameLabel.numberOfLines =1;
        _nameLabel.font = [UIFont loadFontStyleWithDefaultFontNum:20 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
    }
    return _nameLabel;
}
-(TTTAttributedLabel*)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _dateLabel.backgroundColor = [UIColor clearColor];
        _dateLabel.textColor =[UIColor hexChangeFloat:@"5D5D5D"];
        _dateLabel.numberOfLines =1;
        _dateLabel.lineSpacing = 3;
        _dateLabel.font = [UIFont loadFontStyleWithDefaultFontNum:14 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
    }
    return _dateLabel;
}
-(TTTAttributedLabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor =[UIColor hexChangeFloat:@"000000"];
        _titleLabel.numberOfLines =0;
        _titleLabel.lineSpacing = 3;
        _titleLabel.font = [UIFont loadFontStyleWithDefaultFontNum:20 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
    }
    return _titleLabel;
}
-(TTTAttributedLabel*)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _detailLabel.backgroundColor = [UIColor clearColor];
        _detailLabel.textColor =[UIColor hexChangeFloat:@"000000"];
        _detailLabel.preferredMaxLayoutWidth =SCREEN_WIDTH-16-57;
        _detailLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _detailLabel.numberOfLines =0;
        _detailLabel.lineSpacing = 3;
        _detailLabel.font = [UIFont loadFontStyleWithDefaultFontNum:14 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
    }
    return _detailLabel;
}
-(UIButton*)praise{
    if (!_praise) {
        _praise=[UIButton buttonWithType:UIButtonTypeCustom];
        _praise.backgroundColor=[UIColor clearColor];
        [_praise setTitle:@"56" forState:UIControlStateNormal];
        [_praise setImage:[UIImage imageNamed:@"modJournalismStyle1_Zan.png.png"] forState:UIControlStateNormal];
        _praise.titleLabel.font=[UIFont loadFontStyleWithDefaultFontNum:15 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        [_praise setTitleColor:[UIColor hexChangeFloat:@"737171"] forState:UIControlStateNormal];
        [_praise addTarget:self action:@selector(modJournalismStyle1CellPraiseClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _praise;
}
-(UIView*)bottomGrayLine{
    if (!_bottomGrayLine) {
        _bottomGrayLine=[[UIView alloc]init];
        _bottomGrayLine.backgroundColor=[UIColor hexChangeFloat:@"959595"];
    }
    return _bottomGrayLine;
}
@end


@implementation ModJournalismStyle1AudioCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        self.userInteractionEnabled=YES;
        [self addModJournalismStyle1AudioSubViews];
        [self configModJournalismStyle1AudioLayout];
    }
    return self;
}
/**
 添加ModJournalismStyle1AudioCell子视图
 */
-(void)addModJournalismStyle1AudioSubViews{
    [self.contentView addSubview:self.headIcon];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.isLive];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.audioPicture];
    [self.contentView addSubview:self.praise];
    [self.contentView addSubview:self.bottomGraysLine];
}
/**
 配置ModJournalismStyle1AudioLayout
 */
- (void)configModJournalismStyle1AudioLayout{
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(16);
        make.top.equalTo(self.contentView.mas_top).with.offset(17);
        make.width.equalTo(@57);
        make.height.equalTo(@57);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIcon.mas_right).with.offset(15);
        make.top.equalTo(self.contentView.mas_top).with.offset(23);
        make.height.equalTo(@16);
    }];
    [self.isLive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-26);
        make.top.equalTo(self.contentView.mas_top).with.offset(25);
        make.width.equalTo(@57);
        make.height.equalTo(@16);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.isLive.mas_left).with.offset(-5);
        make.top.equalTo(self.contentView.mas_top).with.offset(24);
        make.height.equalTo(@11);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIcon.mas_right).with.offset(15);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-27);
        make.height.equalTo(@40);
    }];
    [self.audioPicture mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIcon.mas_right).with.offset(15);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(9);
        make.right.equalTo(self.contentView.mas_right).with.offset(-27);
        make.height.equalTo(@71);
    }];
    [self.praise mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.audioPicture.mas_bottom).with.offset(13);
        make.right.equalTo(self.contentView.mas_right).with.offset(-27);
        make.height.equalTo(@14);
    }];
    [self.bottomGraysLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-27);
        make.top.equalTo(self.praise.mas_bottom).with.offset(12);
        make.height.equalTo(@0.5);
    }];
    self.hyb_lastViewInCell =self.bottomGraysLine;
    self.hyb_bottomOffsetToCell =0.01;
}
-(void)loadJournalismStyle1AudioWithModel:(ModJournalismStyle1Model *)model{
    self.headIcon.normalLocalImageName=[NSString stringWithFormat:@"%@",@"user_default_icon"];
    [self.nameLabel setText:model.userName afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange range1 = NSMakeRange(0,2);
        NSRange range2 = NSMakeRange(2,model.userName.length-2);
        [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont loadFontStyleWithDefaultFontNum:20 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil] range:range1];
        [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont loadFontStyleWithDefaultFontNum:9 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil] range:range2];
        return mutableAttributedString;
    }];
    if ([model.isLive isEqualToNumber:@0]) {
        _isLive.backgroundColor=[UIColor hexChangeFloat:@"E04339"];
        self.dateLabel.hidden=YES;
        [_isLive mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@57);
        }];
        [_isLive setTitle:[CustomLocalizedString  loadCustomLocalizedStringWithKey:  LOCALIZED_JOURNALISM_BEING_BROADCAST_LIVE identification:JOURNALISM_LOCALIZABLE_NAME] forState:UIControlStateNormal];
    }else if ([model.isLive isEqualToNumber:@1]){
        _isLive.backgroundColor=[UIColor hexChangeFloat:@"959595"];
        [_isLive mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@30);
        }];
        [_isLive setTitle:[CustomLocalizedString  loadCustomLocalizedStringWithKey:LOCALIZED_JOURNALISM_LOOK_BACK identification:JOURNALISM_LOCALIZABLE_NAME] forState:UIControlStateNormal];
        self.dateLabel.text=model.date;
    }
    self.titleLabel.text=[NSString stringWithFormat:@"%@",model.title];
    if ([model.is_Zan isEqualToNumber:@0]) {
        [self.praise setImage:[UIImage imageNamed:@"modJournalismStyle1_Zan.png"] forState:UIControlStateNormal];
        [self.praise setTitle:[NSString stringWithFormat:@"%@",model.zanCount] forState:UIControlStateNormal];
        [self.praise setTitleColor:[UIColor hexChangeFloat:@"737171"] forState:UIControlStateNormal];
    }else if ([model.is_Zan isEqualToNumber:@1]){
        [self.praise setImage:[UIImage imageNamed:@"modJournalismStyle1_alreadyZan.png"] forState:UIControlStateNormal];
        [self.praise setTitle:[NSString stringWithFormat:@"%@",model.zanCount] forState:UIControlStateNormal];
        [self.praise setTitleColor:[UIColor hexChangeFloat:@"E04339"] forState:UIControlStateNormal];
    }
}
/**
 跳转个人中心
 @param sender 当前点按手势
 */
- (void)modJournalismStyle1AudioJumpPersonalCenterTap:(UIGestureRecognizer *)gestureRecognizer{
    if ([_delegate respondsToSelector:@selector(selectModJournalismStyle1AudioCell:modJournalismStyle1AudioCelljumpPersonalCenterAction:)]){
        [_delegate selectModJournalismStyle1AudioCell:self modJournalismStyle1AudioCelljumpPersonalCenterAction:gestureRecognizer];
    }
}
/**
点击正在直播或者回看
 @param sender 当前点击按钮
 */
-(void)isLiveClicked:(UIButton*)sender{
    if ([_delegate respondsToSelector:@selector(selectModJournalismStyle1AudioCell:liveAction:)]){
        [_delegate selectModJournalismStyle1AudioCell:self  liveAction:sender];
    }
}
/**
 点击点赞
 @param sender 当前点击按钮
 */
-(void)modJournalismStyle1AudioCellPraiseClicked:(UIButton*)sender{
    if ([_delegate respondsToSelector:@selector(selectModJournalismStyle1AudioCell:modJournalismStyle1AudioCellpraiseAction:)]){
        [_delegate selectModJournalismStyle1AudioCell:self modJournalismStyle1AudioCellpraiseAction:sender];
    }
}
/**
 ModJournalismStyle1AudioCell子控件懒加载
 */
-(MxuAsyncImageView*)headIcon{
    if (!_headIcon) {
        _headIcon = [[MxuAsyncImageView alloc]init];
        _headIcon.backgroundColor =[UIColor clearColor];
        _headIcon.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(modJournalismStyle1AudioJumpPersonalCenterTap:)];
        [_headIcon addGestureRecognizer:singleTap];
        _headIcon.contentMode = UIViewContentModeScaleAspectFill;
        _headIcon.clipsToBounds = YES;
        _headIcon.layer.cornerRadius=21;
        [_headIcon setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_headIcon setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    }
    return _headIcon;
}
-(TTTAttributedLabel*)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor =[UIColor hexChangeFloat:@"03266F"];
        _nameLabel.numberOfLines =1;
        _nameLabel.font = [UIFont loadFontStyleWithDefaultFontNum:20 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
    }
    return _nameLabel;
}
-(TTTAttributedLabel*)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _dateLabel.backgroundColor = [UIColor clearColor];
        _dateLabel.textColor =[UIColor hexChangeFloat:@"5D5D5D"];
        _dateLabel.numberOfLines =1;
        _dateLabel.textAlignment=NSTextAlignmentRight;
        _dateLabel.lineSpacing = 3;
        _dateLabel.font = [UIFont loadFontStyleWithDefaultFontNum:14 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        [_dateLabel setPreferredMaxLayoutWidth:(KHGUISCRENNWIDTH-10*3-KHGUISCRENNWIDTH*0.28)];
    }
    return _dateLabel;
}
-(UIButton*)isLive{
    if (!_isLive) {
        _isLive=[UIButton buttonWithType:UIButtonTypeCustom];
        _isLive.clipsToBounds=YES;
        _isLive.layer.cornerRadius=6;
        _isLive.backgroundColor=[UIColor hexChangeFloat:@"D53C33"];
        _isLive.titleLabel.font=[UIFont loadFontStyleWithDefaultFontNum:9 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        [_isLive setTitleColor:[UIColor hexChangeFloat:@"FFFFFF"] forState:UIControlStateNormal];
        [_isLive addTarget:self action:@selector(isLiveClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _isLive;
}
-(TTTAttributedLabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor =[UIColor hexChangeFloat:@"000000"];
        _titleLabel.numberOfLines =0;
        _titleLabel.lineSpacing = 3;
        _titleLabel.font = [UIFont loadFontStyleWithDefaultFontNum:20 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        [_titleLabel setPreferredMaxLayoutWidth:(KHGUISCRENNWIDTH-10*3-KHGUISCRENNWIDTH*0.28)];
    }
    return _titleLabel;
}
-(MxuAsyncImageView*)audioPicture{
    if (!_audioPicture) {
        _audioPicture=[[MxuAsyncImageView alloc]init];
        _audioPicture.contentMode= UIViewContentModeScaleToFill;
        _audioPicture.backgroundColor=[UIColor hexChangeFloat:@"D53C33"];
    }
    return _audioPicture;
}
-(UIButton*)praise{
    if (!_praise) {
        _praise=[UIButton buttonWithType:UIButtonTypeCustom];
        _praise.backgroundColor=[UIColor clearColor];
        [_praise setTitle:@"56" forState:UIControlStateNormal];
        [_praise setImage:[UIImage imageNamed:@"modJournalismStyle1_zan.png"] forState:UIControlStateNormal];
        _praise.titleLabel.font=[UIFont loadFontStyleWithDefaultFontNum:15 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        [_praise setTitleColor:[UIColor hexChangeFloat:@"737171"] forState:UIControlStateNormal];
        [_praise addTarget:self action:@selector(modJournalismStyle1AudioCellPraiseClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _praise;
}
-(UIView*)bottomGraysLine{
    if (!_bottomGraysLine) {
        _bottomGraysLine=[[UIView alloc]init];
        _bottomGraysLine.backgroundColor=[UIColor hexChangeFloat:@"959595"];
    }
    return _bottomGraysLine;
}

@end

@implementation ModJournalismStyle1AttentionCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        self.userInteractionEnabled=YES;
        [self addModJournalismStyle1AttentionCellSubViews];
        [self configModJournalismStyle1AttentionCellSubViewsLayout];
    }
    return self;
}
/**
 添加ModJournalismStyle1AttentionCell子视图
 */
-(void)addModJournalismStyle1AttentionCellSubViews{
    [self.contentView addSubview:self.headIcon];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.attentionBtn];
    [self.contentView addSubview:self.bottomGrayLine];
}
/**
 配置ModJournalismStyle1AttentionCellLayout
 */
- (void)configModJournalismStyle1AttentionCellSubViewsLayout{
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(16);
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.width.equalTo(@42);
        make.height.equalTo(@42);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIcon.mas_right).with.offset(19);
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.width.equalTo(@200);
        make.height.equalTo(@20);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIcon.mas_right).with.offset(19);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(5);
        make.right.equalTo(self.contentView.mas_right).with.offset(-27);
        make.height.equalTo(@25);
    }];
    [self.attentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-22);
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.width.equalTo(@30);
        make.height.equalTo(@35);
    }];
    [self.bottomGrayLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(19);
        make.right.equalTo(self.contentView.mas_right).offset(-19);
        make.top.equalTo(self.headIcon.mas_bottom).with.offset(15);
        make.height.equalTo(@0.5);
    }];
    self.hyb_lastViewInCell = self.bottomGrayLine;
    self.hyb_bottomOffsetToCell =0.5;
}
-(void)loadJournalismStyle1AttentionWithModel:(ModJournalismStyle1Model*)model indexPath:(NSIndexPath *)indexPath{
    self.headIcon.normalLocalImageName=[NSString stringWithFormat:@"%@",@"user_default_icon.png"];
    self.nameLabel.text=[NSString stringWithFormat:@"%@",@"史蕊"];
    self.titleLabel.text=[NSString stringWithFormat:@"%@",@"文体频道 主持"];
    if ([model.is_con isEqualToNumber:@0]) {
        [self.attentionBtn setTitle:[CustomLocalizedString  loadCustomLocalizedStringWithKey:  LOCALIZED_JOURNALISM_ADD_ATTENTION identification:JOURNALISM_LOCALIZABLE_NAME] forState:UIControlStateNormal];
        [self.attentionBtn setImage:[UIImage imageNamed:@"modJournalismStyle1_addAttention.png"] forState:UIControlStateNormal];
        self.attentionBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.attentionBtn setTitleEdgeInsets:UIEdgeInsetsMake(self.attentionBtn.imageView.frame.size.height+self.attentionBtn.imageView.frame.origin.y,-self.attentionBtn.imageView.frame.size.width, 0.0,0.0)];
        [self.attentionBtn setImageEdgeInsets:UIEdgeInsetsMake(-5,0.0,0.0, -self.attentionBtn.titleLabel.bounds.size.width)];
        [_attentionBtn setTitleColor:[UIColor colorWithRed:0.588 green:0.588 blue:0.588 alpha:1.00] forState:UIControlStateNormal];
    }else if ([model.is_con isEqualToNumber:@1]){
        [self.attentionBtn setImage:[UIImage imageNamed:@"modJournalismStyle1_alreadyAttention.png"] forState:UIControlStateNormal];
    }
}
/**
  跳转个人中心
 */
- (void)modJournalismStyle1AttentionCelljumpPersonalCenterTap:(UIGestureRecognizer *)gestureRecognizer{
    if ([_delegate respondsToSelector:@selector(selectModJournalismStyle1AttentionCell:modJournalismStyle1AttentionJumpPersonalCenterAction:)]){
        [_delegate selectModJournalismStyle1AttentionCell:self modJournalismStyle1AttentionJumpPersonalCenterAction:gestureRecognizer];
    }
}
/**
 跳转关注
 */
-(void)attentionBtnClicked:(UIButton*)sender{
    if ([_delegate respondsToSelector:@selector(selectModJournalismStyle1AttentionCell:attentionAction:)]){
        [_delegate selectModJournalismStyle1AttentionCell:self attentionAction:sender];
    }
}
/**
 ModJournalismStyle1AttentionCell子控件懒加载
 */
-(MxuAsyncImageView*)headIcon{
    if (!_headIcon) {
        _headIcon = [[MxuAsyncImageView alloc]init];
        _headIcon.backgroundColor =[UIColor clearColor];
        _headIcon.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(modJournalismStyle1AttentionCelljumpPersonalCenterTap:)];
        [_headIcon addGestureRecognizer:singleTap];
        _headIcon.contentMode = UIViewContentModeScaleAspectFill;
        _headIcon.clipsToBounds = YES;
        _headIcon.layer.cornerRadius=21;
        [_headIcon setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_headIcon setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    }
    return _headIcon;
}
-(TTTAttributedLabel*)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor =[UIColor colorWithRed:0.051 green:0.169 blue:0.412 alpha:1.00];
        _nameLabel.numberOfLines =1;
        _nameLabel.font = [UIFont loadFontStyleWithDefaultFontNum:16 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
    }
    return _nameLabel;
}
-(TTTAttributedLabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor =[UIColor colorWithRed:0.227 green:0.227 blue:0.227 alpha:1.00];
        _titleLabel.numberOfLines =0;
        _titleLabel.lineSpacing = 3;
        _titleLabel.font = [UIFont loadFontStyleWithDefaultFontNum:11 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        [_titleLabel setPreferredMaxLayoutWidth:(KHGUISCRENNWIDTH-10*3-KHGUISCRENNWIDTH*0.28)];
    }
    return _titleLabel;
}
-(UIButton*)attentionBtn{
    if (!_attentionBtn) {
        _attentionBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _attentionBtn.backgroundColor=[UIColor clearColor];
        _attentionBtn.clipsToBounds=YES;
        _attentionBtn.layer.cornerRadius=5;
        _attentionBtn.titleLabel.font=[UIFont loadFontStyleWithDefaultFontNum:7 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        [_attentionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_attentionBtn addTarget:self action:@selector(attentionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _attentionBtn;
}
-(UIView*)bottomGrayLine{
    if (!_bottomGrayLine) {
        _bottomGrayLine=[[UIView alloc]init];
        _bottomGrayLine.backgroundColor=[UIColor hexChangeFloat:@"959595"];
    }
    return _bottomGrayLine;
}
@end

@implementation ModJournalismStyle1LivePlayCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumInteritemSpacing = 5;
    flow.minimumLineSpacing = 5;
    self.livePlayCollectionView= [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,82) collectionViewLayout:flow];
    _livePlayCollectionView.dataSource = self;
    _livePlayCollectionView.delegate = self;
    _livePlayCollectionView.backgroundColor=[UIColor whiteColor];
    _livePlayCollectionView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_livePlayCollectionView];
    [_livePlayCollectionView registerClass:[ModJournalismStyle1LivePlayHeadCell class] forCellWithReuseIdentifier:@"modJournalismStyle1LivePlayHeadCollectionCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [_livePlayDataArray count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ModJournalismStyle1LivePlayHeadCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"modJournalismStyle1LivePlayHeadCollectionCell" forIndexPath:indexPath];
    cell.journalismStyle1Model = [_livePlayDataArray objectAtIndex:indexPath.row];
    cell.livePlayImageView.normalLocalImageName=[NSString stringWithFormat:@"%@",@"user_default_icon.png"];;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    
}
#pragma mark--UICollectionViewDelegateFlowLayout的协议方法
//设置每个item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80 ,82);
}
//设置collectionView距上、左、下、右边侧的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 0);
}
-(void)setLivePlayDataArray:(NSArray *)livePlayDataArray{
    if (_livePlayDataArray != livePlayDataArray) {
        _livePlayDataArray = livePlayDataArray;
        [self.livePlayCollectionView reloadData];
    }
}
@end



@implementation ModJournalismStyle1LivePlayHeadCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.livePlayImageView = [[UIImageView alloc] init];
        self.livePlayImageView.clipsToBounds = YES;
        self.livePlayImageView.layer.cornerRadius =26;
        [self.contentView addSubview:_livePlayImageView];
        
        self.livePlayNameLabel = [[UILabel alloc] init];
        self.livePlayNameLabel.textColor =[UIColor hexChangeFloat:@"5A5A5A"];
        self.livePlayNameLabel.textAlignment = NSTextAlignmentCenter;
        self.livePlayNameLabel.font=[UIFont loadFontStyleWithDefaultFontNum:11 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        [self.contentView addSubview:_livePlayNameLabel];
        [self initFrame];
    }
    return self;
}
- (void)initFrame
{
    [self.livePlayImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@7);
        make.width.equalTo(@52);
        make.height.equalTo(@52);
    }];
    [self.livePlayNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_livePlayImageView.mas_bottom).with.offset(6);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.height.equalTo(@12);
    }];
    // 宽70 高 120
}
-(void)setJournalismStyle1Model:(ModJournalismStyle1Model *)journalismStyle1Model{
    self.livePlayImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",journalismStyle1Model.avatar]];
    self.livePlayNameLabel.text = [NSString stringWithFormat:@"%@",journalismStyle1Model.userName];
}
@end





