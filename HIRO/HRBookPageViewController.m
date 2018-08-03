//
//  HRBookPageViewController.m
//  HIRO
//
//  Created by Gabe Jacobs on 7/20/18.
//  Copyright © 2018 Gabe Jacobs. All rights reserved.
//

#import "HRBookPageViewController.h"
#import "FLAnimatedImage.h"

@interface HRBookPageViewController ()

@end

@implementation HRBookPageViewController

- (instancetype)initWithPage:(int)pageNumber {
    self = [super init];
    if (self) {
        self.pageNumber = pageNumber;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backgroundView = [[UIView alloc]  initWithFrame:self.view.frame];
    [self.view addSubview:self.backgroundView];
    self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"P%d-Back", self.pageNumber]]];
    
    [self.backgroundView addSubview:self.backgroundImage];
    
    [self performSelector:@selector(showText) withObject:nil afterDelay:0.8f];
    
//    self.view.backgroundColor = [UIColor redColor];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"bg-transparent" ofType:@"gif"];
//    NSURL *url = [NSURL fileURLWithPath:path];
//    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:url]];
//    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
//    imageView.animatedImage = image;
//    imageView.frame = CGRectMake(0.0, 0.0, 100.0, 100.0);
//    [self.view addSubview:imageView];
//

    self.nextPageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextPageButton setImage:[UIImage imageNamed:@"NextPage"] forState:UIControlStateNormal];
    self.nextPageButton.frame = CGRectMake(self.view.frame.size.width - 15 - [UIImage imageNamed:@"NextPage"].size.width, self.view.frame.size.height - 10 - [UIImage imageNamed:@"NextPage"].size.height, [UIImage imageNamed:@"NextPage"].size.width, [UIImage imageNamed:@"NextPage"].size.height);
    [self.nextPageButton addTarget:self action:@selector(tappedNextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextPageButton];
    
    self.prevPageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.prevPageButton setImage:[UIImage imageNamed:@"PrevPage"] forState:UIControlStateNormal];
    self.prevPageButton.frame = CGRectMake(15, self.view.frame.size.height - 10 - [UIImage imageNamed:@"PrevPage"].size.height, [UIImage imageNamed:@"PrevPage"].size.width, [UIImage imageNamed:@"PrevPage"].size.height);
    [self.prevPageButton addTarget:self action:@selector(tappedPrevPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.prevPageButton];

    
    // Do any additional setup after loading the view.
}

- (void)showText {
    self.pageText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"P%d-Text", self.pageNumber]]];
    self.pageText.alpha = 0.0;
    [self.backgroundImage addSubview:self.pageText];
    [UIView animateWithDuration:1.25 animations:^{
        self.pageText.alpha = 1.0;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tappedNextPage {
    HRBookPageViewController *pageOne = [[HRBookPageViewController alloc] initWithPage:self.pageNumber+1];
    [self.navigationController pushViewController:pageOne animated:YES];
}

- (void)tappedPrevPage {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
