//
//  ModJournalismStyle1PersonalViewController.m
//  CompBaiduMap
//
//  Created by admin on 2018/5/2.
//

#import "ModJournalismStyle1PersonalViewController.h"
#import "ModJournalismStyle1Model.h"
#import "ModJournalismStyle1Cell.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"

@interface ModJournalismStyle1PersonalViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,HGTableViewDelegate>

@property(nonatomic,strong)UIView *journalismStyle1TableHeadView;//头部视图
@property (strong, nonatomic)MxuAsyncImageView *journalismStyle1HeadImageView;//头部背景视图
@property(nonatomic,strong)UIButton *journalismStyle1BackIcon;//返回箭头
@property(nonatomic,strong)UIButton *journalismStyle1SearchIcon;//搜索箭头
@property (strong, nonatomic)MxuAsyncImageView *journalismStyle1HeaderImageView;//头像
@property (strong, nonatomic)UILabel *journalismStyle1PersonNameLabel;//姓名
@property (strong, nonatomic)UILabel *journalismStyle1TitleLabel;//标题
@property(nonatomic,strong)UIView *journalismStyle1MenuView;//滑动按钮
@property (nonatomic, strong)HGTableView *journalismStyleFansTableView;//粉丝
@property (strong,nonatomic) NSMutableArray  *journalismStyle1FansList;//粉丝数据源
@end

@implementation ModJournalismStyle1PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self initUI];
    [self reloadModJournalismStyle1PersonalFansData];
}
//粉丝列表
-(void)reloadModJournalismStyle1PersonalFansData{
    [self.journalismStyle1FansList removeAllObjects];
    [self.journalismStyleFansTableView endRefreshing];
    ModJournalismStyle1Model *model1=[[ModJournalismStyle1Model alloc]init];
    model1.rType=@1;
    model1.avatar=@"modJournalismStyle1_default_icon";
    model1.userName=@"羊习习";
    model1.isLive=@0;
    model1.title=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了";
    model1.audioPicture=@"modJournalismStyle1_default_audio";
    model1.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解";
    model1.date=@"2小时前";
    model1.is_Zan=@0;
    model1.zanCount=@56;
    
    ModJournalismStyle1Model *model2=[[ModJournalismStyle1Model alloc]init];
    model2.rType=@0;
    model2.avatar=@"modJournalismStyle1_default_icon";
    model2.userName=@"艺凡「文化中原」记者";
    model2.isLive=@1;
    model2.title=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了";
    model2.audioPicture=@"modJournalismStyle1_default_audio";
    model2.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解";
    model2.date=@"5小时前";
    model2.is_Zan=@1;
    model2.zanCount=@224;
    
    ModJournalismStyle1Model *model3=[[ModJournalismStyle1Model alloc]init];
    model3.rType=@1;
    model3.avatar=@"modJournalismStyle1_default_icon";
    model3.userName=@"娄宇「红绿灯」记者";
    model3.isLive=@1;
    model3.title=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了";
    model3.audioPicture=@"modJournalismStyle1_default_audio";
    model3.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多";
    model3.date=@"5小时前";
    model3.is_Zan=@0;
    model3.zanCount=@105;
    
    ModJournalismStyle1Model *model4=[[ModJournalismStyle1Model alloc]init];
    model4.rType=@0;
    model4.avatar=@"modJournalismStyle1_default_icon";
    model4.userName=@"玉林「不美不行」编辑";
    model4.isLive=@1;
    model4.title=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了";
    model4.audioPicture=@"modJournalismStyle1_default_audio";
    model4.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解";
    model4.date=@"2小时前";
    model4.is_Zan=@0;
    model4.zanCount=@68;
    [self.journalismStyle1FansList addObject:model1];
    [self.journalismStyle1FansList addObject:model2];
    [self.journalismStyle1FansList addObject:model3];
    [self.journalismStyle1FansList addObject:model4];
}

