//
//  LLBSDConnectionInfo.m
//  LLBSDMessaging
//
//  Created by Damien DeVille on 2/1/15.
//  Copyright (c) 2015 Damien DeVille. All rights reserved.
//

#import "LLBSDProcessInfo.h"

static NSString * const kLLBSDInfoProcessIdentifierKey = @"processIdentifier";

@implementation LLBSDProcessInfo

- (instancetype)initWithProcessIdentifier:(pid_t)processIdentifier
{
    self = [self init];
    if (self == nil) {
        return nil;
    }

    _processIdentifier = processIdentifier;

    return self;
}

#pragma mark - NSObject

- (BOOL)isEqual:(LLBSDProcessInfo *)object
{
    if ([self class] != [object class]) {
        return NO;
    }
    if (!self.processIdentifier != object.processIdentifier) {
        return NO;
    }
    return YES;
}

- (NSUInteger)hash
{
    return (NSUInteger)self.processIdentifier;
}

#pragma mark - NSCopying

- (id)copyWithZone:(__unused NSZone *)zone
{
    return [[[self class] alloc] initWithProcessIdentifier:self.processIdentifier];
}

#pragma mark - NSSecureCoding

+ (BOOL)supportsSecureCoding
{
    return YES;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self == nil) {
        return nil;
    }

    _processIdentifier = [[decoder decodeObjectOfClass:[NSNumber class] forKey:kLLBSDInfoProcessIdentifierKey] intValue];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:@([self processIdentifier]) forKey:kLLBSDInfoProcessIdentifierKey];
}

@end
