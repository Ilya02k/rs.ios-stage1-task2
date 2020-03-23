#import "NSString+Transform.h"

#import "NSString+Transform.h"

@implementation NSString (Transform)

bool isEveryChar(NSSet *characters, NSString *sstring ) {
    for (NSString *chr in characters) {
        if (![[sstring uppercaseString] containsString:[chr uppercaseString]]) {
            return false;
        }
    }
    return true;
}

int charCounter(NSSet *characters, NSString *sstring ) {
    int res = 0;
    for (int u = 0; u < sstring.length; u++) {
        NSString *m = [sstring substringWithRange:NSMakeRange(u, 1)];
        if ([characters containsObject:[m lowercaseString]]) {
            res++;
        }
    }
    return res;
}

NSString* transformPangrams(NSString *source) {
    NSSet *vowels = [[NSSet alloc] initWithObjects:@"a", @"e", @"i", @"o", @"u", @"y", nil];
    NSSet *consonants = [[NSSet alloc] initWithObjects: @"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v", @"w", @"x", @"z", nil];
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern: @"\\s{2,}+" options:NSRegularExpressionCaseInsensitive error: &error];
    source = [[regex stringByReplacingMatchesInString: source options: 0 range: NSMakeRange(0, [source length]) withTemplate: @" "] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    NSArray *words = [source componentsSeparatedByString:@" "];
    bool isPangram = isEveryChar(vowels, source) && isEveryChar(consonants, source);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (NSString *chr in words) {
        if (![chr isEqualToString:@""]){
            NSNumber * count = [NSNumber numberWithInt: charCounter(isPangram ? vowels : consonants, chr)];
            id v = [dict objectForKey: count];
            NSString *newChr = @"";
            for (int u = 0; u < chr.length; u++) {
                NSString *m = [chr substringWithRange:NSMakeRange(u, 1)];
                if (isPangram && [vowels containsObject:m]) {
                    newChr = [newChr stringByAppendingString: [m uppercaseString]];
                } else if (!isPangram && [consonants containsObject:m]) {
                    newChr = [newChr stringByAppendingString: [m uppercaseString]];
                } else {
                    newChr = [newChr stringByAppendingString: m];
                }
            }
            if (v == nil) {
                NSMutableArray * a = [[NSMutableArray alloc] initWithObjects:newChr, nil];
                [dict setObject:a forKey:count];
            } else {
                [v addObject: newChr];
            }
        }
    }
    NSArray *sortedKeys = [dict.allKeys sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    NSArray *sortedValues = [dict objectsForKeys:sortedKeys notFoundMarker:@""];
    NSString *dest = @"";
    for (int i = 0; i < sortedValues.count; i++) {
        NSArray *arr = sortedValues[i];
        for (int j = 0; j < arr.count; j++) {
            NSString *chr = arr[j];
            if (![dest isEqualToString:@""]) {
                dest = [dest stringByAppendingString:@" "];
            }
            dest = [dest stringByAppendingString: [sortedKeys[i] stringValue]];
            dest = [dest stringByAppendingString:chr];
        }
    }
    return dest;
}

-(NSString*)transform {
    return transformPangrams(self);
}

@end
