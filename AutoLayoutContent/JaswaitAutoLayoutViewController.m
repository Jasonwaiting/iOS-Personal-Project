//
//  JaswaitAutoLayoutViewController.m
//  AutoLayoutContent
//
//  Created by Jasonwaiting on 29/4/14.
//  Copyright (c) 2014 jasonwaiting. All rights reserved.
//

#import "JaswaitAutoLayoutViewController.h"
#import "JaswaitAutoLayoutView.h"

@interface JaswaitAutoLayoutViewController ()

@end

@implementation JaswaitAutoLayoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    self.view = [[JaswaitAutoLayoutView alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
