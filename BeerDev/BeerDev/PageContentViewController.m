//
//  PageContentViewController.m
//  pageViewController
//
//  Created by Maxim Frisk on 2014-04-04.
//  Copyright (c) 2014 Maxim Frisk. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController (){

    NSMutableArray * JsonDataArray; 
    
    
}
@end

@implementation PageContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)ifSwipe:(id)sender {
    NSLog(@"hello you swiped up, we will use this function later for adding a subview with information");
    
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
   
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://beerdev.tk/json_products.php"]];
    _jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    // Do any additional setup after loading the view.
    //  self.ImageBottle.image = self.bilden;
    
    self.aLabel.text = _titleText;
    [self startDownload:(int)_pageIndex];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma download connection
- (void)startDownload:(int)index{
    self.activeDownload = [NSMutableData data];
   // NSLog(@"%@",[_jsonObjects[index] objectForKey:(NSString*)@"URL"]);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[_jsonObjects[index] objectForKey:(NSString*)@"URL"]]];
    
    // alloc+init and start an NSURLConnection; release on completion/failure
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.imageConnection = conn;
}

- (void)cancelDownload
{
    [self.imageConnection cancel];
    self.imageConnection = nil;
    self.activeDownload = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.activeDownload appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	// Clear the activeDownload property to allow later attempts
    self.activeDownload = nil;
    // Release the connection now that it's finished
    self.imageConnection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
        // Add code here to update the UI/send notifications based on the
        // results of the background processing
  
    // Set appIcon and clear temporary data/image
    UIImage *image = [[UIImage alloc] initWithData:self.activeDownload];
    NSLog(@"finsihed");
    
    self.ImageBottle.image = image;
    self.activeDownload = nil;
    
    // Release the connection now that it's finished
    self.imageConnection = nil;
    
    // call our delegate and tell it that our icon is ready for display
    if (self.completionHandler)
        self.completionHandler();

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
