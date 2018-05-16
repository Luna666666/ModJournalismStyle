//
//  ModJournalismStyle1Cell.h
//  CompBaiduMap
//
//  Created by admin on 2018/4/24.
//

#import <UIKit/UIKit.h>
#import "ModJournalismStyle1Model.h"
@class ModJournalismStyle1Cell;

@protocol SelectModJournalismStyle1CellDelegate <NSObject>
/**
 点击头像跳转个人中心
 @param cell ModJournalismStyle1Cell
 @param sender 当前点按图片
 */
-(void)selectModJournalismStyle1Cell:(ModJournalismStyle1Cell*)cell modJournalismStyle1jumpPersonalCenterAction:(id)sender;

/**
点击赞
@param cell ModJournalismStyle1Cell
@param sender 当前点按图片
*/
-(void)selectModJournalismStyle1Cell:(ModJournalismStyle1Cell*)cell modJournalismStyle1praiseAction:(id)sender;
@end

@interface ModJournalismStyle1Cell : UITableViewCell
/**
 用户头像
 */
@property(nonatomic,strong) MxuAsyncImageView *headIcon;
/**
 姓名
 */
@property(nonatomic,strong) TTTAttributedLabel  *nameLabel;
/**
 日期
 */
@property(nonatomic,strong) TTTAttributedLabel  *dateLabel;
/**
 标题
 */
@property(nonatomic,strong) TTTAttributedLabel  *titleLabel;
/**
 详情
 */
@property(nonatomic,strong) TTTAttributedLabel  *detailLabel;
/**
 点赞
 */
@property(nonatomic,strong) UIButton  *praise;
/**
 底部灰色分割线
 */
@property(nonatomic,strong) UIView *bottomGrayLine;
/**
 设置委托
 */
@property (nonatomic, weak) id<SelectModJournalismStyle1CellDelegate>delegate;
/**
 初始化ModJournalismStyle1Cell
 @param style UITableViewCellStyle
 @param reuseIdentifier 复用标志
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
/**
 加载数据
 @param model 数据model
 @param tableviewTag 栏目栏Tag
 */
-(void)loadJournalismStyle1TextWithModel:(ModJournalismStyle1Model*)model;
@end



@class ModJournalismStyle1AudioCell;

@protocol SelectModJournalismStyle1AudioCellDelegate <NSObject>
/**
 直播回看
 @param cell ModJournalismStyle1AudioCell
 @param sender 当前点击按钮
 */
-(void)selectModJournalismStyle1AudioCell:(ModJournalismStyle1AudioCell*)cell liveAction:(UIButton*)sender;
/**
 点击头像跳转个人中心
 @param cell ModJournalismStyle1AudioCell
 @param sender 当前点按图片
 */
-(void)selectModJournalismStyle1AudioCell:(ModJournalismStyle1AudioCell*)cell modJournalismStyle1AudioCelljumpPersonalCenterAction:(id)sender;
/**
 点击赞
 @param cell ModJournalismStyle1Cell
 @param sender 当前点按图片
 */
-(void)selectModJournalismStyle1AudioCell:(ModJournalismStyle1AudioCell*)cell modJournalismStyle1AudioCellpraiseAction:(id)sender;
@end

@interface ModJournalismStyle1AudioCell : UITableViewCell
/**
 用户头像
 */
@property(nonatomic,strong) MxuAsyncImageView *headIcon;
/**
 姓名
 */
@property(nonatomic,strong) TTTAttributedLabel  *nameLabel;
/**
 日期
 */
@property(nonatomic,strong) TTTAttributedLabel  *dateLabel;
/**
 正在直播
 */
@property(nonatomic,strong) UIButton  *isLive;
/**
 标题
 */
@property(nonatomic,strong) TTTAttributedLabel  *titleLabel;
/**
 音频图片
 */
@property(nonatomic,strong) MxuAsyncImageView *audioPicture;
/**
 点赞
 */
@property(nonatomic,strong) UIButton  *praise;
/**
底部灰色分割线
 */
@property(nonatomic,strong) UIView *bottomGraysLine;
/**
 设置委托
 */
@property (nonatomic, weak) id<SelectModJournalismStyle1AudioCellDelegate>delegate;
/**
初始化ModJournalismStyle1Cell
@param style UITableViewCellStyle
@param reuseIdentifier 复用标志
*/
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
/**
 加载数据
 @param model 数据model
 @param tableviewTag 栏目栏Tag
 */
-(void)loadJournalismStyle1AudioWithModel:(ModJournalismStyle1Model *)model;
@end


@class ModJournalismStyle1AttentionCell;

@protocol SelectModJournalismStyle1AttentionCellDelegate <NSObject>
/**
 点击关注
 @param cell ModJournalismStyle1AttentionCell
 @param sender 当前点击按钮
 */
-(void)selectModJournalismStyle1AttentionCell:(ModJournalismStyle1AttentionCell*)cell attentionAction:(id)sender;
/**
 点击头像跳转个人中心
 @param cell ModJournalismStyle1AttentionCell
 @param sender 当前点击按钮
 */
-(void)selectModJournalismStyle1AttentionCell:(ModJournalismStyle1AttentionCell*)cell modJournalismStyle1AttentionJumpPersonalCenterAction:(id)sender;
@end

@interface ModJournalismStyle1AttentionCell : UITableViewCell
/**
 用户头像
 */
@property(nonatomic,strong) MxuAsyncImageView *headIcon;
/**
 用户姓名
 */
@property(nonatomic,strong) TTTAttributedLabel  *nameLabel;
/**
 标题
 */
@property(nonatomic,strong) TTTAttributedLabel  *titleLabel;
/**
 关注
 */
@property(nonatomic,strong) UIButton *attentionBtn;
/**
 底部灰色分割线
 */
@property(nonatomic,strong) UIView *bottomGrayLine;
/**
 设置委托
 */
@property (nonatomic, weak) id<SelectModJournalismStyle1AttentionCellDelegate> delegate;
/**
 初始化ModJournalismStyle1Cell
 @param style UITableViewCellStyle
 @param reuseIdentifier 复用标志
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
/**
 加载数据
 @param model 数据model
 @param indexPath 点击cell的indexPath行
 */
-(void)loadJournalismStyle1AttentionWithModel:(ModJournalismStyle1Model*)model indexPath:(NSIndexPath *)indexPath;

@end



@class ModJournalismStyle1LivePlayCell;

@protocol SelectModJournalismStyle1LivePlayCellDelegate <NSObject>
/**
 点击直播人头像
 @param clickModel 数据ModJournalismStyle1Model
 */
@optional
- (void)clickModJournalismStyle1LivePlayCellPerson:(ModJournalismStyle1Model *)clickModel;
@end

@interface ModJournalismStyle1LivePlayCell : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong)UICollectionView *livePlayCollectionView;
@property (nonatomic, strong)NSArray *livePlayDataArray; //直播数据源;

@property (nonatomic, weak)id<SelectModJournalismStyle1LivePlayCellDelegate>delegate;
/**
 初始化ModJournalismStyle1Cell
 @param style UITableViewCellStyle
 @param reuseIdentifier 复用标志
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end

@interface ModJournalismStyle1LivePlayHeadCell :UICollectionViewCell

@property (nonatomic, strong)UIImageView *livePlayImageView;
@property (nonatomic, strong)UILabel *livePlayNameLabel;
@property (nonatomic, strong)ModJournalismStyle1Model *journalismStyle1Model;
@end







