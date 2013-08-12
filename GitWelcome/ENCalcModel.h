//
//  ENCalcModel.h
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ENCalcModel : NSObject


@property NSMutableArray * stackOfResult;
@property NSMutableArray * stackOfOperations;



-(void)insertInResult:(id)digit atIndex:(NSUInteger)index;
-(void)addInResult:(id)digit;
-(id)digitAtIndexOfResult:(NSUInteger)index;

-(void)insertOperation:(id)operation atIndex:(NSUInteger)index;
-(id)operationAtIndex:(NSUInteger)index;





@end
