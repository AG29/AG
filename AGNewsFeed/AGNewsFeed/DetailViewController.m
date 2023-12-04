//
//  DetailViewController.m
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import "DetailViewControler.h"

@interface DetailViewControler ()

@end

@implementation DetailViewControler
@synthesize url,imageUrl,content;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.newsURLLabel.text = self.url;
    self.contentTextView.text = self.content;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:self.imageUrl]];
        if ( data == nil || [data length] < 1)
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            self.newsImage.image = [UIImage imageWithData: data];
        });
    });
}


@end
