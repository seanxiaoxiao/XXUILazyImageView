//
//  ViewController.m
//  XXUILazyImageView
//
//  Created by Xiao Xiao on 12/22/14.
//  Copyright (c) 2014 SeanLionheart. All rights reserved.
//

#import "ViewController.h"
#import "XXUILazyImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XXUILazyImageView *imageView = [[XXUILazyImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120) imageURL:[NSURL URLWithString:@"http://img1.wikia.nocookie.net/__cb20130703230219/bloonsconception/images/thumb/8/80/Yao-ming-face-meme.png/500px-Yao-ming-face-meme.png"]];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
