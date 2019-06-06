
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AZEmployee : NSObject
@property(copy, nonatomic) NSString *name;
@property(copy, nonatomic) NSString *surName;
@property(copy, nonatomic) NSDate *birthDate;

-(NSInteger) monthOfBirth;
-(NSString*) dateString;
@end

NS_ASSUME_NONNULL_END
