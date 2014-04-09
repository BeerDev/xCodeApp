//
//  DataHolder.m
//  BeerDev
//
//  Created by Maxim Frisk on 2014-04-07.
//  Copyright (c) 2014 beerDev. All rights reserved.
//

#import "DataHolder.h"

@implementation DataHolder


-(id)init {
    if (self = [super init]) {
        //init here
        //[self jsonData];

    }
    return self;
}

- (id) initWithCustomVar:(int)test
{
    // call -init on self, which will call -init on super for us, and set variables there
    self = [self init];
    if (!self) return nil;

    return self;
}

-(void)jsonData{
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://beerdev.tk/json_products.php"]];
    _jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",_jsonObjects);
    NSLog(@"%@",[_jsonObjects[0] objectForKey:@"URL"]);
  
   // NSURL *imageURL = [NSURL URLWithString:[_jsonObjects[0] objectForKey:(NSString*)@"URL"]];
   // UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:imageURL]];
    
    
    [self startDownload:0];
   // NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"test"]];
    
    //Note to self: If ID is change redo JSNdata.
}

- (void)startDownload:(int)index
{
    self.activeDownload = [NSMutableData data];
    
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
    // Set appIcon and clear temporary data/image
    UIImage *image = [[UIImage alloc] initWithData:self.activeDownload];
    
    self.employee.profileImage = image;
    
    self.activeDownload = nil;
    
    // Release the connection now that it's finished
    self.imageConnection = nil;
    
    // call our delegate and tell it that our icon is ready for display
    if (self.completionHandler)
        self.completionHandler();
}


/*
-(void)test{

NSString* imageName = [dict objectForKey:@"Image"];
//NSLog(@"url: %@", imageURL);

UIImage *image = [_imageCache objectForKey:imageName];

if(image)
{
    cell.imageView.image = image;
}
else
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString* imageURLString = [NSString stringWithFormat:@"example.com/%@", imageName];
        NSURL *imageURL = [NSURL URLWithString:imageURLString];
        UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:imageURL]];
        
        if(image)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                CustomCell *cell =(CustomCell*)[self.tableView cellForRowAtIndexPath:indexPath];
                if(cell)
                {
                    cell.imageView.image = image;
                }
            });
            [_imageCache setObject:image forKey:imageName];
        }
    });
}

cell.textLabel.text = [dict objectForKey:@"Name"];

return cell;
}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 static NSString *CellIdentifier = @"hallo";
 CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 if (cell == nil)
 {
 cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 }
 
 NSMutableArray *marr = [hallo objectAtIndex:indexPath.section];
 NSDictionary *dict = [marr objectAtIndex:indexPath.row];
 
 NSString* imageName = [dict objectForKey:@"Image"];
 //NSLog(@"url: %@", imageURL);
 
 UIImage *image = [_imageCache objectForKey:imageName];
 
 if(image)
 {
 cell.imageView.image = image;
 }
 else
 {
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
 
 NSString* imageURLString = [NSString stringWithFormat:@"example.com/%@", imageName];
 NSURL *imageURL = [NSURL URLWithString:imageURLString];
 UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:imageURL]];
 
 if(image)
 {
 dispatch_async(dispatch_get_main_queue(), ^{
 CustomCell *cell =(CustomCell*)[self.tableView cellForRowAtIndexPath:indexPath];
 if(cell)
 {
 cell.imageView.image = image;
 }
 });
 [_imageCache setObject:image forKey:imageName];
 }
 });
 }
 
 cell.textLabel.text = [dict objectForKey:@"Name"];
 
 return cell;
 }*/


@end
