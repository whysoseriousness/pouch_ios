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
    
    NSString * pc = [[self.page_content stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""] stringByReplacingOccurrencesOfString:@"\\\\" withString:@"\\"];
    pc = [NSString stringWithFormat:@"<br /><center><h3>%@</h3></center><hr /><br /><div style = \"'font-family: 'HelveticaNeue-UltraLight', 'Helvetica Neue UltraLight', 'Helvetica Neue', Arial, Helvetica, sans-serif;\">%@</div>", self.article_title, pc];
//    [[UINavigationBar appearance] setTitle:self.article_title];
    [self.webView loadHTMLString:pc baseURL:nil ];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