//添加视图
-(void)initUI{
    self.journalismStyle1TableHeadView=[[UIView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,220)];
    self.journalismStyle1TableHeadView.backgroundColor=[UIColor greenColor];
    
    self.journalismStyle1HeadImageView=[[MxuAsyncImageView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,180)];
    self.journalismStyle1HeadImageView.userInteractionEnabled=YES;
    self.journalismStyle1HeadImageView.backgroundColor=[UIColor hexChangeFloat:@"#6E6E6E"];
    [self.journalismStyle1TableHeadView addSubview:self.journalismStyle1HeadImageView];
   
    self.journalismStyle1BackIcon=[UIButton buttonWithType:UIButtonTypeCustom];
    self.journalismStyle1BackIcon.tag=0;
    [self.journalismStyle1BackIcon addTarget:self action:@selector(journalismStyle1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.journalismStyle1BackIcon.frame=CGRectMake(10,30,12,14);
    self.journalismStyle1BackIcon.contentMode=UIViewContentModeScaleToFill;
    [self.journalismStyle1BackIcon setImage:[UIImage imageNamed:@"modJournalismStyle1_back"] forState:UIControlStateNormal];
    [self.journalismStyle1HeadImageView addSubview:self.journalismStyle1BackIcon];
    
    self.journalismStyle1SearchIcon=[UIButton buttonWithType:UIButtonTypeCustom];
    self.journalismStyle1SearchIcon.tag=1;
    [self.journalismStyle1SearchIcon addTarget:self action:@selector(journalismStyle1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.journalismStyle1SearchIcon.frame=CGRectMake(SCREEN_WIDTH-50,30,18,20);
    self.journalismStyle1SearchIcon.contentMode=UIViewContentModeScaleToFill;
    [self.journalismStyle1SearchIcon setImage:[UIImage imageNamed:@"modJournalismStyle1_search"] forState:UIControlStateNormal];
    [self.journalismStyle1HeadImageView addSubview:self.journalismStyle1SearchIcon];
    
    self.journalismStyle1HeaderImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10,20,68,68)];
    self.journalismStyle1HeaderImageView.backgroundColor=[UIColor clearColor];
    self.journalismStyle1HeaderImageView.center=CGPointMake(self.journalismStyle1HeadImageView.frame.size.width/2,self.journalismStyle1HeadImageView.frame.origin.y+80);
    self.journalismStyle1HeaderImageView.normalLocalImageName=[NSString stringWithFormat:@"%@",@"user_default_icon"];
    self.journalismStyle1HeaderImageView.layer.masksToBounds=YES;
    self.journalismStyle1HeaderImageView.layer.cornerRadius=self.journalismStyle1HeaderImageView.frame.size.height/2;
    self.journalismStyle1HeaderImageView.layer.borderWidth=0.5;
    self.journalismStyle1HeaderImageView.layer.borderColor=[UIColor whiteColor].CGColor;
    self.journalismStyle1HeaderImageView.contentMode= UIViewContentModeScaleToFill;
    [self.journalismStyle1HeadImageView addSubview:self.journalismStyle1HeaderImageView];
    
    self.journalismStyle1PersonNameLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-151)/2,CGRectGetMaxY(self.journalismStyle1HeaderImageView.frame)+18,SCREEN_WIDTH,19)];
    self.journalismStyle1PersonNameLabel.center=CGPointMake(self.journalismStyle1HeadImageView.frame.size.width/2,CGRectGetMaxY(self.journalismStyle1HeaderImageView.frame)+18);
    self.journalismStyle1PersonNameLabel.text=@"羊习习";
    self.journalismStyle1PersonNameLabel.backgroundColor = [UIColor clearColor];
    self.journalismStyle1PersonNameLabel.textColor =[UIColor whiteColor];
    self.journalismStyle1PersonNameLabel.numberOfLines =1;
    self.journalismStyle1PersonNameLabel.textAlignment=NSTextAlignmentCenter;
    self.journalismStyle1PersonNameLabel.font = [UIFont loadFontStyleWithDefaultFontNum:20 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
    [self.journalismStyle1HeadImageView addSubview:self.journalismStyle1PersonNameLabel];
    
    self.journalismStyle1TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-151)/2,CGRectGetMaxY(self.journalismStyle1PersonNameLabel.frame)+18,SCREEN_WIDTH,19)];
    self.journalismStyle1TitleLabel.center=CGPointMake(self.journalismStyle1HeadImageView.frame.size.width/2,CGRectGetMaxY(self.journalismStyle1PersonNameLabel.frame)+18);
    self.journalismStyle1TitleLabel.text=@"网络动画工作室 编辑";
    self.journalismStyle1TitleLabel.backgroundColor = [UIColor clearColor];
    self.journalismStyle1TitleLabel.textColor =[UIColor whiteColor];
    self.journalismStyle1TitleLabel.numberOfLines =1;
    self.journalismStyle1TitleLabel.textAlignment=NSTextAlignmentCenter;
    self.journalismStyle1TitleLabel.font = [UIFont loadFontStyleWithDefaultFontNum:13 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
    [self.journalismStyle1HeadImageView addSubview:self.journalismStyle1TitleLabel];
    
    self.journalismStyle1MenuView=[[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.journalismStyle1HeadImageView.frame),SCREEN_WIDTH,40)];
    self.journalismStyle1MenuView.userInteractionEnabled=YES;
    self.journalismStyle1MenuView.backgroundColor=[UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1.00];
    [self.journalismStyle1TableHeadView addSubview:self.journalismStyle1MenuView];
    
    NSArray *items =@[@"粉丝 1220",@"关注"];
    NSArray *imageItems =@[@"modJournalismStyle1_addHeart",@"modJournalismStyle1_adds"];
     CGFloat menuWidth =(SCREEN_WIDTH-2*50)/items.count;
    for (int i = 0; i<items.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50+i*(menuWidth+5),5,menuWidth,self.journalismStyle1MenuView.frame.size.height-10)];
        btn.titleLabel.textAlignment=NSTextAlignmentCenter;
        [btn setImage:[UIImage imageNamed:imageItems[i]] forState:UIControlStateNormal];
        btn.clipsToBounds=YES;
        btn.layer.cornerRadius=13;
        btn.layer.borderColor=[UIColor hexChangeFloat:@"D53C33"].CGColor;
        btn.layer.borderWidth=0.5;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -10, 0.0, 0.0)];
        btn.tag = 1000+i;
        if (i==0) {
            [btn setTitleColor:[UIColor hexChangeFloat:@"D53C33"] forState:UIControlStateNormal];
            btn.backgroundColor=[UIColor hexChangeFloat:@"FFFFFF"];
        }else if (i==1){
            [btn setTitleColor:[UIColor hexChangeFloat:@"FFFFFF"] forState:UIControlStateNormal];
            btn.backgroundColor=[UIColor hexChangeFloat:@"DA3F35"];
        }
        [btn setTitle:items[i] forState:UIControlStateNormal];
        btn.clipsToBounds=YES;
        btn.titleLabel.font =[UIFont loadFontStyleWithDefaultFontNum:13 fontFamilyName:nil moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];;
        [btn addTarget:self action:@selector(menuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.journalismStyle1MenuView addSubview:btn];
    }
    self.journalismStyleFansTableView=[[HGTableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped attributes:nil];
    self.journalismStyleFansTableView.backgroundColor=[UIColor whiteColor];
    self.journalismStyleFansTableView.contentInset = UIEdgeInsetsZero;
    self.journalismStyleFansTableView.showsVerticalScrollIndicator=NO;
    self.journalismStyleFansTableView.tag=100;
    self.journalismStyleFansTableView.refreshDelegate = self;
    self.journalismStyleFansTableView.showTopRefresh = YES;
    self.journalismStyleFansTableView.showBottomRefresh =NO;
    self.journalismStyleFansTableView.delegate = self;
    self.journalismStyleFansTableView.dataSource  =self;
    self.journalismStyleFansTableView.tableHeaderView=self.journalismStyle1TableHeadView;
    [self.view addSubview:self.journalismStyleFansTableView];
}
#pragma mark - 按钮点击
-(void)menuBtnClick:(UIButton *)sender{
    if (sender.tag==1000) {
        
    }else if (sender.tag==1001){
       
    }
}
#pragma mark - tableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.journalismStyle1FansList.count>0) {
        ModJournalismStyle1Model*journalismStyle1Model =self.journalismStyle1FansList[indexPath.row];
        if ([journalismStyle1Model.rType isEqualToNumber:@0]) {
            CGFloat h = [ModJournalismStyle1Cell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                ModJournalismStyle1Cell *cell = (ModJournalismStyle1Cell *)sourceCell;
                [cell loadJournalismStyle1TextWithModel:journalismStyle1Model];
            } cache:nil];
            return h;
            
        }else if ([journalismStyle1Model.rType isEqualToNumber:@1]){
            CGFloat h = [ModJournalismStyle1AudioCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                ModJournalismStyle1AudioCell *cell = (ModJournalismStyle1AudioCell *)sourceCell;
                [cell loadJournalismStyle1AudioWithModel:journalismStyle1Model];
            } cache:nil];
            return h;
        }
    }
     return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return self.journalismStyle1FansList.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *audioKeyStr = @"audioKey";//音频cell
    static NSString *textKeyStr = @"textKey";//纯文本cell
    //音频cell
    ModJournalismStyle1AudioCell *journalismStyle1AudioCell = [tableView dequeueReusableCellWithIdentifier:audioKeyStr];
    //文本cell
    ModJournalismStyle1Cell *journalismStyle1TextCell = [tableView dequeueReusableCellWithIdentifier:textKeyStr];
    if (!journalismStyle1AudioCell) {
        journalismStyle1AudioCell = [[ModJournalismStyle1AudioCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:audioKeyStr];
        journalismStyle1AudioCell.selectionStyle=UITableViewCellSelectionStyleNone;
        journalismStyle1AudioCell.delegate=self;
    }
    if (!journalismStyle1TextCell) {
        journalismStyle1TextCell = [[ModJournalismStyle1Cell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:textKeyStr];
        journalismStyle1TextCell.selectionStyle=UITableViewCellSelectionStyleNone;
        journalismStyle1TextCell.delegate=self;
    }
    if (self.journalismStyle1FansList.count>0) {
        ModJournalismStyle1Model* journalismStyle1Model = self.journalismStyle1FansList[indexPath.row];
        if ([journalismStyle1Model.rType isEqualToNumber:@0]) {
            [journalismStyle1TextCell loadJournalismStyle1TextWithModel:journalismStyle1Model];
            return journalismStyle1TextCell;
        }else if ([journalismStyle1Model.rType isEqualToNumber:@1]){
            [journalismStyle1AudioCell loadJournalismStyle1AudioWithModel:journalismStyle1Model];
            return journalismStyle1AudioCell;
        }
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==100) {
        ModJournalismStyle1Model *journalismStyle1Model =self.journalismStyle1FansList[indexPath.row];
        if ([journalismStyle1Model.rType isEqualToNumber:@0]) {
            
        }else if ([journalismStyle1Model.rType isEqualToNumber:@1]){
            
        }
    }
}
#pragma mark - HGTableViewDelegate
/*
 * @method 刷新操作
 */
- (void)hgTableViewExecuteRefreshMethods:(HGTableView *)view{
     [self reloadModJournalismStyle1PersonalFansData];
}
- (void)hgTableViewExecuteLoadMoreMethods:(HGTableView *)view{
   
}
#pragma mark--按钮点击事件
-(void)journalismStyle1Clicked:(UIButton*)sender{
    if (sender.tag==0) {
        [self didTopLeftButtonTouched:nil];
    }else if (sender.tag==1){
        NSString * defaultOutlink = [[HGCommonConfigure sharedInstance]configureClassWithModelFlag:moduleSign  prefixName:@"ModJournalismStyle1Search" withParamSources:nil];
        [Navigator navigateToControllerWithCustomOutlink:defaultOutlink withOutlink:nil withNextStyle:nil withDataArray:nil shouldJump:YES];
    }
}
/**
 懒加载
 */
-(NSMutableArray*)journalismStyle1FansList{
    if (!_journalismStyle1FansList) {
        _journalismStyle1FansList=[NSMutableArray arrayWithCapacity:0];
    }
    return _journalismStyle1FansList;
}
@end
