//
//  SortImpl.m
//  PeekPop
//
//  Created by Derouiche Elyes on 19/12/2022.
//

#import <Foundation/Foundation.h>
#import "PeekPop-Swift.h"
#import "SortImpl.h"


@implementation ArraySorter

- (NSArray *)sortRecipes:(NSMutableArray<Recipe *> *)sortedArray
{
    for (int i = 0; i < [sortedArray count] - 1; i++) {
        for (int j = 0; j < [sortedArray count] - i - 1; j++) {
            if (sortedArray[j + 1].note > sortedArray[j].note) {
                [sortedArray exchangeObjectAtIndex:(j) withObjectAtIndex:j + 1];
            } else if (sortedArray[j + 1].note == sortedArray[j].note) {
                if (sortedArray[j + 1].requiredTime > sortedArray[j].requiredTime) {
                    [sortedArray exchangeObjectAtIndex:(j) withObjectAtIndex:j + 1];
                } else if (sortedArray[j + 1].requiredTime == sortedArray[j].requiredTime) {
                    if (sortedArray[j + 1].name < sortedArray[j].name) {
                        [sortedArray exchangeObjectAtIndex:(j) withObjectAtIndex:j + 1];
                    }
                }
            }
        }
    }
    return sortedArray;
}

@end
