//
//  ViewController.m
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import "ViewController.h"
#import "NewsFeedViewModel.h"
#import "NewsTableCell.h"
#import "DetailViewControler.h"

@interface ViewController ()
@property (nonatomic,strong) NewsFeedViewModel *viewModel;
@end

@implementation ViewController
@synthesize viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;
    viewModel = [NewsFeedViewModel new];
    [viewModel newsAPICallCompletionHandler:^(bool success) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
            [self.newsTableView reloadData];
            });
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [viewModel.newsViewModelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"newsCell";
    NewsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NewsCellModel *cellModel = [viewModel newsViewModelForIndex:(int)indexPath.row];
   if (cellModel != nil)
    [cell cellModel:cellModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsCellModel *cellModel = [viewModel newsViewModelForIndex:(int)indexPath.row];
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    DetailViewControler * vc = [storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
    vc.url = cellModel.url;
    vc.imageUrl = cellModel.imageUrl;
    vc.content = cellModel.content;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
