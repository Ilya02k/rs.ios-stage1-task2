#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"d MMMM, EEEE";
    formatter.locale=[NSLocale localeWithLocaleIdentifier:@"ru"];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    
    components.day = [day integerValue];
    components.month = [month integerValue];
    components.year = [year integerValue];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if([components isValidDateInCalendar:calendar])
    {
   // NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *curDate = [calendar dateFromComponents:components];
    return [formatter stringFromDate:curDate];
    }
    else
    {
       return @"Такого дня не существует";
    }
}

@end
