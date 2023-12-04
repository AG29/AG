//
//  ViewController.h
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *newsTableView;


@end

