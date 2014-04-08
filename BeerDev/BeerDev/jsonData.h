//
//  jsonData.h
//  pageViewController
//
//  Created by Maxim Frisk on 2014-04-08.
//  Copyright (c) 2014 Maxim Frisk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jsonData : NSObject
/**
 * Calling this method will connect to the server and get the JSON file. Doing this sets the NSMutable Array
 * @author Maxim Frisk
 *  * @return JSON NSMutableArray
 */
+(void)setJSON;

/**
 * Get the array that contains the JSON array file
 * @author Maxim Frisk
 *  * @return JSON NSMutableArray
 */
+(NSMutableArray*)GetArray;

/**
 * Saves an NSMutableArray in NSUserDefaults for a key
 * @author Maxim Frisk
 * @param NSMutableArray The NSMutableArray to save
 * @param NSString Key for the entry
 * @return nothing
 */
+(void)setArrayForKey:(NSMutableArray*)jsonData forKey:(NSString*)key;

/**
 * Gets an NSMutableArray from NSUserDefaults for the given key
 * @author Maxim Frisk
 * @param NSString Key for the item to get from NSUserDefaults
 * @return the NSMutableArray
 */
+(NSMutableArray*)getJsonArray:(NSString*)key;

/**
 * This method is for setting the array from memory insteed of calling the setJSON method.
 * @author Maxim Frisk
 * @param NSMutableArray
 * @return nothing
 */
+(void)setArrayWithoutJSON:(NSMutableArray*)array;

@end
