//
//  ModJournalismStyle1ViewController.m
//  CompBaiduMap
//
//  Created by admin on 2018/4/16.
//

#import "ModJournalismStyle1ViewController.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "ModJournalismStyle1Model.h"
#import "ModJournalismStyle1Cell.h"
#import "ModJournalismStyle1Model.h"
#import "ModJournalismStyleLocalized.h"
#import "ModJournalismStyle1Switch.h"
#import "ModJournalismStyleLocalized.h"
#import "ModJournalismStyle1SearchHotViewController.h"
#import "ModJournalismStyle1SearchConcernedViewController.h"
@interface ModJournalismStyle1ViewController ()<SelectModJournalismStyle1AudioCellDelegate,SelectModJournalismStyle1CellDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,HGTableViewDelegate>
/**
 顶部视图
 */
@property (nonatomic, strong)UIView* viewTop;
/**
 当前列表tableview
 */
@property (nonatomic, strong)UITableView *modJournalismStyle1tableview;
/**
顶部栏目栏
*/
@property (nonatomic, strong)ModJournalismStyle1Switch*modJournalismStyle1Switch;
/**
 背景滚动视图
 */
@property (nonatomic, strong)UIScrollView*modJournalismStyle1ScrollView;
/**
 热门
 */
@property (nonatomic, strong)HGTableView *modJournalismStyle1HotTableView;
/**
 关注
 */
@property (nonatomic, strong)HGTableView *modJournalismStyle1AttentionTableView;
/**
 热门数据源
 */
@property (strong,nonatomic) NSMutableArray  *modJournalismStyle1HotList;
/**
 关注数据源
 */
@property (strong,nonatomic) NSMutableArray  *modJournalismStyle1AttentionList;

@end

@implementation ModJournalismStyle1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self configureTopView];
    [self configureNavigateView];
    [self setupModJournalismStyle1ScrollView];
    [self setupModJournalismStyle1TableView];
    [self configModJournalismStyle1Layout];
    [self requestmodJournalismStyle1HotData];
}
#pragma mark - 配置Layout
- (void)configModJournalismStyle1Layout{
    [self.modJournalismStyle1Switch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.modJournalismStyle1Switch.superview.mas_left).with.offset(124);
        make.right.equalTo(self.modJournalismStyle1Switch.superview.mas_right).with.offset(-123);
        make.top.equalTo(self.modJournalismStyle1Switch.superview.mas_top).with.offset(25);
        make.height.equalTo(@30);
    }];
}
/**
 创建setupModJournalismStyle1TableView
 */
-(void)setupModJournalismStyle1TableView{
    self.modJournalismStyle1HotTableView = [[HGTableView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, CGRectGetHeight(self.modJournalismStyle1ScrollView.bounds)) style:(UITableViewStylePlain)];
    [self.modJournalismStyle1ScrollView addSubview:self.modJournalismStyle1HotTableView];
    self.modJournalismStyle1HotTableView.delegate = self;
    self.modJournalismStyle1HotTableView.dataSource = self;
    self.modJournalismStyle1HotTableView.tag = 0;
    [self.modJournalismStyle1HotTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.modJournalismStyle1AttentionTableView = [[HGTableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0,SCREEN_WIDTH, CGRectGetHeight(self.modJournalismStyle1ScrollView.bounds)) style:(UITableViewStylePlain)];
     [self.modJournalismStyle1AttentionTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.modJournalismStyle1ScrollView addSubview:self.modJournalismStyle1AttentionTableView];
    self.modJournalismStyle1AttentionTableView.delegate = self;
    self.modJournalismStyle1AttentionTableView.dataSource = self;
    self.modJournalismStyle1AttentionTableView.tag = 1;
}
/**
背景视图
*/
-(void)setupModJournalismStyle1ScrollView{
    self.modJournalismStyle1ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,64,SCREEN_WIDTH,SCREEN_HEIGHT-64-49)];
    self.modJournalismStyle1ScrollView.delegate = self;
    self.modJournalismStyle1ScrollView.contentSize = CGSizeMake(SCREEN_WIDTH* 2,0);
    self.modJournalismStyle1ScrollView.contentOffset = CGPointMake(0, 0);
    self.modJournalismStyle1ScrollView.bounces = NO;
    self.modJournalismStyle1ScrollView.scrollEnabled = YES;
    self.modJournalismStyle1ScrollView.showsHorizontalScrollIndicator = NO;
    self.modJournalismStyle1ScrollView.pagingEnabled = YES;
    self.modJournalismStyle1ScrollView.alwaysBounceVertical = NO;
    self.modJournalismStyle1ScrollView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.modJournalismStyle1ScrollView];
}
/**
 配置顶部视图
 */
