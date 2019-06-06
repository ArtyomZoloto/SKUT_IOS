
#import "AZEmployee.h"

@implementation AZEmployee
-(NSString*) dateString {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd-MM-yyy"];
    return [dateFormatter stringFromDate:self.birthDate];
}

-(NSInteger) monthOfBirth {
    NSDateComponents *components = [[NSCalendar currentCalendar] components: NSCalendarUnitMonth fromDate:self.birthDate];
    // long year = [components year];
    long month = [components month];
    // long day = [components day];
    
    return month;
    
}
@end
