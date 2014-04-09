//
//  PageContentViewController.h
//  pageViewController
//
//  Created by Maxim Frisk on 2014-04-04.
//  Copyright (c) 2014 Maxim Frisk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jsonData.h"
#import "PageContentViewController.h"

@interface PageContentViewController : UIViewController

@property (strong, nonatomic) UIViewController * PageContentViewController;
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UILabel *artikelnamnLabel;
@property NSUInteger pageIndex;


//connection functions from NSURLConnection. 
@property (nonatomic,retain) NSMutableArray* jsonObjects;
@property (nonatomic, copy) void (^completionHandler)(void);
@property (nonatomic, strong) NSMutableData *activeDownload;
@property (nonatomic, strong) NSURLConnection *imageConnection;

@end
