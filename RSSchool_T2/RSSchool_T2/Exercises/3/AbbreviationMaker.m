#import "AbbreviationMaker.h"

@implementation AbbreviationMaker

- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSString * source = [[[NSString alloc] initWithString:a] uppercaseString];
    for (int i = 0; i < b.length; i++) {
        while (i < source.length) {
            if (![[source substringWithRange:NSMakeRange(i, 1)] isEqualToString:[b substringWithRange:NSMakeRange(i, 1)]])
            {
                source = [[source substringWithRange:NSMakeRange(0, i)] stringByAppendingString: [source substringWithRange:NSMakeRange(i + 1, source.length - i - 1)]];
            }
            else {
                break;
            }
        }
    }
    if (source.length > b.length) {
        source = [source substringWithRange:NSMakeRange(0, b.length)];
    }
    if ([source isEqualToString:b]){
        return @"YES";
    }
    return @"NO";
}

@end
