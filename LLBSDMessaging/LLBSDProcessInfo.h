//
//  LLBSDConnectionInfo.h
//  LLBSDMessaging
//
//  Created by Damien DeVille on 2/1/15.
//  Copyright (c) 2015 Damien DeVille. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLBSDProcessInfo : NSObject <NSSecureCoding, NSCopying>

/*!
    \brief
    A class identifying a process that can send or receive messages on a `LLBSDConnection`.

    \param processIdentifier
    The identifier of the process aka pid.
 */
- (instancetype)initWithProcessIdentifier:(pid_t)processIdentifier;

/*!
    \brief
    The identifier of the process aka pid.
 */
@property (readonly, assign, nonatomic) pid_t processIdentifier;

@end
