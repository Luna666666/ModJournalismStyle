//
//  ModJournalismStyle1Model.m
//  CompBaiduMap
//
//  Created by admin on 2018/4/16.
//

#import "ModJournalismStyle1Model.h"

@implementation ModJournalismStyle1Model
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.rType = @0;
        self.avatar = @"";
        self.userName = @"";
        self.isLive = @0;
        self.title = @"";
        self.audioPicture = @"";
        self.detail = @"";
        self.date = @"";
        self.is_con =@0;
        self.is_Zan =@0;
        self.zanCount =@0;
    }
    return self;
}
-(void)modelWithDict:(NSDictionary*)dict{
    if (!isNilNull([dict objectForKey:@"rType"])) {
        self.rType =[NSNumber numberWithInteger:[dict objectForKey:@"rType"]];
    }
    if (!isNilNull([dict objectForKey:@"avatar"])) {
        self.avatar =[NSString stringWithFormat:@"%@",[dict objectForKey:@"avatar"]];
    }
    if (!isNilNull([dict objectForKey:@"userName"])) {
        self.userName =[NSString stringWithFormat:@"%@",[dict objectForKey:@"userName"]];
    }
    if (!isNilNull([dict objectForKey:@"isLive"])) {
        self.isLive =[NSNumber numberWithInteger:[dict objectForKey:@"isLive"]];
    }
    if (!isNilNull([dict objectForKey:@"title"])) {
        self.title =[NSString stringWithFormat:@"%@",[dict objectForKey:@"title"]];
    }
    if (!isNilNull([dict objectForKey:@"audioPicture"])) {
        self.audioPicture =[NSString stringWithFormat:@"%@",[dict objectForKey:@"audioPicture"]];
    }
    if (!isNilNull([dict objectForKey:@"audioPicture"])) {
        self.detail=[NSString stringWithFormat:@"%@",[dict objectForKey:@"audioPicture"]];
    }
    if (!isNilNull([dict objectForKey:@"date"])) {
        self.date =[NSNumber numberWithInteger:[dict objectForKey:@"date"]];
    }
    if (!isNilNull([dict objectForKey:@"is_con"])) {
        self.is_con =[NSNumber numberWithInteger:[dict objectForKey:@"is_con"]];
    }
    if (!isNilNull([dict objectForKey:@"is_Zan"])) {
        self.is_Zan =[NSNumber numberWithInteger:[dict objectForKey:@"is_Zan"]];
    }
    if (!isNilNull([dict objectForKey:@"zanCount"])) {
        self.zanCount =[NSNumber numberWithInteger:[dict objectForKey:@"zanCount"]];
    }
   
}
@end
