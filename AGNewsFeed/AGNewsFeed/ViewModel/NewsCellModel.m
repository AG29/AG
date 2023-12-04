//
//  News.m
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import "NewsCellModel.h"

@implementation NewsCellModel
@synthesize news,headline,desc,url,imageUrl,publishedDate,content;

-(instancetype)initWithNewsCellModel:(News*)news {
    self = [super init];
    self.news = news;
    return self;
}

- (NSString *)headline {
    return news.headline;
}

-(NSString *)desc {
    return news.desc;
}

-(NSString *)url {
    return news.url;
}

- (NSString *)imageUrl {
    return news.imageUrl;
}

- (NSString *)publishedDate {
    NSString *published = news.publishedDate;
    NSDateFormatter* dateFormatterGet = [NSDateFormatter new];
    dateFormatterGet.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

    NSDateFormatter* dateFormatterPrint = [NSDateFormatter new];
    dateFormatterPrint.dateFormat = @"MMM dd,yyyy";

    NSDate* date = [dateFormatterGet dateFromString:published];
        if (date != nil) {
            NSLog(@"Date = %@",[dateFormatterPrint stringFromDate:date]);
            return [dateFormatterPrint stringFromDate:date];
        } else {
            return nil;
        }
}

- (NSString *)content {
    
    NSString *unfilteredString = news.content;
    
    NSRange range= [unfilteredString rangeOfString: @" " options: NSBackwardsSearch];

    // Take the first substring: from 0 to the space character
    NSString* finalStr = [unfilteredString substringToIndex: range.location];
    
    NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"] invertedSet];
    NSString *resultString = [[finalStr componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@" "];
    
    
    return resultString;
}

@end
