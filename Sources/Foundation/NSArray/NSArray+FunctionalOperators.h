//
//  NSArray+FunctionalOperators.h
//  Catalog
//
//  Created by Nikola Majcen on 13/05/2019.
//  Copyright © 2019 Infinum. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<__covariant T: id> (FunctionalOperators)

/**
 Returns an array containing the results of mapping the given
 closure over the sequence's elements.
 */
- (NSArray<id> *)map:(id _Nonnull (^)(T _Nonnull obj))block;

/**
 Returns an array containing the concatenated results of calling
 the given transformation with each element of this sequence.
 */
- (NSArray<id> *)flatMap:(id (^)(T _Nonnull obj))block;

/**
 Calls the given closure on each element in the sequence
 in the same order as @p for-in loop.
 */
- (void)forEach:(void (^)(T _Nonnull obj))block;

/**
 Returns an array containing in order, the elements of the
 sequence that satisfy the given predicate.
 */
- (NSArray<T> *)filter:(BOOL (^)(T _Nonnull obj))block;

/**
 Returns the result of combining the elements of the sequence
 using the given closure.
 */
- (id)reduce:(id)initial block:(id (^)(T _Nonnull acc, T _Nonnull obj))block;

@end

NS_ASSUME_NONNULL_END
