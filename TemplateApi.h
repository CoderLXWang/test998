//
//  TemplateApi.h
//  tanpuyun
//
//  Created by wealthgrow on 2020/6/18.
//  Copyright © 2020 qimeng. All rights reserved.
//

#import "SJBaseRequest.h"

@interface TemplateApi : SJBaseRequest<SJBaseRequestDelegate, SJBaseRequestParamDelegate, SJBaseRequestHeaderDelegate>

/** 是否为读取新数据(对应下拉刷新) */
@property (nonatomic,assign) BOOL isLoadNew;
/** 是否为最后一页 */
@property (nonatomic,assign) BOOL isLastPage;

@property (nonatomic, copy) NSArray<<#ModelClass#> *> *dataArray;

@end

