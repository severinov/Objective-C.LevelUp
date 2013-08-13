//
//  ENCalcModel.h
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ENEntities.h"

@interface ENCalcModel : NSObject

@property ENEntities * entity;
@property NSMutableArray * stackOfResult;
@property NSMutableArray * stackOfOperations;


-(void)insertInResult:(ENEntities *)digit atIndex:(NSUInteger)index;
-(void)addInResult:(ENEntities *)digit;
-(ENEntities *)digitAtIndexOfResult:(NSUInteger)index;

-(void)insertOperation:(ENEntities *)operation atIndex:(NSUInteger)index;
-(void)addOperation:(ENEntities *)operation;
-(ENEntities *)operationAtIndex:(NSUInteger)index;





@end
