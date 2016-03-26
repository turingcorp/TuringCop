#import "appdel.h"

@class mdbitem;
@class mcourseitemchapter;

@interface mdb:NSObject

+(void)updatedb;
+(void)loadcourses;
+(void)opencourse:(NSUInteger)dbid;
+(void)openchapter:(NSUInteger)dbid;
+(void)updatechapter:(mcourseitemchapter*)chapter;
+(NSArray*)logs;

@end