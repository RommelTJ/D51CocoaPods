//
//  ViewController.m
//  D51CocoaPods
//
//  Created by Rommel Rico on 2/17/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

#import "ViewController.h"

#define MAX_COUNT 10

@interface ViewController ()

@property int myCount;
@property NSTimer *myTimer;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;
@property (weak, nonatomic) IBOutlet UIButton *myDownloadFileButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doDownloadFile:(id)sender {
    self.myDownloadFileButton.enabled = NO;
    self.myCount = 0;
    [self updateDisplay];
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(doTimer) userInfo:nil repeats:YES];
}

- (void)doTimer {
    self.myCount++;
    [self updateDisplay];
    if(self.myCount == MAX_COUNT) {
        [self.myTimer invalidate]; //Stop the timer.
        self.myDownloadFileButton.enabled = YES;
    }
}

- (void)updateDisplay {
    float progress = self.myCount / MAX_COUNT;
    self.myLabel.text = [NSString stringWithFormat:@"%1.2f", progress];
    self.myProgressView.progress = progress;
}

@end
