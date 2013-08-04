//
//  ViewController.m
//  pouch_ios
//
//  Created by Joshua Martin on 8/4/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadHTMLString:self.page_content baseURL:nil ];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
