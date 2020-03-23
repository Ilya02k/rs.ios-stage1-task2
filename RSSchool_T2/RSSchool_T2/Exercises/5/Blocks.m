#import "Blocks.h"

@implementation Blocks
{
    NSArray* _arrayOfClasses;
    BlockB _someClass;
}

- (BlockA)blockA {
    return [^(NSArray *parametrFromBlockA) {
        _arrayOfClasses = [parametrFromBlockA copy];
    } copy] ;
}

- (BlockB)blockB {
    return [^(Class parametrFromBlockB) {
        _someClass = [parametrFromBlockB copy];
        
        if ( parametrFromBlockB == [NSNumber class]) {
            int finalResult = 0;
            
            for (int i = 0; i < _arrayOfClasses.count; i++) {
                NSObject *element = _arrayOfClasses[i];
                if ([element isKindOfClass:parametrFromBlockB]) {
                    int firstResult = [(NSNumber *)element intValue];
                    finalResult += firstResult;
                }
            }
            
            NSNumber *result = [NSNumber numberWithInt:finalResult];
            self.blockC(result);
        }
        
        if ( parametrFromBlockB == [NSString class]) {
            NSMutableString *resultFinal = [[NSMutableString alloc] init];
            NSString *result = @"";
            
            for (int i = 0; i < _arrayOfClasses.count; i++) {
                NSObject *element = _arrayOfClasses[i];
                if ([element isKindOfClass:parametrFromBlockB]) {
                    [resultFinal appendString:(NSString *)element];
                }
            }
            result = resultFinal;
            self.blockC(result);
        }
        
        if ( parametrFromBlockB == [NSDate class]) {
            NSDate *previosDate = [NSDate dateWithTimeIntervalSince1970:0];
            
            for (int i = 0; i < _arrayOfClasses.count; i++) {
                NSObject *element = _arrayOfClasses[i];
                if ([element isKindOfClass:parametrFromBlockB]) {
                    switch ([previosDate compare:(NSDate *)element]) {
                        case NSOrderedAscending:
                            previosDate = (NSDate *)element;
                            break;
                        default:
                            break;
                    }
                }
            }
            
            NSDateFormatter *formatter = [NSDateFormatter new];
            [formatter setDateFormat:@"dd.MM.yyyy"];
            NSString *result = [formatter stringFromDate:previosDate];
            self.blockC(result);
        }
        
        
    } copy];
}

@end
