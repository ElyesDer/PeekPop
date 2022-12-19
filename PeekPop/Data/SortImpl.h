//
//  SortImpl.h
//  PeekPop
//
//  Created by Derouiche Elyes on 19/12/2022.
//
#import <Foundation/Foundation.h>

#ifndef SortImpl_h
#define SortImpl_h

@class Recipe;

@interface ArraySorter: NSObject

- (NSArray *)sortRecipes:(NSMutableArray<Recipe *> *)sortedArray;

@end

#endif /* SortImpl_h */
