//
//  ViewController.m
//  BeerDev
//
//  Created by Maxim Frisk on 2014-03-28.
//  Copyright (c) 2014 beerDev. All rights reserved.
//

#import "ViewController.h"

<<<<<<< HEAD
@interface ViewController ()
=======
@interface ViewController (){
    //declare variables here to be global thru this class
    
}
>>>>>>> FETCH_HEAD

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"did the application load?!");

	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)push:(id)sender {
    _testField.text = @"you pushed the button";
}

    NSArray * testArray = [jsonData GetArray];
    NSLog(@"%@",testArray[0]);
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
