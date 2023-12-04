//
//  NewsFeedViewModel.m
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import "NewsFeedViewModel.h"
#import "News.h"

@implementation NewsFeedViewModel
@synthesize newsViewModelArray;

- (instancetype)init {
    if (self = [super init] ) {
    newsViewModelArray = [[NSMutableArray alloc] initWithCapacity:100];
        return self;
    }
    return nil;
}

-(void)newsAPICallCompletionHandler:(void (^)(_Bool success))completionHandler {
    
    NSString *stringURL = @"https://newsapi.org/v2/everything?domains=wsj.com&apiKey=cf5b10230cb64417acae94cdebe5923a";
        NSURL *url = [NSURL URLWithString:stringURL];
    
    __block NSMutableArray *newsArray = newsViewModelArray;
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data) {
                NSError* error;
                NSDictionary* jsonDict = [ NSJSONSerialization
                  JSONObjectWithData: data
                  options: kNilOptions
                  error: &error ];
                //NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
               // dispatch_async(dispatch_get_main_queue(), ^{
                    NSArray* newsFromJson = jsonDict[@"articles"];
                        for (NSDictionary* articleFromJson in newsFromJson) {
                            News *article = [News new];
                            [articleFromJson[@"title"] isKindOfClass:[NSString class]]? article.headline = articleFromJson[@"title"]: @"";
                            [articleFromJson[@"description"] isKindOfClass:[NSString class]]? article.desc = articleFromJson[@"description"]:@"";
                            [articleFromJson[@"url"] isKindOfClass:[NSString class]]? article.url = articleFromJson[@"url"]:@"";
                            [articleFromJson[@"urlToImage"] isKindOfClass:[NSString class]] ? article.imageUrl = articleFromJson[@"urlToImage"]:@"";
                            [articleFromJson[@"publishedAt"] isKindOfClass:[NSString class]]?article.publishedDate = articleFromJson[@"publishedAt"]:@"";
                            [articleFromJson[@"content"] isKindOfClass:[NSString class]]? article.content = articleFromJson[@"content"]:@"";
                            NSLog(@"Article Content === %@", article.content);
                            [newsArray addObject:article];
                        }
                NSLog(@"Total Array Count === %lu", (unsigned long)newsArray.count);
                    completionHandler(YES);
                //});
            } else if (error){
                completionHandler(NO);
            } else {
                completionHandler(NO);
            }
        }];

        [task resume];
    
}


-(NewsCellModel *)newsViewModelForIndex:(int)Index {
    if (self.newsViewModelArray.count > Index)
    return [[NewsCellModel alloc] initWithNewsCellModel:self.newsViewModelArray[Index]] ?: nil;
    else
        return nil;
        
}


@end
