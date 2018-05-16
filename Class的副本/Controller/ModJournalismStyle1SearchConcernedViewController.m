//
//  ModJournalismStyle1SearchConcernedViewController.m
//  CompBaiduMap
//
//  Created by admin on 2018/4/28.
//

#import "ModJournalismStyle1SearchConcernedViewController.h"
#import "ModJournalismStyle1SearchView.h"
#import "ModJournalismStyle1Model.h"
#import "ModJournalismStyle1Cell.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "ModJournalismStyleLocalized.h"
@interface ModJournalismStyle1SearchConcernedViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,HGTableViewDelegate>
@property (nonatomic, strong)ModJournalismStyle1SearchView*searchView;
@property (nonatomic, strong)HGTableView *modJournalismStyle1SearchConcernedTableView;
@property (nonatomic, strong)UIView* viewTop;
@property (strong,nonatomic) NSMutableArray  *modJournalismStyle1AlreadyAttentionList;
@property (strong,nonatomic) NSMutableArray  *modJournalismStyle1AlreadyAttentionSearchList;
@property (nonatomic, strong)UIView*modJournalismStyle1SearchHotHeadView;
@property (nonatomic, strong)NSString * buttonColor;//按钮颜色
@property (nonatomic, assign)NSInteger selectTableView;
@end

