//
//  ModJournalismStyle1SearchViewController.m
//  CompBaiduMap
//
//  Created by admin on 2018/4/28.
//

#import "ModJournalismStyle1SearchViewController.h"
#import "ModJournalismStyle1SearchView.h"
#import "ModJournalismStyle1Model.h"
#import "ModJournalismStyle1Cell.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "ModJournalismStyleLocalized.h"

@interface ModJournalismStyle1SearchViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,HGTableViewDelegate, SelectModJournalismStyle1LivePlayCellDelegate>
@property (nonatomic, strong)ModJournalismStyle1SearchView*searchView;
@property (nonatomic,strong) HGTableView *modJournalismStyle1SearchTableView;//tableView
@property (nonatomic,strong) NSMutableArray * modJournalismStyle1AlreadyAttentionListArry;//已关注数据源
@property (nonatomic,strong) NSMutableArray *modJournalismStyle1HotAttentionListArry;//热门关注数据源
@property (nonatomic,strong) NSMutableArray *modJournalismStyle1LivePlayListArry;//直播数据源
@property (nonatomic,strong) NSMutableArray *modJournalismStyle1searchListArry;//搜索数据源
@property (nonatomic, strong)UIView* viewTop;//顶部视图
@property (nonatomic, strong)UIView *modJournalismStyle1AleadyAttentionHeadView;//已关注
@property (nonatomic, strong)UIView *modJournalismStyle1HotAttentionHeadView;//热门关注
@property (nonatomic, assign)NSInteger selectTableView;
@property (nonatomic, strong)NSString * buttonColor;//按钮颜色
@end

