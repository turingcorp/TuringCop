#import <Foundation/Foundation.h>

// app

// camera

// analytics

typedef NS_ENUM(NSInteger, ga_screen)
{
    ga_screen_status,
    ga_screen_rate
};

typedef NS_ENUM(NSInteger, ga_event)
{
    ga_event_rate,
    ga_event_rate_review
};

typedef NS_ENUM(NSInteger, ga_action)
{
    ga_action_error,
    ga_action_start,
    ga_action_completed,
    ga_action_cancel
};