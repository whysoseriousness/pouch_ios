//
//  ViewController.h
//  pouch_ios
//
//  Created by Joshua Martin on 8/4/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSString *page_content;
@property (strong, nonatomic) NSString *article_title;
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end
