//
//  ViewController.m
//  上移动画
//
//  Created by 海尔智能-李松 on 16/9/28.
//  Copyright © 2016年 海尔智能-李松. All rights reserved.
//

#import "ViewController.h"
#import "TTTAttributedLabel.h"
#import "TableViewCell.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *_headerImageView;
    UIImageView *_userImageView;
    UITableView *_tableView;
    NSArray     *_stringArr;
    UIView     *_navgationView;
    UILabel    *_titleLabeel;
    CGFloat    _offset_Y;
    UIImageView *_navImageView;
}

@end

#define kScreenSize [UIScreen mainScreen].bounds.size
#define kHeaderViewH 280

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _stringArr = @[@"金庸小说，杨过是数一数二的风流少年，程英、陆无双、公孙绿萼，有一个算一个，谁也过不去他这道坎儿，郭襄更是。",
                   @"郭襄生日当天，杨过亲自送来三件贺礼，两千只蒙古人的耳朵，烧掉蒙古粮草奉上烟花，除掉丐帮的奸细，献上打狗棍。这样的手笔，很“杨过”。",
                   @"自此“一见杨过误终身”",
                   @"也就是在那一天，郭襄用手帕为一个少年包扎头上的伤口，这是张三丰第一次见到郭襄，当时他还是一个叫张君宝的俗家弟子，没有人知道这个瘦骨棱棱的少年，有朝一日会成为一代宗师。",
                   @"郭襄永远不会忘记，风陵渡口杨过揭下面具的那一刻，不会忘记杨过拉着她的手捕捉灵狐的时候，更不会忘记十六岁生日那天，杨过送给她的漫天烟花。于是后来她的弟子名唤风陵师太，峨眉派一招武功名唤“黑沼灵狐”。",
                   @"郭襄终究没有找到杨过，实则，她真的找不到吗，恐怕并不是，她只是把不愿寻到装作寻不到吧。寻到了又如何，杨过和小龙女神仙眷侣，她十六岁时不就已经明白了，“此事绝不能够”。十六岁的情愫还是留在十六岁的梦里比较好，就像十六岁的烟花，绽放过，绚烂过，留不住，忘不掉。",
                   @"如此这般，倒成就了两派武学大宗，不知幸与不幸。",
                   @"最后的最后，祝愿所有读到此文的人，此生遇到的都是黄蓉或郭靖，而非杨过或郭襄，此生携手走过的所有岁月都是因为爱情，而非将就。",
                   @"我们从小到大接受过太多模式化的教育，其中一个定律是“努力学习就会有好成绩，努力工作就会有好业绩”，或许是吧，但这个定律对爱情无效。",
                   @"张三丰不好么？张三丰也很好，根骨好，悟性好，果敢坚毅，有主见、有筹谋，开门立派的一代宗师自然是过人的，待他三十六岁时拿出来和杨过比，恐怕难分高下，可是有用吗？",
                   @"张三丰记得“郭襄眼中泪光莹莹，心下大是奇怪，不知她为甚么伤心，道谢的言辞竟此便说不出口。”"];
    
    // Do any additional setup after loading the view, typically from a nib.
    _headerImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, kScreenSize.width, kHeaderViewH ))];
    _headerImageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:_headerImageView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height) style:(UITableViewStylePlain)];
    _tableView.backgroundColor = [UIColor clearColor];
    UIView *header = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenSize.width, kHeaderViewH))];
    _tableView.tableHeaderView = header;
    _tableView.separatorColor = [UIColor whiteColor];
    _tableView.delegate = self;
    
    
    
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _userImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(kScreenSize.width - 110, 220, 100, 130))];
    _userImageView.image = [UIImage imageNamed:@"3.jpg"];
    _userImageView.contentMode = UIViewContentModeScaleAspectFill;
    _userImageView.clipsToBounds = YES;
    [_tableView addSubview:_userImageView];

    
    _navgationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 64)];
    _navgationView.backgroundColor = [UIColor orangeColor];
    _navgationView.alpha = 0;
    _navgationView.clipsToBounds = YES;
    [self.view addSubview:_navgationView];
    
    _navImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(kScreenSize.width - 44, 64, 34, 34))];
    _navImageView.image = [UIImage imageNamed:@"3.jpg"];
    _navImageView.layer.cornerRadius = 17;
    _navImageView.hidden = YES;
    _navImageView.contentMode = UIViewContentModeScaleAspectFill;
    _navImageView.clipsToBounds = YES;
    [_navgationView addSubview:_navImageView];
    
    _titleLabeel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, kScreenSize.width, 30)];
    _titleLabeel.textAlignment = NSTextAlignmentCenter;
    _titleLabeel.text = @"金庸传奇";
    [_navgationView addSubview:_titleLabeel];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _stringArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cellid";
    TableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        
        if (indexPath.row < 1) {
            cell = [[TableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellid withString:@"\n作者：全肃"];
        }else{
            cell = [[TableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellid withString:_stringArr[indexPath.row]] ;
        }
        
    }
    

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = _stringArr[indexPath.row];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];//自定义str和TTTAttributedLabel一样的行间距
    NSMutableParagraphStyle *paragrapStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrapStyle setLineSpacing:6];//设置行间距
    [attrString addAttribute:NSParagraphStyleAttributeName value:paragrapStyle range:NSMakeRange(0, str.length)];
    //设置字体
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Lao Sangam MN" size:14] range:NSMakeRange(0, str.length)];
    //得到自定义行间距的UILabel的高度
    CGFloat height = [TTTAttributedLabel sizeThatFitsAttributedString:attrString withConstraints:CGSizeMake(kScreenSize.width - 20, MAXFLOAT) limitedToNumberOfLines:0].height;
    return height;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    
   
    _headerImageView.frame = CGRectMake(0, -offsetY / 2.0, kScreenSize.width, kHeaderViewH);
    
    _navgationView.alpha = offsetY / (280.0 - 64);

    if (offsetY > (280 - 64) && offsetY < (280 - 64) + 39) {
        _titleLabeel.frame = CGRectMake(0, 280 - offsetY, kScreenSize.width, 30);
    }else if (offsetY > (280 - 64) + 39 && offsetY < (280 - 64) + 50){
        _titleLabeel.frame = CGRectMake(0, 25, kScreenSize.width, 30);
    }
    
    if (offsetY < (280 - 64*2)) {
        
        
        
        _navImageView.hidden = YES;
    }
    
    if (offsetY > (280 - 64*2) && offsetY < (280 - 64*2) + 39 ) {
        _navImageView.hidden = NO;
        _navImageView.frame = CGRectMake(kScreenSize.width - 44, (280 - 64) - offsetY, 34, 34);
    }else if (offsetY > (280 - 64*2) + 39){
        _navImageView.frame = CGRectMake(kScreenSize.width - 44, 23, 34, 34);
    }

    
    if (offsetY < 30 && offsetY > 0) {
        _userImageView.frame = CGRectMake(kScreenSize.width - 110, 220, 100, 130 - offsetY);
        _userImageView.layer.cornerRadius = offsetY;
    }else if (offsetY < 80 && offsetY > 30){
        _userImageView.frame = CGRectMake(kScreenSize.width - 110 -  10 + offsetY, 220, 100 - offsetY +10, 100 - offsetY+10);
        _userImageView.layer.cornerRadius = (110 - offsetY) / 2.0;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    }


@end
