#import <Foundation/Foundation.h>

// app

// creator

typedef NS_ENUM(NSUInteger, test_type)
{
    test_type_text,
    test_type_color,
    test_type_image,
    test_type_number
};

// analytics

typedef NS_ENUM(NSUInteger, ga_screen)
{
    ga_screen_status,
    ga_screen_rate
};

typedef NS_ENUM(NSUInteger, ga_event)
{
    ga_event_rate,
    ga_event_rate_review
};

typedef NS_ENUM(NSUInteger, ga_action)
{
    ga_action_error,
    ga_action_start,
    ga_action_completed,
    ga_action_cancel
};