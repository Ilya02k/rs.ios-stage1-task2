#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function

NSString* intToString(int digits) {
    NSArray *fArray = [NSArray arrayWithObjects:  @"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight" , @"nine",  @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", nil];
    NSArray *sArray = [NSArray arrayWithObjects:  @"", @"", @"twenty", @"thirty", @"fourty", @"fifty", @"sixty", @"seventy", @"eighty", @"ninety", nil];
    NSString* res = @"";
    if (digits < 20) {
        res = fArray[digits];
    } else if (digits < 100) {
        int g = digits % 10;
        int k = (digits - g) / 10;
        if (g == 0) {
            res = [sArray[k] stringValue];
        } else {
            res = [[sArray[k] stringByAppendingString:@" "] stringByAppendingString: fArray[g]];
        }
    }
    return res;
}




- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSString *result=@"";
    int hourForWork=[hours intValue];
    int minutesForWork=[minutes intValue];
    
    
    if(hourForWork>0&&hourForWork<=12&&minutesForWork>=0&&minutesForWork<60)
    {
        if(minutesForWork==0)
        {
            result=[intToString(hourForWork) stringByAppendingString:@" o' clock"];
        }
        else if(minutesForWork==15)
        {
            result=[@"quarter past " stringByAppendingString: intToString(hourForWork) ];
        }
        else if(minutesForWork<30)
        {
            result = [[intToString (minutesForWork) stringByAppendingString: @" minutes past "] stringByAppendingString: intToString (hourForWork)];
        }
        else if(minutesForWork==30)
        {
            result =  [@"half past " stringByAppendingString: intToString (hourForWork)];
        }
        else if (minutesForWork == 45) {
                   result =  [@"quarter to " stringByAppendingString: intToString (hourForWork + 1)];
        }
        else if(minutesForWork>30)
        {
            result = [[intToString (60 - minutesForWork) stringByAppendingString: @" minutes to "] stringByAppendingString: intToString (hourForWork + 1)];
            }
        
    
    }
    return result;
}
@end
