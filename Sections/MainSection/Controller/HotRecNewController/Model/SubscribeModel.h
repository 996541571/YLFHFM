//
//  SubscribeModel.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/21.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendSubscribeListModel, HotSubscribeListModel, NewsSubscribeListModel;

@interface SubscribeModel : NSObject

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) RecommendSubscribeListModel *data;

@end

/**
 *  推荐返回的总体数据
 **/

@interface RecommendSubscribe : NSObject

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) RecommendSubscribeListModel *data;

@end

/**
 *  推荐列表
 **/

@interface RecommendSubscribeListModel : NSObject

@property (nonatomic, strong) NSString *nodeName;   // 播客

@property (nonatomic, strong) NSMutableArray *reList; // hot,new,recommend array

@property (nonatomic, strong) NSString *nodeId;

@property (nonatomic, strong) NSString *reListCount;

@property (nonatomic, strong) NSString *defaultList;

@end

/**
 *  推荐详细信息
 **/
@interface RecommendSubscribeDetailModel : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *resourceCreateTime;

@property (nonatomic, strong) NSString *resourceId;

@property (nonatomic, strong) NSString *thumbnail;

@property (nonatomic, strong) NSString *reCompere;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *resourceTitle;

@property (nonatomic, strong) NSString *reProgramName;

@property (nonatomic, strong) NSString *resourceNum;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *img297_194;

@property (nonatomic, strong) NSString *rePlayerBackground;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *isYss;

@property (nonatomic, strong) NSString *downloadNumShow;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *programLogo;

@property (nonatomic, strong) NSString *img180_240;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *subscribesNumShow;

@property (nonatomic, strong) NSString *reProgramDetails;

@property (nonatomic, strong) NSString *img130_130;

@property (nonatomic, strong) NSString *playerBackground;

@end

/**
 *  热门返回的总体数据
 **/
@interface HotSubscribe : NSObject

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) HotSubscribeListModel *data;

@end

/**
 *  热门列表
 **/
@interface HotSubscribeListModel : NSObject

@property (nonatomic, strong) NSString *nodeName;

@property (nonatomic, strong) NSMutableArray *hotList;

@property (nonatomic, strong) NSString *nodeId;

@property (nonatomic, strong) NSString *defaultList;

@property (nonatomic, strong) NSString *hotListCount;

@end

/**
 *  热门详细数据
 **/
@interface HotSubscribeDetailModel : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *resourceCreateTime;

@property (nonatomic, strong) NSString *programDetails;

@property (nonatomic, strong) NSString *resourceId;

@property (nonatomic, strong) NSString *thumbnail;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *resourceTitle;

@property (nonatomic, strong) NSString *resourceNum;

@property (nonatomic, strong) NSString *compere;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *img297_194;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *isYss;

@property (nonatomic, strong) NSString *downloadNumShow;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *programLogo;

@property (nonatomic, strong) NSString *img180_240;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *subscribesNumShow;

@property (nonatomic, strong) NSString *img130_130;

@property (nonatomic, strong) NSString *playerBackground;

@end

/**
 *  最新返回总体数据
 **/
@interface NewsSubscribe : NSObject

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) NewsSubscribeListModel *data;

@end

/**
 *  最新列表
 **/
@interface NewsSubscribeListModel : NSObject

@property (nonatomic, strong) NSString *nodeName;

@property (nonatomic, strong) NSMutableArray *newsList;

@property (nonatomic, strong) NSString *nodeId;

@property (nonatomic, strong) NSString *defaultList;

@property (nonatomic, strong) NSString *newsListCount;

@end

/**
 *  最新详细信息
 **/
@interface NewsSubscribeDetailModel : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *resourceCreateTime;

@property (nonatomic, strong) NSString *programDetails;

@property (nonatomic, strong) NSString *resourceId;

@property (nonatomic, strong) NSString *thumbnail;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *resourceTitle;

@property (nonatomic, strong) NSString *resourceNum;

@property (nonatomic, strong) NSString *compere;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *img297_194;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *isYss;

@property (nonatomic, strong) NSString *downloadNumShow;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *programLogo;

@property (nonatomic, strong) NSString *img180_240;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *subscribesNumShow;

@property (nonatomic, strong) NSString *img130_130;

@property (nonatomic, strong) NSString *playerBackground;

@end
