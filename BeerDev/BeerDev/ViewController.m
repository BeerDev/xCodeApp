//
//  ViewController.m
//  BeerDev
//
//  Created by Maxim Frisk on 2014-03-28.
//  Copyright (c) 2014 beerDev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    BOOL Switched;

    UIImage * bild;
    
    DataHolder * dataholding;

}
@property (weak, nonatomic) IBOutlet UIImageView *test;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dataholding = [DataHolder alloc];
    [dataholding jsonData];
    
    //HEJ HEJ HEJ
      //  [_test setImage:[dataholding cacheThoseImages]];
   // bild = [UIImage imageNamed:@"test.png"];
	// Do any additional setup after loading the view, typically from a nib.
   //Test/Emma
    //test jesper
    // Lina!
    //hej alla! /maxim

    
}
- (IBAction)mySwitch:(id)sender {
    if(Switched == NO){
        Switched = YES;
     _testField.text = @"off";
    }else if (Switched ==YES){
        Switched = NO;
     _testField.text = @"on";
          }
}

- (IBAction)push:(id)sender {
     _testField.text = @"you pushed the button";
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
