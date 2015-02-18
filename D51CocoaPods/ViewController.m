//
//  ViewController.m
//  D51CocoaPods
//
//  Created by Rommel Rico on 2/17/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

#import "ViewController.h"
#import <LDProgressView/LDProgressView.h>

#define MAX_COUNT 10

@interface ViewController ()

@property (weak, nonatomic) IBOutlet LDProgressView *myLDProgressViewDesignTime;
@property LDProgressView *myLDProgressViewRunTime;
@property int myCount;
@property NSTimer *myTimer;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;
@property (weak, nonatomic) IBOutlet UIButton *myDownloadFileButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect myRect = CGRectMake(20, 200, 200, 40); //Go right 20, down 200, width 200 height 40.
    self.myLDProgressViewRunTime = [[LDProgressView alloc] initWithFrame:myRect];
    self.myLDProgressViewRunTime.color = [UIColor redColor];
    [self.view addSubview:self.myLDProgressViewRunTime];
    
    self.myLDProgressViewDesignTime.color = [UIColor greenColor];
    
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
    float progress = (float)self.myCount / MAX_COUNT;
    self.myLabel.text = [NSString stringWithFormat:@"%1.2f", progress];
    self.myProgressView.progress = progress;
    
    self.myLDProgressViewRunTime.progress = progress;
    self.myLDProgressViewRunTime.labelProgress = progress;
    
    self.myLDProgressViewDesignTime.progress = progress;
    self.myLDProgressViewDesignTime.labelProgress = progress;
}

@end
