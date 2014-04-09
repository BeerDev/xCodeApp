//
//  PageContentViewController.h
//  pageViewController
//
//  Created by Maxim Frisk on 2014-04-04.
//  Copyright (c) 2014 Maxim Frisk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jsonData.h"

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *ImageBottle;
@property (weak, nonatomic) IBOutlet UILabel *aLabel;


@property (nonatomic, strong) UIImage * bilden;
@property NSUInteger pageIndex;
@property NSString *titleText;

@property (nonatomic,retain) NSMutableArray* jsonObjects;
@property (nonatomic, copy) void (^completionHandler)(void);
@property (nonatomic, strong) NSMutableData *activeDownload;
@property (nonatomic, strong) NSURLConnection *imageConnection;

@end
