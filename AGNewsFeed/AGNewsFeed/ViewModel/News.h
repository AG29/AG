//
//  News.h
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, strong) NSString *headline;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *publishedDate;
@property (nonatomic, strong) NSString *content;

@end
