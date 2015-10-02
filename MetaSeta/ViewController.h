//
//  ViewController.h
//  MetaSeta
//
//  Created by Aidan Cornelius-Bell on 1/10/2015.
//  Copyright © 2015 Department for Education and Child Development. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSPathControl *originalFile;
- (IBAction)originalFileSelected:(id)sender;

@property (weak) IBOutlet NSTextField *fileNameLabel;
@property (weak) IBOutlet NSTextField *modifiedDateLabel;
@property (weak) IBOutlet NSButton *saveButtonOutlet;


@property (weak) IBOutlet NSImageView *iconOutlet;

@property (weak) IBOutlet NSPopUpButton *typeSelector;
@property (weak) IBOutlet NSPopUpButton *prioritySelector;
@property (weak) IBOutlet NSPopUpButton *copyrightSelector;
@property (weak) IBOutlet NSPopUpButton *polishSelector;

@property (weak) IBOutlet NSTextField *finalNameLabel;

@property (unsafe_unretained) IBOutlet NSTextView *descriptionTextView;


- (IBAction)saveButtonPress:(id)sender;

@end

