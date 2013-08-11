//
//  NSMutableArray+DDSStack.h
//  GitWelcome
//
//  Created by Yevgen Iliashchienko on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (DDSStack)
-(void) push:(id)itemToPush;
-(id) pop;
-(id) peek;
@end