-(void)configureNavigateView{
    UIView * topView = [self.view viewWithTag:kTagViewHeader];
    self.viewTop=topView;
    topView.backgroundColor=[UIColor hexChangeFloat:@"D53C33"];
    MxuAsyncButton *leftBtn = [topView viewWithTag:kTagTopButtonLeft];
    leftBtn.hidden = NO;
    [leftBtn removeTarget:self action:@selector(didTopRightButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.normalImageLocalNameNormal = @"modJournalismStyle1_addPeople.png";
    leftBtn.normalImageLocalNameHighlighted= kResetUIButtonkey;
    leftBtn.normalImageLocalNameSelected =kResetUIButtonkey;
    [leftBtn addTarget:self action:@selector(gotoAttentionClick:) forControlEvents:UIControlEventTouchUpInside];
    BOOL isTabBar = NO;
    if ([[HGThemeInstance sharedInstance].template_Name isEqualToString:AP_DEF_NAME1] && self.isRootViewController){
        isTabBar = YES;
    }
    CGFloat tabbarHeight = 0;
    if (isTabBar) {
        tabbarHeight = [HGLoadConfiguration loadAppTabarBarHeight];
    }
     self.headerTitle = @"";
    self.modJournalismStyle1Switch = [[ModJournalismStyle1Switch alloc] initWithStringsArray:@[[CustomLocalizedString  loadCustomLocalizedStringWithKey:LOCALIZED_JOURNALISM_HOT identification:JOURNALISM_LOCALIZABLE_NAME],[CustomLocalizedString  loadCustomLocalizedStringWithKey:LOCALIZED_JOURNALISM_FOLLOW identification:JOURNALISM_LOCALIZABLE_NAME]]];
    self.modJournalismStyle1Switch.frame =CGRectZero;
    self.modJournalismStyle1Switch.center=CGPointMake(topView.frame.size.width/2,topView.frame.size.height/2+5);
    self.modJournalismStyle1Switch.backgroundColor =[UIColor hexChangeFloat:@"E66961"];
    self.modJournalismStyle1Switch.sliderColor =[UIColor hexChangeFloat:@"FFFFFF"];
    self.modJournalismStyle1Switch.labelTextColorInsideSlider =[UIColor hexChangeFloat:@"DC4137"];
    self.modJournalismStyle1Switch.labelTextColorOutsideSlider =[UIColor hexChangeFloat:@"FFFFFF"];
    self.modJournalismStyle1Switch.cornerRadius =13;
    [topView addSubview:self.modJournalismStyle1Switch];
    [self.modJournalismStyle1Switch setPressedHandler:^(NSUInteger index) {
        if (index == 0) {
            __weak typeof(self) weakSelf = self;
            [UIView animateWithDuration:0.3 animations:^{
                weakSelf.modJournalismStyle1ScrollView.contentOffset = CGPointMake(0, 0);
                [self requestmodJournalismStyle1HotData];
                [self.modJournalismStyle1HotTableView reloadData];
            } completion:^(BOOL finished) {
                
            }];
        } else {
            __weak typeof(self) weakSelf = self;
            [UIView animateWithDuration:0.3 animations:^{
                weakSelf.modJournalismStyle1ScrollView.contentOffset = CGPointMake(SCREEN_WIDTH,0);
                [self requestmodJournalismStyle1AttentionData];
                [self.modJournalismStyle1AttentionTableView reloadData];
            } completion:^(BOOL finished) {
                
            }];
        }
    }];
}
/**
 热门模拟数据源
 */
-(void)requestmodJournalismStyle1HotData{
    ModJournalismStyle1Model *model1=[[ModJournalismStyle1Model alloc]init];
    model1.rType=@1;
    model1.avatar=@"modJournalismStyle1_default_icon";
    model1.userName=@"史蕊「文体频道」主持";
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
    [self.modJournalismStyle1HotList addObject:model1];
    [self.modJournalismStyle1HotList addObject:model2];
    [self.modJournalismStyle1HotList addObject:model3];
    [self.modJournalismStyle1HotList addObject:model4];
}
/**
 热门模拟数据源
 */
-(void)requestmodJournalismStyle1AttentionData{
    ModJournalismStyle1Model *model1=[[ModJournalismStyle1Model alloc]init];
    model1.rType=@1;
    model1.avatar=@"modJournalismStyle1_default_icon";
    model1.userName=@"史蕊「文体频道」主持";
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
    model3.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了";
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
    model4.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了";
    model4.date=@"2小时前";
    model4.is_Zan=@0;
    model4.zanCount=@68;
    [self.modJournalismStyle1AttentionList addObject:model1];
    [self.modJournalismStyle1AttentionList addObject:model2];
    [self.modJournalismStyle1AttentionList addObject:model3];
    [self.modJournalismStyle1AttentionList addObject:model4];
}

/**
 UITableViewDelegate, UITableViewDataSource
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 0) {
        return [self.modJournalismStyle1HotList count];
    }else if (tableView.tag==1){
        return [self.modJournalismStyle1AttentionList count];
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==0) {
        if (self.modJournalismStyle1HotList.count>0) {
            ModJournalismStyle1Model*journalismStyle1Model =self.modJournalismStyle1HotList[indexPath.row];
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
    }else if (tableView.tag==1){
        if (self.modJournalismStyle1AttentionList.count>0) {
            ModJournalismStyle1Model*journalismStyle1Model =self.modJournalismStyle1AttentionList[indexPath.row];
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
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
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
    if (tableView.tag==0) {
        if (self.modJournalismStyle1HotList.count>0) {
          ModJournalismStyle1Model* journalismStyle1Model = self.modJournalismStyle1HotList[indexPath.row];
            if ([journalismStyle1Model.rType isEqualToNumber:@0]) {
                [journalismStyle1TextCell loadJournalismStyle1TextWithModel:journalismStyle1Model];
                return journalismStyle1TextCell;
            }else if ([journalismStyle1Model.rType isEqualToNumber:@1]){
                [journalismStyle1AudioCell loadJournalismStyle1AudioWithModel:journalismStyle1Model];
                return journalismStyle1AudioCell;
            }
        }
    }else if (tableView.tag==1){
        ModJournalismStyle1Model* journalismStyle1Model = self.modJournalismStyle1AttentionList[indexPath.row];
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
    if (tableView.tag==0) {
        ModJournalismStyle1Model *journalismStyle1Model =self.modJournalismStyle1HotList[indexPath.row];
        if ([journalismStyle1Model.rType isEqualToNumber:@0]) {
            
        }else if ([journalismStyle1Model.rType isEqualToNumber:@1]){
            
        }
    }else if (tableView.tag==1){
        ModJournalismStyle1Model *journalismStyle1Model =self.modJournalismStyle1AttentionList[indexPath.row];
        if ([journalismStyle1Model.rType isEqualToNumber:@0]) {
            
        }else if ([journalismStyle1Model.rType isEqualToNumber:@1]){
            
        }
    }
}
/**
 滚动代理  scroll减速完毕调用
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //页码
    int pageNo= scrollView.contentOffset.x/scrollView.frame.size.width;
    float pageNo_Y= scrollView.contentOffset.y/scrollView.frame.size.height;
    if (pageNo == 0) {
        [self.modJournalismStyle1Switch selectIndex:pageNo animated:NO];
        self.modJournalismStyle1ScrollView.contentOffset = CGPointMake(0, 0);
        [self requestmodJournalismStyle1HotData];
        [self.modJournalismStyle1HotTableView reloadData];
    } else {
        [self.modJournalismStyle1Switch selectIndex:pageNo animated:NO];
        self.modJournalismStyle1ScrollView.contentOffset = CGPointMake(SCREEN_WIDTH,0);
        [self requestmodJournalismStyle1AttentionData];
        [self.modJournalismStyle1AttentionTableView reloadData];
        
    }
}
/**
 SelectModJournalismStyle1CellDelegate
 */
-(void)selectModJournalismStyle1Cell:(ModJournalismStyle1Cell*)cell modJournalismStyle1jumpPersonalCenterAction:(id)sender{
    NSIndexPath *index = [self.modJournalismStyle1tableview indexPathForCell:cell];
    ModJournalismStyle1Model *journalismStyle1Model =self.modJournalismStyle1HotList[index.row];
    if ([journalismStyle1Model.rType isEqualToNumber:@0]) {
        NSString * defaultOutlink = [[HGCommonConfigure sharedInstance]configureClassWithModelFlag:moduleSign  prefixName:@"ModJournalismStyle1Personal" withParamSources:nil];
        [Navigator navigateToControllerWithCustomOutlink:defaultOutlink withOutlink:nil withNextStyle:nil withDataArray:nil shouldJump:YES];
    }else if ([journalismStyle1Model.rType isEqualToNumber:@1]){
        NSString * defaultOutlink = [[HGCommonConfigure sharedInstance]configureClassWithModelFlag:moduleSign  prefixName:@"ModJournalismStyle1Personal" withParamSources:nil];
        [Navigator navigateToControllerWithCustomOutlink:defaultOutlink withOutlink:nil withNextStyle:nil withDataArray:nil shouldJump:YES];
    }
}
/**
点击赞
@param cell ModJournalismStyle1Cell
@param sender 当前点按图片
*/
-(void)selectModJournalismStyle1Cell:(ModJournalismStyle1Cell*)cell modJournalismStyle1praiseAction:(id)sender{
   
}
#pragma mark -SelectModJournalismStyle1AudioCellDelegate
/**
音频Cell点击正在直播或者回看
 */
-(void)selectModJournalismStyle1AudioCell:(ModJournalismStyle1AudioCell*)cell liveAction:(UIButton*)sender{
    NSIndexPath *index = [self.modJournalismStyle1tableview indexPathForCell:cell];
    ModJournalismStyle1Model *journalismStyle1Model =self.modJournalismStyle1HotList[index.row];
    if ([journalismStyle1Model.rType isEqualToNumber:@0]) {
        if ([sender.titleLabel.text isEqualToString:[CustomLocalizedString  loadCustomLocalizedStringWithKey:LOCALIZED_JOURNALISM_BEING_BROADCAST_LIVE identification:JOURNALISM_LOCALIZABLE_NAME]]) {
        }else if ([sender.titleLabel.text isEqualToString:[CustomLocalizedString  loadCustomLocalizedStringWithKey:LOCALIZED_JOURNALISM_LOOK_BACK identification:JOURNALISM_LOCALIZABLE_NAME]]){
        }
    }else if ([journalismStyle1Model.rType isEqualToNumber:@1]){
        if ([sender.titleLabel.text isEqualToString:[CustomLocalizedString  loadCustomLocalizedStringWithKey:LOCALIZED_JOURNALISM_BEING_BROADCAST_LIVE identification:JOURNALISM_LOCALIZABLE_NAME]]) {
        }else if ([sender.titleLabel.text isEqualToString:[CustomLocalizedString  loadCustomLocalizedStringWithKey:LOCALIZED_JOURNALISM_LOOK_BACK identification:JOURNALISM_LOCALIZABLE_NAME]]){
        }
    }
}
/**
 点击赞
 @param cell ModJournalismStyle1Cell
 @param sender 当前点按图片
 */
-(void)selectModJournalismStyle1AudioCell:(ModJournalismStyle1AudioCell*)cell modJournalismStyle1AudioCellpraiseAction:(id)sender{
   
}
/**
 音频Cell点击头像跳转个人中心
 */
-(void)selectModJournalismStyle1AudioCell:(ModJournalismStyle1AudioCell*)cell modJournalismStyle1AudioCelljumpPersonalCenterAction:(id)sender{
     NSIndexPath *index = [self.modJournalismStyle1tableview indexPathForCell:cell];
    ModJournalismStyle1Model *journalismStyle1Model =self.modJournalismStyle1HotList[index.row];
    if ([journalismStyle1Model.rType isEqualToNumber:@0]) {
        NSString * defaultOutlink = [[HGCommonConfigure sharedInstance]configureClassWithModelFlag:moduleSign  prefixName:@"ModJournalismStyle1Personal" withParamSources:nil];
        [Navigator navigateToControllerWithCustomOutlink:defaultOutlink withOutlink:nil withNextStyle:nil withDataArray:nil shouldJump:YES];
    }else if ([journalismStyle1Model.rType isEqualToNumber:@1]){
        NSString * defaultOutlink = [[HGCommonConfigure sharedInstance]configureClassWithModelFlag:moduleSign  prefixName:@"ModJournalismStyle1Personal" withParamSources:nil];
        [Navigator navigateToControllerWithCustomOutlink:defaultOutlink withOutlink:nil withNextStyle:nil withDataArray:nil shouldJump:YES];
    }
}
/**
 点击关注
 */
- (void)gotoAttentionClick:(MxuAsyncButton *)sender {
    NSString * defaultOutlink = [[HGCommonConfigure sharedInstance]configureClassWithModelFlag:moduleSign  prefixName:@"ModJournalismStyle1Search" withParamSources:nil];
    [Navigator navigateToControllerWithCustomOutlink:defaultOutlink withOutlink:nil withNextStyle:nil withDataArray:nil shouldJump:YES];
}
/**
 懒加载
 */
-(NSMutableArray*)modJournalismStyle1HotList{
    if (!_modJournalismStyle1HotList) {
        _modJournalismStyle1HotList=[NSMutableArray arrayWithCapacity:0];
    }
    return _modJournalismStyle1HotList;
}
-(NSMutableArray*)modJournalismStyle1AttentionList{
    if (!_modJournalismStyle1AttentionList) {
        _modJournalismStyle1AttentionList=[NSMutableArray arrayWithCapacity:0];
    }
    return _modJournalismStyle1AttentionList;
}
@end
