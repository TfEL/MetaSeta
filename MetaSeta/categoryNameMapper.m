//
//  categoryNameMapper.m
//  MetaSeta
//
//  Created by Aidan Cornelius-Bell on 1/10/2015.
//  Copyright © 2015 Department for Education and Child Development. All rights reserved.
//

#import "categoryNameMapper.h"

@implementation categoryNameMapper

+ (NSArray *) typeValues {
    NSArray *typeValues = [NSArray alloc];
    
    typeValues = @[ @".x_conference_", @".x_event_", @".x_guestspeaker_", @".x_animationresource_" ];
    
    return typeValues;
}

+ (NSArray *) priorityValues {
    NSArray *priorityValues = [NSArray alloc];
    
    priorityValues = @[ @"x_highpri_", @"x_lowpri_" ];
    
    return priorityValues;
}

+ (NSArray *) copyrightValues {
    NSArray *copyrightValues = [NSArray alloc];
    
    copyrightValues = @[ @"x_copyDECD_", @"x_purchasedDECD_", @"x_noreuse_" ];
    
    return copyrightValues;
}

+ (NSArray *) polishValues {
    NSArray *polishValues = [NSArray alloc];
    
    polishValues = @[ @"FINAL", @"UNFINISHED", @"OTHER" ];
    
    return polishValues;
}

@end