@implementation ModJournalismStyle1SearchViewController
#pragma mark - 视图加载
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.searchView.textField resignFirstResponder];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectTableView=0;
    [self configureTopView];
    [self configureButtonColor];
    [self addTopView];
    [self addModJournalismStyle1SearchTableView];
    [self configLayout];
    [self loadModJournalismStyle1SearchList];
}
-(void)loadModJournalismStyle1SearchList{
    [self.modJournalismStyle1SearchTableView endRefreshing];
    [self.modJournalismStyle1AlreadyAttentionListArry removeAllObjects];
    [self.modJournalismStyle1LivePlayListArry removeAllObjects];
    
    ModJournalismStyle1Model *model1=[[ModJournalismStyle1Model alloc]init];
    model1.rType=@1;
    model1.avatar=@"modJournalismStyle1_default_icon";
    model1.userName=@"玉林";
    model1.isLive=@0;
    model1.title=@"电话顶顶顶顶付多";
    model1.audioPicture=@"modJournalismStyle1_default_audio";
    model1.detail=@"电话解决的话解";
    model1.date=@"2小时前";
    model1.is_Zan=@0;
    model1.zanCount=@56;
    model1.is_con=@1;
    
    ModJournalismStyle1Model *model2=[[ModJournalismStyle1Model alloc]init];
    model2.rType=@0;
    model2.avatar=@"modJournalismStyle1_default_icon";
    model2.userName=@"石蕊";
    model2.isLive=@1;
    model2.title=@"电话解决顶顶顶顶";
    model2.audioPicture=@"modJournalismStyle1_default_audio";
    model2.detail=@"电话解决的口袋里话解";
    model2.date=@"5小时前";
    model2.is_Zan=@1;
    model2.zanCount=@224;
    model2.is_con=@1;
    
    ModJournalismStyle1Model *model3=[[ModJournalismStyle1Model alloc]init];
    model3.rType=@1;
    model3.avatar=@"modJournalismStyle1_default_icon";
    model3.userName=@"娄宇";
    model3.isLive=@1;
    model3.title=@"电话解决的";
    model3.audioPicture=@"modJournalismStyle1_default_audio";
    model3.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多";
    model3.date=@"5小时前";
    model3.is_Zan=@0;
    model3.zanCount=@105;
    model3.is_con=@1;
    [self.modJournalismStyle1AlreadyAttentionListArry addObject:model1];
    [self.modJournalismStyle1AlreadyAttentionListArry addObject:model2];
    [self.modJournalismStyle1AlreadyAttentionListArry addObject:model3];
    
    
    ModJournalismStyle1Model *model4=[[ModJournalismStyle1Model alloc]init];
    model4.rType=@1;
    model4.avatar=@"modJournalismStyle1_default_icon";
    model4.userName=@"玉林";
    model4.isLive=@0;
    model4.title=@"电话顶顶顶顶付多";
    model4.audioPicture=@"modJournalismStyle1_default_audio";
    model4.detail=@"电话解决的话解";
    model4.date=@"2小时前";
    model4.is_Zan=@0;
    model4.zanCount=@56;
    model4.is_con=@0;
    
    ModJournalismStyle1Model *model5=[[ModJournalismStyle1Model alloc]init];
    model5.rType=@0;
    model5.avatar=@"modJournalismStyle1_default_icon";
    model5.userName=@"石蕊";
    model5.isLive=@1;
    model5.title=@"电话解决顶顶顶顶";
    model5.audioPicture=@"modJournalismStyle1_default_audio";
    model5.detail=@"电话解决的口袋里话解";
    model5.date=@"5小时前";
    model5.is_Zan=@1;
    model5.zanCount=@224;
    model5.is_con=@0;
    
    ModJournalismStyle1Model *model6=[[ModJournalismStyle1Model alloc]init];
    model6.rType=@1;
    model6.avatar=@"modJournalismStyle1_default_icon";
    model6.userName=@"娄宇";
    model6.isLive=@1;
    model6.title=@"电话解决的";
    model6.audioPicture=@"modJournalismStyle1_default_audio";
    model6.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多";
    model6.date=@"5小时前";
    model6.is_Zan=@0;
    model6.zanCount=@105;
    model6.is_con=@0;
    ModJournalismStyle1Model *model7=[[ModJournalismStyle1Model alloc]init];
    model7.rType=@1;
    model7.avatar=@"modJournalismStyle1_default_icon";
    model7.userName=@"娄宇";
    model7.isLive=@1;
    model7.title=@"电话解决的";
    model7.audioPicture=@"modJournalismStyle1_default_audio";
    model7.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多";
    model7.date=@"5小时前";
    model7.is_Zan=@0;
    model7.zanCount=@105;
    model7.is_con=@0;
    
    [self.modJournalismStyle1HotAttentionListArry addObject:model4];
    [self.modJournalismStyle1HotAttentionListArry addObject:model5];
    [self.modJournalismStyle1HotAttentionListArry addObject:model6];
    
    [self.modJournalismStyle1LivePlayListArry addObject:model1];
    [self.modJournalismStyle1LivePlayListArry addObject:model2];
    [self.modJournalismStyle1LivePlayListArry addObject:model3];
    [self.modJournalismStyle1LivePlayListArry addObject:model4];
    [self.modJournalismStyle1LivePlayListArry addObject:model5];
    [self.modJournalismStyle1LivePlayListArry addObject:model6];
    [self.modJournalismStyle1LivePlayListArry addObject:model7];
}
#pragma mark - 配置Layout
- (void)configLayout {
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.viewTop).offset(10);;
        make.centerX.equalTo(self.viewTop);
        make.width.mas_equalTo(@327);
        make.height.equalTo(@30);
    }];
    [self.modJournalismStyle1SearchTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.top.equalTo(self.viewTop.mas_bottom).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];
}
#pragma mark - 配置SearchTableView
-(void)addModJournalismStyle1SearchTableView{
    self.modJournalismStyle1SearchTableView = [[HGTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped attributes:nil];
    self.modJournalismStyle1SearchTableView.refreshDelegate = self;
    self.modJournalismStyle1SearchTableView.showTopRefresh = YES;
    self.modJournalismStyle1SearchTableView.showBottomRefresh =YES;
    self.modJournalismStyle1SearchTableView.showsVerticalScrollIndicator = NO;
    self.modJournalismStyle1SearchTableView.showsHorizontalScrollIndicator = NO;
    self.modJournalismStyle1SearchTableView.backgroundColor=[UIColor whiteColor];
    self.modJournalismStyle1SearchTableView.delegate= self;
    self.modJournalismStyle1SearchTableView.dataSource= self;
    [self.modJournalismStyle1SearchTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view insertSubview:self.modJournalismStyle1SearchTableView belowSubview:self.viewTop];
}
#pragma mark - ButtonColor
-(void)configureButtonColor{
    self.buttonColor = [[HGLoadConfiguration sharedInstance]loadHGConfigureProperty:HGAPPFACTORYCONFIGURE_BUTTON_BACKGROUND_COLOR isOverallSituationProperty:NO type:STRINGTYPE withModuleSign:moduleSign];
    if (![self.buttonColor length]) {
        self.buttonColor = [[HGLoadConfiguration sharedInstance]loadHGConfigureProperty:HGAPPFACTORYCONFIGURE_MAIN isOverallSituationProperty:YES type:STRINGTYPE withModuleSign:nil];
    }
}
#pragma mark - addSubViews
-(void)addTopView{
    self.view.backgroundColor=[UIColor hexChangeFloat:@"DDDDDD"];
    UIView* viewTop = (UIView*)[self.view viewWithTag:kTagViewHeader];
    viewTop.backgroundColor =[UIColor hexChangeFloat:@"D53C33"];
    self.viewTop=viewTop;
    self.headerTitle = @"";
    self.searchView = [[ModJournalismStyle1SearchView alloc]initWithFrame:CGRectZero buttonColor:self.buttonColor withModuleSign:self.moduleSign];
    self.searchView.textField.delegate = self;
    self.searchView.backgroundColor=[UIColor hexChangeFloat:@"D53C33"];
    [self.searchView.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [viewTop addSubview:self.searchView];
}
#pragma mark -UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.selectTableView==0) {
        return 3;
    }else if (self.selectTableView==1){
        return 2;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.selectTableView==0) {
        if (section==0) {
         return 0;
        }else{
        return 40;
        }
    }else if (self.selectTableView==1){
        return 40;
    }
    return 10;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.selectTableView==0) {
        if (section==0) {
         return nil;
        }else if (section==1){
         return self.modJournalismStyle1AleadyAttentionHeadView;//-已关注-
        }else if (section==2){
         return self.modJournalismStyle1HotAttentionHeadView;//-热门关注-
        }
    }else if (self.selectTableView==1){
       return nil;
    }
       return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.selectTableView==0) {
        if (section==0) {
            return 1;
        }else if (section==1){
          return [self.modJournalismStyle1AlreadyAttentionListArry count];
        }else if (section==2){
         return [self.modJournalismStyle1HotAttentionListArry count];
        }
    }else if (self.selectTableView==1){
       return [self.modJournalismStyle1searchListArry count];
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.selectTableView==0) {
        if (indexPath.section==0) {
            return 82;
        }else if (indexPath.section==1){
            ModJournalismStyle1Model *journalismStyle1Model = [self.modJournalismStyle1AlreadyAttentionListArry objectAtIndex:indexPath.row];
            CGFloat h = [ModJournalismStyle1AttentionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                ModJournalismStyle1AttentionCell *cell = (ModJournalismStyle1AttentionCell *)sourceCell;
                [cell loadJournalismStyle1AttentionWithModel:journalismStyle1Model indexPath:indexPath];
            } cache:nil];
            return h;
        }else if (indexPath.section==2){
            ModJournalismStyle1Model *journalismStyle1Model = [self.modJournalismStyle1HotAttentionListArry objectAtIndex:indexPath.row];
            CGFloat h = [ModJournalismStyle1AttentionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                ModJournalismStyle1AttentionCell *cell = (ModJournalismStyle1AttentionCell *)sourceCell;
                [cell loadJournalismStyle1AttentionWithModel:journalismStyle1Model indexPath:indexPath];
            } cache:nil];
            return h;
        }
    }else if (self.selectTableView==1){
        return 100;
    }
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        if (self.selectTableView==0) {
            if (indexPath.section==0) {
                static NSString *livePlayKeyStr = @"livePlayKey";//直播cell
                ModJournalismStyle1LivePlayCell *journalismStyle1LivePlayCell = [tableView dequeueReusableCellWithIdentifier:livePlayKeyStr];
                if (!journalismStyle1LivePlayCell) {
                    journalismStyle1LivePlayCell = [[ModJournalismStyle1LivePlayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:livePlayKeyStr];
                    journalismStyle1LivePlayCell.selectionStyle = UITableViewCellSelectionStyleNone;
                    journalismStyle1LivePlayCell.contentView.backgroundColor = [UIColor whiteColor];
                }
                // 做数据处理 传递数据，先注释掉，等接口好了打开
                NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:1];
//                for (NSDictionary *modelDic in self.modJournalismStyle1LivePlayListArry) {
//                   ModJournalismStyle1Model*livePlayModel = [[ModJournalismStyle1Model alloc] init];
//                    [livePlayModel setValuesForKeysWithDictionary:modelDic];
//                    [tempArray addObject:livePlayModel];
//                }
                journalismStyle1LivePlayCell.livePlayDataArray = [NSArray arrayWithArray:self.modJournalismStyle1LivePlayListArry];
                return journalismStyle1LivePlayCell;
                
            }else if (indexPath.section==1){
                static NSString *alreadyAttentionKeyStr = @"alreadyAttentionKey";//已关注cell
                //关注cell
                ModJournalismStyle1AttentionCell *journalismStyle1AttentionCell = [tableView dequeueReusableCellWithIdentifier:alreadyAttentionKeyStr];
                if (!journalismStyle1AttentionCell) {
                    journalismStyle1AttentionCell = [[ModJournalismStyle1AttentionCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:alreadyAttentionKeyStr];
                    journalismStyle1AttentionCell.selectionStyle=UITableViewCellSelectionStyleNone;
                    journalismStyle1AttentionCell.delegate=self;
                }
                ModJournalismStyle1Model* journalismStyle1Model = self.modJournalismStyle1AlreadyAttentionListArry[indexPath.row];
                [journalismStyle1AttentionCell loadJournalismStyle1AttentionWithModel:journalismStyle1Model indexPath:indexPath];
                return journalismStyle1AttentionCell;
            }else if (indexPath.section==2){
                static NSString *hotAttentionKeyStr = @"hotAttentionKey";//热门关注cell
                //关注cell
                ModJournalismStyle1AttentionCell *journalismStyle1AttentionCell = [tableView dequeueReusableCellWithIdentifier:hotAttentionKeyStr];
                if (!journalismStyle1AttentionCell) {
                    journalismStyle1AttentionCell = [[ModJournalismStyle1AttentionCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:hotAttentionKeyStr];
                    journalismStyle1AttentionCell.selectionStyle=UITableViewCellSelectionStyleNone;
                    journalismStyle1AttentionCell.delegate=self;
                }
                ModJournalismStyle1Model* journalismStyle1Model = self.modJournalismStyle1HotAttentionListArry[indexPath.row];
                [journalismStyle1AttentionCell loadJournalismStyle1AttentionWithModel:journalismStyle1Model indexPath:indexPath];
                return journalismStyle1AttentionCell;
            }
        }else if (self.selectTableView==1){
            return nil;
        }
    return nil;
}
#pragma mark - SelectModJournalismStyle1LivePlayCellDelegate
/**
点击直播人头像
@param clickModel 数据ModJournalismStyle1Model
*/
- (void)clickModJournalismStyle1LivePlayCellPerson:(ModJournalismStyle1Model *)clickModel{
    ModJournalismStyle1Model*journalismStyle1Model=clickModel;
    NSString * link = [[HGCommonConfigure sharedInstance]configureNewOutLinkWithSeverOutLink:@"my/ModUserCenterStyle14Personal" moduleId:nil detailId:nil];
    [Navigator navigateToControllerWithCustomOutlink:nil withOutlink:link withNextStyle:nil withDataArray:nil shouldJump:YES];
}
#pragma mark - 显示全部已关注
-(void)showAllAlreadyAttention{
    NSString * defaultOutlink = [[HGCommonConfigure sharedInstance]configureClassWithModelFlag:moduleSign  prefixName:@"ModJournalismStyle1SearchConcerned" withParamSources:nil];
    [Navigator navigateToControllerWithCustomOutlink:defaultOutlink withOutlink:nil withNextStyle:nil withDataArray:nil shouldJump:YES];
}
#pragma mark - 显示全部已关注
-(void)showAllHotAttention{
    NSString * defaultOutlink = [[HGCommonConfigure sharedInstance]configureClassWithModelFlag:moduleSign  prefixName:@"ModJournalismStyle1SearchHot" withParamSources:nil];
    [Navigator navigateToControllerWithCustomOutlink:defaultOutlink withOutlink:nil withNextStyle:nil withDataArray:nil shouldJump:YES];
}
#pragma mark - 懒加载
-(NSMutableArray*)modJournalismStyle1AlreadyAttentionListArry{
    if (!_modJournalismStyle1AlreadyAttentionListArry) {
        _modJournalismStyle1AlreadyAttentionListArry=[NSMutableArray arrayWithCapacity:0];
    }
    return _modJournalismStyle1AlreadyAttentionListArry;
}
-(NSMutableArray*)modJournalismStyle1HotAttentionListArry{
    if (!_modJournalismStyle1HotAttentionListArry) {
        _modJournalismStyle1HotAttentionListArry=[NSMutableArray arrayWithCapacity:0];
    }
    return _modJournalismStyle1HotAttentionListArry;
}
-(NSMutableArray*)modJournalismStyle1LivePlayListArry{
    if (!_modJournalismStyle1LivePlayListArry) {
        _modJournalismStyle1LivePlayListArry=[NSMutableArray arrayWithCapacity:0];
    }
    return _modJournalismStyle1LivePlayListArry;
}
-(UIView *)modJournalismStyle1AleadyAttentionHeadView{
    if (!_modJournalismStyle1AleadyAttentionHeadView) {
        _modJournalismStyle1AleadyAttentionHeadView=[[UIView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,40)];
        _modJournalismStyle1AleadyAttentionHeadView.backgroundColor=[UIColor hexChangeFloat:@"DDDDDD"];
        UILabel *alreadyAttention=[[UILabel alloc]initWithFrame:CGRectMake(10,10,100,20)];
        alreadyAttention.font=[UIFont loadFontStyleWithDefaultFontNum:14 fontFamilyName:@"PingFang-SC-Regular" moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        alreadyAttention.textColor=[UIColor hexChangeFloat:@"939393"];
        alreadyAttention.text=[CustomLocalizedString  loadCustomLocalizedStringWithKey:LOCALIZED_JOURNALISM_ALREADY_ATTENTION identification:JOURNALISM_LOCALIZABLE_NAME];;
        alreadyAttention.backgroundColor=[UIColor clearColor];
        [_modJournalismStyle1AleadyAttentionHeadView addSubview:alreadyAttention];
        
        UIButton *showAll=[UIButton buttonWithType:UIButtonTypeCustom];
        showAll.frame=CGRectMake(SCREEN_WIDTH-60,10,60,20);
        [showAll setImage:[UIImage imageNamed:@"modJournalismStyle1_showAttention"] forState:UIControlStateNormal];
        showAll.backgroundColor=[UIColor clearColor];
        [showAll addTarget:self action:@selector(showAllAlreadyAttention) forControlEvents:UIControlEventTouchUpInside];
        [_modJournalismStyle1AleadyAttentionHeadView addSubview:showAll];
        
    }
    return _modJournalismStyle1AleadyAttentionHeadView;
}
-(UIView *)modJournalismStyle1HotAttentionHeadView{
    if (!_modJournalismStyle1HotAttentionHeadView) {
        _modJournalismStyle1HotAttentionHeadView=[[UIView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,40)];
        _modJournalismStyle1HotAttentionHeadView.backgroundColor=[UIColor hexChangeFloat:@"DDDDDD"];
        UILabel *alreadyAttention=[[UILabel alloc]initWithFrame:CGRectMake(10,10,100,20)];
        alreadyAttention.font=[UIFont loadFontStyleWithDefaultFontNum:14 fontFamilyName:@"PingFang-SC-Regular" moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        alreadyAttention.textColor=[UIColor hexChangeFloat:@"939393"];
        alreadyAttention.text=[CustomLocalizedString  loadCustomLocalizedStringWithKey: LOCALIZED_JOURNALISM_HOT_ATTENTON identification:JOURNALISM_LOCALIZABLE_NAME];;
        alreadyAttention.backgroundColor=[UIColor clearColor];
        [_modJournalismStyle1HotAttentionHeadView addSubview:alreadyAttention];
        
        UIButton *showAll=[UIButton buttonWithType:UIButtonTypeCustom];
        showAll.frame=CGRectMake(SCREEN_WIDTH-60,10,60,20);
        [showAll setImage:[UIImage imageNamed:@"modJournalismStyle1_showAttention"] forState:UIControlStateNormal];
        showAll.backgroundColor=[UIColor clearColor];
        [showAll addTarget:self action:@selector(showAllHotAttention) forControlEvents:UIControlEventTouchUpInside];
        [_modJournalismStyle1HotAttentionHeadView addSubview:showAll];
        
    }
    return _modJournalismStyle1HotAttentionHeadView;
}
@end
