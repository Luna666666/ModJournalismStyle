//
//  ModJournalismStyle1Model.h
//  CompBaiduMap
//
//  Created by admin on 2018/4/16.
//

#import <Foundation/Foundation.h>

@interface ModJournalismStyle1Model : NSObject
@property (nonatomic, copy) NSNumber *rType;//文字0，音频频1，图片2
@property (nonatomic, copy) NSString *avatar;//头像
@property (nonatomic, copy) NSString *userName;//姓名
@property (nonatomic, copy) NSNumber *isLive;//是否在直播，0正在直播，1回看
@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, copy) NSString *audioPicture;//音频图片
@property (nonatomic, copy) NSString *detail;//详情
@property (nonatomic, copy) NSString *date;//时间
@property (nonatomic, strong)NSNumber* is_con;//关注
@property (nonatomic, strong)NSNumber* is_Zan;//是否赞,0未赞，1已赞
@property (nonatomic, strong)NSNumber* zanCount;//赞数量




-(void)modelWithDict:(NSDictionary*)dict;

@end
