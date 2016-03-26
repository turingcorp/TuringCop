#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE course (id INTEGER PRIMARY KEY, available INTEGER, uniqueid TEXT COLLATE NOCASE);";
    [dbcon query:query];
    
    query = @"CREATE TABLE chapter (id INTEGER PRIMARY KEY, uniqueid TEXT COLLATE NOCASE, timestamp INTEGER, score INTEGER, available INTEGER, tried INTEGER, passed INTEGER);";
    [dbcon query:query];
    
    query = @"CREATE TABLE logger (id INTEGER PRIMARY KEY, tried INTEGER, passed INTEGER);";
    [dbcon query:query];
    
    [mdbcreate addcourse:dbcon class:[mcourseitemadd class]];
    [mdbcreate addcourse:dbcon class:[mcourseitemsubs class]];
    [mdbcreate addcourse:dbcon class:[mcourseitemmult class]];
    [mdbcreate addcourse:dbcon class:[mcourseitemdiv class]];
    
    [mdbcreate addchapter:dbcon class:[mcourseadd1 class]];
    [mdbcreate addchapter:dbcon class:[mcourseadd2 class]];
    [mdbcreate addchapter:dbcon class:[mcourseadd3 class]];
    [mdbcreate addchapter:dbcon class:[mcourseadd4 class]];
    [mdbcreate addchapter:dbcon class:[mcourseadd5 class]];
    [mdbcreate addchapter:dbcon class:[mcourseadd6 class]];
    [mdbcreate addchapter:dbcon class:[mcoursesubs1 class]];
    [mdbcreate addchapter:dbcon class:[mcoursesubs2 class]];
    [mdbcreate addchapter:dbcon class:[mcoursesubs3 class]];
    [mdbcreate addchapter:dbcon class:[mcoursesubs4 class]];
    [mdbcreate addchapter:dbcon class:[mcoursesubs5 class]];
    [mdbcreate addchapter:dbcon class:[mcoursesubs6 class]];
    [mdbcreate addchapter:dbcon class:[mcoursemult1 class]];
    [mdbcreate addchapter:dbcon class:[mcoursemult2 class]];
    [mdbcreate addchapter:dbcon class:[mcoursemult3 class]];
    [mdbcreate addchapter:dbcon class:[mcoursemult4 class]];
    [mdbcreate addchapter:dbcon class:[mcoursemult5 class]];
    [mdbcreate addchapter:dbcon class:[mcoursemult6 class]];
    [mdbcreate addchapter:dbcon class:[mcoursediv1 class]];
    [mdbcreate addchapter:dbcon class:[mcoursediv2 class]];
    [mdbcreate addchapter:dbcon class:[mcoursediv3 class]];
    [mdbcreate addchapter:dbcon class:[mcoursediv4 class]];
    [mdbcreate addchapter:dbcon class:[mcoursediv5 class]];
    [mdbcreate addchapter:dbcon class:[mcoursediv6 class]];
    
    [dbcon commit];
}

+(void)addcourse:(db*)dbcon class:(Class)class
{
    NSString *uniqueid = NSStringFromClass(class);
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO course "
                       "(available, uniqueid) "
                       "values(0, \"%@\");",
                       uniqueid];
    
    [dbcon query:query];
}

+(void)addchapter:(db*)dbcon class:(Class)class
{
    NSString *uniqueid = NSStringFromClass(class);
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO chapter "
                       "(uniqueid, timestamp, score, available, tried, passed) "
                       "values(\"%@\", 0, 0, 0, 0, 0);",
                       uniqueid];
    
    [dbcon query:query];
}

@end