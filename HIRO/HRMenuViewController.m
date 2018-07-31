//
//  ViewController.m
//  HIRO
//
//  Created by Gabe Jacobs on 6/15/18.
//  Copyright © 2018 Gabe Jacobs. All rights reserved.
//

#import "HRMenuViewController.h"
#import "HRCameraSceneViewController.h"
#import "HRBookPageViewController.h"


@interface HRMenuViewController ()

@end

@implementation HRMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)[UIColor colorWithRed:0.43 green:0.84 blue:0.93 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.13 green:0.58 blue:0.69 alpha:1.0].CGColor];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"Hiro";
    self.titleLabel.font = [UIFont fontWithName:@"Noteworthy-Light" size:135.0f];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake(self.view.frame.size.width/2 - self.titleLabel.frame.size.width/2 , 125, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    [self.view addSubview:self.titleLabel];
    
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startButton.backgroundColor = [UIColor colorWithRed:0.24 green:0.47 blue:0.85 alpha:1.0];
    self.startButton.imageView.layer.cornerRadius = 7.0f;
    self.startButton.layer.shadowOffset = CGSizeMake(0, 7);
    self.startButton.layer.shadowRadius = 5;
    self.startButton.layer.shadowOpacity = 0.25;
    self.startButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.startButton.layer.masksToBounds = NO;
    self.startButton.frame = CGRectMake(self.view.frame.size.width/2 - 110, self.view.frame.size.height/2 + 30, 220, 90);
    [self.startButton addTarget:self action:@selector(tappedStart) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.startButton];
    
    self.viewVideosButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.viewVideosButton.backgroundColor = [UIColor colorWithRed:0.24 green:0.47 blue:0.85 alpha:1.0];
    self.viewVideosButton.imageView.layer.cornerRadius = 7.0f;
    self.viewVideosButton.layer.shadowOffset = CGSizeMake(0, 7);
    self.viewVideosButton.layer.shadowRadius = 5;
    self.viewVideosButton.layer.shadowOpacity = 0.25;
    self.viewVideosButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.viewVideosButton.layer.masksToBounds = NO;
    self.viewVideosButton.frame = CGRectMake(self.view.frame.size.width/2 - 110, self.startButton.frame.origin.y + self.startButton.frame.size.height + 50, 220, 90);
    [self.viewVideosButton addTarget:self action:@selector(tappedView) forControlEvents:UIControlEventTouchUpInside];
    [self.viewVideosButton setTitle:@"VIEW VIDEO" forState:UIControlStateNormal];
    self.viewVideosButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.viewVideosButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.viewVideosButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tappedStart {
//    HRBookPageViewController *pageOne = [[HRBookPageViewController alloc] init];
//    [self.navigationController pushViewController:pageOne animated:YES];

        HRCameraSceneViewController *cameraPage = [[HRCameraSceneViewController alloc] init];
        [self.navigationController pushViewController:cameraPage animated:YES];


}

- (void)tappedView {
    
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}



//-(BOOL)shouldAutorotate {
//    return NO;
//}
@end
