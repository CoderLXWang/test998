//
//  TemplateApi.m
//  tanpuyun
//
//  Created by wealthgrow on 2020/6/18.
//  Copyright © 2020 qimeng. All rights reserved.
//

@implementation TemplateApi
{
    int page;//记录页码值
    int pageSize;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        page = 1;
        pageSize = <#size#>;
        self.paramSource = self;
        self.headerSource = self;
    }
    return self;
}

- (SJBaseRequestType)requestType {
    选择方式
    return SJBaseRequestTypePost;
    return SJBaseRequestTypeGet;
}


- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"%@<#url#>", [TPAPIConfig baseUrl]];
}

- (NSDictionary *)headersForRequest:(SJBaseRequest *)request {
    
    return nil;
}

-(NSDictionary*)paramsForRequest:(SJBaseRequest *)request
{
    NSMutableDictionary *mParams = [NSMutableDictionary dictionary];
    if(self.isLoadNew){ page = 1; }
    注意POST和GET分页参数不一样
    [mParams setPostPageWithNumber:page size:pageSize];
    [mParams setGetPageWithNumber:page size:pageSize];
    
    return [mParams copy];
}


-(void)beforePerformSuccessWithResponse:(SJResponse *)response
{
    [super beforePerformSuccessWithResponse:response];
    
    if (response.responseCodeSuccess) {
        self.dataArray = [<#ModelClass#> mj_objectArrayWithKeyValuesArray:response.result[@"<#key#>"]];
        self.<#model#> = [<#ModelClass#> mj_objectWithKeyValues:response.result];
        
        self.isLastPage = (pageSize > self.dataArray.count);
        if (!self.isLastPage) page++;
    }

    
    NSLog(@"<#描述#> %@", response.contentString);
}




@end
