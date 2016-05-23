//
//  ViewController.m
//  TableViewStretchImage
//
//  Created by dengweihao on 16/5/20.
//  Copyright © 2016年 dengweihao. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+Color.h"

#define USER @"踏歌长行"

#define HeadViewHeight 200 // 头视图高度
#define SuspensionViewHeight 44 // 悬浮视图高度
#define HeadViewMinHeight 64 // HeadView最小高度

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** HeadView高度约束 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headHeightCons;
/** 导航栏标题 */
@property (nonatomic, weak) UILabel *userNameLabel;
/** 记录滚动视图最开始偏移量y值 */
@property (nonatomic, assign) CGFloat oriOffsetY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tableView数据源和代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // 设置导航条
    [self setUpNavigationBar];
    
    // 不需要自动调节滚动区域
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 记录最开始偏移量y值
    _oriOffsetY = -(HeadViewHeight + SuspensionViewHeight);
    
    // 设置tableView顶部额外滚动区域
    self.tableView.contentInset = UIEdgeInsetsMake(-_oriOffsetY, 0, 0, 0);
    
    // Do any additional setup after loading the view, typically from a nib.
}

/** 设置导航栏 */
- (void)setUpNavigationBar {
    // 传递一个空的UIImage,选择模式为UIBarMetricsDefault来设置导航栏背景为透明, 注意UIImage不能传nil, 如果传nil, 苹果会为你加载一张默认的不透明背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    // 清空导航条的阴影的线
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    // 设置导航条标题为透明
    UILabel *usernameLabel = [[UILabel alloc] init];
    usernameLabel.text = USER;
    // 设置文字的颜色
    usernameLabel.textColor = [UIColor colorWithWhite:1 alpha:0];
    // 根据文字大小自适应尺寸
    [usernameLabel sizeToFit];
    _userNameLabel = usernameLabel;
    
    [self.navigationItem setTitleView:_userNameLabel];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 获取当前偏移量y值
    CGFloat curOffsetY = scrollView.contentOffset.y;
    
    // 计算偏移量的差值
    CGFloat delta = curOffsetY - _oriOffsetY;
    
    // 计算头部视图的高度
    CGFloat h = HeadViewHeight - delta;
    if (h < HeadViewMinHeight) {
        h = HeadViewMinHeight;
    }
    
    // 修改HeadView高度
    _headHeightCons.constant = h;
    
    // 处理导航条业务逻辑
    
    // 计算透明度
    CGFloat alpha = delta / (HeadViewHeight - HeadViewMinHeight);
    
    if (alpha > 1) {
        alpha = 0.99;
    }
    
    // 设置导航条背景图片
    // 根据当前alpha值生成图片
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    // 设置导航条标题颜色
    _userNameLabel.textColor = [UIColor colorWithWhite:0 alpha:alpha];    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ident = @"detailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        cell.backgroundColor = [UIColor greenColor];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row];
    
    return cell;
}

@end
