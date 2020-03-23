#import "FibonacciResolver.h"

@implementation FibonacciResolver

int getNextFibonacci(int n, int n1) {
    return n + n1;
}

- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSMutableArray *fibo = [[NSMutableArray alloc] initWithObjects: @0, @1, nil];
    while ([fibo[fibo.count - 2] intValue] * [fibo[fibo.count - 1] intValue] < [number intValue]){
        NSNumber *next = [NSNumber numberWithInt: getNextFibonacci([fibo[fibo.count - 2] intValue], [fibo[fibo.count - 1] intValue])];
        [fibo addObject: next];
    }
    NSMutableArray *res = [[NSMutableArray alloc] initWithObjects: fibo[fibo.count - 2] , fibo[fibo.count - 1], nil];
    if ([fibo[fibo.count - 2] intValue] * [fibo[fibo.count - 1] intValue] == [number intValue]){
        [res addObject:@1];
    } else {
        [res addObject:@0];
    }
    return res;
}

@end