@implementation ModJournalismStyle1SearchConcernedViewController
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
    [self addModJournalismStyle1SearchConcernedTableView];
    [self configLayout];
    [self loadSearchModJournalismStyle1SearchConcernedList];
 
}
#pragma mark - ButtonColor
-(void)configureButtonColor{
    self.buttonColor = [[HGLoadConfiguration sharedInstance]loadHGConfigureProperty:HGAPPFACTORYCONFIGURE_BUTTON_BACKGROUND_COLOR isOverallSituationProperty:NO type:STRINGTYPE withModuleSign:moduleSign];
    if (![self.buttonColor length]) {
        self.buttonColor = [[HGLoadConfiguration sharedInstance]loadHGConfigureProperty:HGAPPFACTORYCONFIGURE_MAIN isOverallSituationProperty:YES type:STRINGTYPE withModuleSign:nil];
    }
}
-(void)loadSearchModJournalismStyle1SearchConcernedList{
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
    
    ModJournalismStyle1Model *model4=[[ModJournalismStyle1Model alloc]init];
    model4.rType=@0;
    model4.avatar=@"modJournalismStyle1_default_icon";
    model4.userName=@"玉林";
    model4.isLive=@1;
    model4.title=@"电话解决的口袋里";
    model4.audioPicture=@"modJournalismStyle1_default_audio";
    model4.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解";
    model4.date=@"2小时前";
    model4.is_Zan=@0;
    model4.zanCount=@68;
    model4.is_con=@1;
    
    [self.modJournalismStyle1AlreadyAttentionList addObject:model1];
    [self.modJournalismStyle1AlreadyAttentionList addObject:model2];
    [self.modJournalismStyle1AlreadyAttentionList addObject:model3];
    [self.modJournalismStyle1AlreadyAttentionList addObject:model4];
}
-(void)loadSearchModJournalismStyle1SearchConcernedSearchList{
    [self.modJournalismStyle1SearchConcernedTableView endRefreshing];
    [self.modJournalismStyle1AlreadyAttentionSearchList  removeAllObjects];
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
    
    ModJournalismStyle1Model *model4=[[ModJournalismStyle1Model alloc]init];
    model4.rType=@0;
    model4.avatar=@"modJournalismStyle1_default_icon";
    model4.userName=@"玉林";
    model4.isLive=@1;
    model4.title=@"电话解决的口袋里";
    model4.audioPicture=@"modJournalismStyle1_default_audio";
    model4.detail=@"电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解决的口袋里带来的流量多了电话解";
    model4.date=@"2小时前";
    model4.is_Zan=@0;
    model4.zanCount=@68;
    model4.is_con=@1;
    [self.modJournalismStyle1AlreadyAttentionSearchList addObject:model1];
    [self.modJournalismStyle1AlreadyAttentionSearchList addObject:model2];
    [self.modJournalismStyle1AlreadyAttentionSearchList addObject:model3];
    [self.modJournalismStyle1AlreadyAttentionSearchList addObject:model4];
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
#pragma mark - 配置SearchTableView
-(void)addModJournalismStyle1SearchConcernedTableView{
    self.modJournalismStyle1SearchConcernedTableView = [[HGTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped attributes:nil];
    self.modJournalismStyle1SearchConcernedTableView.refreshDelegate = self;
    self.modJournalismStyle1SearchConcernedTableView.showTopRefresh = YES;
    self.modJournalismStyle1SearchConcernedTableView.showBottomRefresh =YES;
    self.modJournalismStyle1SearchConcernedTableView.showsVerticalScrollIndicator = NO;
    self.modJournalismStyle1SearchConcernedTableView.showsHorizontalScrollIndicator = NO;
    self.modJournalismStyle1SearchConcernedTableView.backgroundColor=[UIColor whiteColor];
    self.modJournalismStyle1SearchConcernedTableView.delegate= self;
    self.modJournalismStyle1SearchConcernedTableView.dataSource= self;
    [self.modJournalismStyle1SearchConcernedTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view insertSubview:self.modJournalismStyle1SearchConcernedTableView belowSubview:self.viewTop];
}
#pragma mark - 配置Layout
- (void)configLayout {
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.viewTop).offset(10);;
        make.centerX.equalTo(self.viewTop);
        make.width.mas_equalTo(@327);
        make.height.equalTo(@30);
    }];
    [self.modJournalismStyle1SearchConcernedTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.top.equalTo(self.viewTop.mas_bottom).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];
}
#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger sectionNumber=0;
    if (self.selectTableView==0) {
        sectionNumber=1;//原始数据
    }else if (self.selectTableView==1){//搜索数据
        sectionNumber=1;
    }
    return sectionNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowNumber=0;
    if (self.selectTableView==0) {//原始数据
        rowNumber=self.modJournalismStyle1AlreadyAttentionList.count;
    }else if (self.selectTableView==1){
        rowNumber=self.modJournalismStyle1AlreadyAttentionSearchList.count;
    }
    return rowNumber;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectTableView==0) {
        ModJournalismStyle1Model *journalismStyle1Model = [self.modJournalismStyle1AlreadyAttentionList objectAtIndex:indexPath.row];
        CGFloat h = [ModJournalismStyle1AttentionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
            ModJournalismStyle1AttentionCell *cell = (ModJournalismStyle1AttentionCell *)sourceCell;
            [cell loadJournalismStyle1AttentionWithModel:journalismStyle1Model indexPath:indexPath];
        } cache:nil];
        return h;
    }else if (self.selectTableView==1){
        ModJournalismStyle1Model *journalismStyle1Model = [self.modJournalismStyle1AlreadyAttentionSearchList objectAtIndex:indexPath.row];
        CGFloat h = [ModJournalismStyle1AttentionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
            ModJournalismStyle1AttentionCell *cell = (ModJournalismStyle1AttentionCell *)sourceCell;
            [cell loadJournalismStyle1AttentionWithModel:journalismStyle1Model indexPath:indexPath];
        } cache:nil];
        return h;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.selectTableView==0) {
        return 40;
    }else if (self.selectTableView==1){
        return 40;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.selectTableView==0) {
        return 0.01;
    }else if (self.selectTableView==1){
        return 0.01;
    }
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectTableView==0) {
        static NSString *alreadyAttentionKeyStr = @"alreadyAttentionKeyKey";//原始cell
        //关注cell
        ModJournalismStyle1AttentionCell *journalismStyle1AttentionCell = [tableView dequeueReusableCellWithIdentifier:alreadyAttentionKeyStr];
        if (!journalismStyle1AttentionCell) {
            journalismStyle1AttentionCell = [[ModJournalismStyle1AttentionCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:alreadyAttentionKeyStr];
            journalismStyle1AttentionCell.selectionStyle=UITableViewCellSelectionStyleNone;
            journalismStyle1AttentionCell.delegate=self;
        }
        ModJournalismStyle1Model* journalismStyle1Model = self.modJournalismStyle1AlreadyAttentionList[indexPath.row];
        [journalismStyle1AttentionCell loadJournalismStyle1AttentionWithModel:journalismStyle1Model indexPath:indexPath];
        return journalismStyle1AttentionCell;
    }else if (self.selectTableView==1){
        static NSString *alreadyAttentionSearchKeyStr = @"alreadyAttentionSearchKeyStr";//搜索cell
        //关注cell
        ModJournalismStyle1AttentionCell *journalismStyle1AttentionCell = [tableView dequeueReusableCellWithIdentifier:alreadyAttentionSearchKeyStr];
        if (!journalismStyle1AttentionCell) {
            journalismStyle1AttentionCell = [[ModJournalismStyle1AttentionCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:alreadyAttentionSearchKeyStr];
            journalismStyle1AttentionCell.selectionStyle=UITableViewCellSelectionStyleNone;
            journalismStyle1AttentionCell.delegate=self;
        }
        ModJournalismStyle1Model* journalismStyle1Model = self.modJournalismStyle1AlreadyAttentionSearchList[indexPath.row];
        [journalismStyle1AttentionCell loadJournalismStyle1AttentionWithModel:journalismStyle1Model indexPath:indexPath];
        return journalismStyle1AttentionCell;
    }
    return nil;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.modJournalismStyle1SearchHotHeadView;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
#pragma mark - TextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.searchView.textField becomeFirstResponder];
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    self.selectTableView=0;
    [self.modJournalismStyle1SearchConcernedTableView reloadTableView];
    [self.searchView.textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidChange:(UITextField *)textField{
    [self.modJournalismStyle1SearchConcernedTableView reloadData];
    [self.searchView.textField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.searchView.textField.text.length == 0) {
        [self showAlert:[CustomLocalizedString loadCustomLocalizedStringWithKey:LOCALIZED_SEARCH_NOTNULL] message:nil];
        return NO;
    }
    else{
        NSString *searchString =textField.text;
        self.selectTableView=1;
        [self loadSearchModJournalismStyle1SearchConcernedSearchList];
        [self.modJournalismStyle1SearchConcernedTableView reloadTableView];
        [self.searchView.textField resignFirstResponder];
    }
    return YES;
}
#pragma mark - HGTableViewDelegate
/*
 * @method 刷新操作
 */
- (void)hgTableViewExecuteRefreshMethods:(HGTableView *)view{
    if (self.selectTableView==0) {
        [self loadSearchModJournalismStyle1SearchConcernedList];
    }else if (self.selectTableView==1){
        [self loadSearchModJournalismStyle1SearchConcernedSearchList];
    }
}
/**
 热门关注
 */
-(NSMutableArray*)modJournalismStyle1AlreadyAttentionList{
    if (!_modJournalismStyle1AlreadyAttentionList) {
        _modJournalismStyle1AlreadyAttentionList=[NSMutableArray arrayWithCapacity:0];
    }
    return _modJournalismStyle1AlreadyAttentionList;
}
/**
 搜索
 */
-(NSMutableArray*)modJournalismStyle1AlreadyAttentionSearchList{
    if (!_modJournalismStyle1AlreadyAttentionSearchList) {
        _modJournalismStyle1AlreadyAttentionSearchList=[NSMutableArray arrayWithCapacity:0];
    }
    return _modJournalismStyle1AlreadyAttentionSearchList;
}
-(UIView *)modJournalismStyle1SearchHotHeadView{
    if (!_modJournalismStyle1SearchHotHeadView) {
        _modJournalismStyle1SearchHotHeadView=[[UIView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,40)];
        _modJournalismStyle1SearchHotHeadView.backgroundColor=[UIColor hexChangeFloat:@"DDDDDD"];
        UILabel *modJournalismStyle1SearchHot=[[UILabel alloc]initWithFrame:CGRectMake(10,10,100,20)];
        modJournalismStyle1SearchHot.font=[UIFont loadFontStyleWithDefaultFontNum:10 fontFamilyName:@"PingFang-SC-Regular" moduleFontProperty:nil overFontProperty:nil isBlod:NO moduleSign:nil];
        modJournalismStyle1SearchHot.textColor=[UIColor hexChangeFloat:@"939393"];
        modJournalismStyle1SearchHot.text=[CustomLocalizedString  loadCustomLocalizedStringWithKey:LOCALIZED_JOURNALISM_ALREADY_ATTENTION identification:JOURNALISM_LOCALIZABLE_NAME];
        modJournalismStyle1SearchHot.backgroundColor=[UIColor clearColor];
        [_modJournalismStyle1SearchHotHeadView addSubview:modJournalismStyle1SearchHot];
    }
    return _modJournalismStyle1SearchHotHeadView;
}
@end
