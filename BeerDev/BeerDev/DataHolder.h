//
//  DataHolder.h
//  BeerDev
//
//  Created by Maxim Frisk on 2014-04-07.
//  Copyright (c) 2014 beerDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "constans.h"

@interface DataHolder : NSObject


-(void)jsonData;

@property (assign) NSMutableArray* jsonObjects;
@property (assign) NSMutableArray* cachedImages;


@property (nonatomic, copy) void (^completionHandler)(void);
@property (nonatomic, strong) NSMutableData *activeDownload;
@property (nonatomic, strong) NSURLConnection *imageConnection;

@end
