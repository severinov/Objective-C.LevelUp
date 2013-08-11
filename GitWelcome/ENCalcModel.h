//
//  ENCalcModel.h
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ENCalcModel : NSObject


@property NSMutableArray * stackOfDigits;
@property NSMutableArray * stackOfOperations;
@property NSMutableString * stackOfResult;



-(void)insertDigit:(id)digit atIndex:(NSUInteger)index;
-(id)digitAtIndex:(NSUInteger)index;

-(void)insertOperation:(id)operation atIndex:(NSUInteger)index;
-(id)operationAtIndex:(NSUInteger)index;

-(void)insertResult:(id)result atIndex:(NSUInteger)index;
-(void)addResult:(id)result;
-(unichar)resultAtIndex:(NSUInteger)index;




@end
