//
//  ENCalcController.h
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ENCalcModel.h"

@interface ENCalcController : NSObject

@property BOOL negate;
@property ENCalcModel * calcModel;

-(int)readInput:(ENEntities *)entity;
-(void)operationProcessingWithEntity:(ENEntities*)entity;
-(void)compliteProcessing;

@end