//
//  ViewController.m
//  MetaSeta
//
//  Created by Aidan Cornelius-Bell on 1/10/2015.
//  Copyright © 2015 Department for Education and Child Development. All rights reserved.
//

#import "ViewController.h"
#import "categoryNameMapper.h"
#import "OpenMeta.h"

@implementation ViewController

@synthesize originalFile, fileNameLabel, modifiedDateLabel, saveButtonOutlet, typeSelector, prioritySelector, copyrightSelector, polishSelector, finalNameLabel, descriptionTextView, iconOutlet;

NSURL *originalFilePath;
NSMetadataItem *originalFileMetadata;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    [categoryNameMapper alloc];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(void)viewWillDisappear {
    [super viewWillDisappear];
    // something something you haven't saved changes
}

// Final action after save button pressed...
- (IBAction)saveButtonPress:(id)sender {
    NSLog(@"Type: %@", [[categoryNameMapper typeValues] objectAtIndex:[typeSelector selectedTag]]);
    NSLog(@"Priority: %@", [[categoryNameMapper priorityValues] objectAtIndex:[prioritySelector selectedTag]]);
    NSLog(@"Copyright: %@", [[categoryNameMapper copyrightValues] objectAtIndex:[copyrightSelector selectedTag]]);
    NSLog(@"Polish: %@", [[categoryNameMapper polishValues] objectAtIndex:[polishSelector selectedTag]]);

    NSString *hierarchy = [NSString stringWithFormat:@"%@%@%@%@%@.%@", [[[originalFile URL] lastPathComponent] stringByDeletingPathExtension], [[categoryNameMapper typeValues] objectAtIndex:[typeSelector selectedTag]], [[categoryNameMapper priorityValues] objectAtIndex:[prioritySelector selectedTag]], [[categoryNameMapper copyrightValues] objectAtIndex:[copyrightSelector selectedTag]], [[categoryNameMapper polishValues] objectAtIndex:[polishSelector selectedTag]], [[[originalFile URL] lastPathComponent] pathExtension]];
    
    [finalNameLabel setStringValue:hierarchy];
    
    NSError *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [fileManager moveItemAtPath:[NSString stringWithFormat:@"%@", [originalFilePath path]] toPath:[NSString stringWithFormat:@"%@/%@", [[originalFilePath URLByDeletingLastPathComponent] path], hierarchy] error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"File Path Error"];
        [alert setInformativeText:[error localizedDescription]];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert runModal];
    }
    
    
    
}

// Initial action after file is selected...
- (IBAction)originalFileSelected:(id)sender {
    [fileNameLabel setStringValue:[NSString stringWithFormat:@"%@", [[originalFile URL] lastPathComponent]]];
    
    saveButtonOutlet.enabled = YES;
    
    // Save the path global
    originalFilePath = [originalFile URL];
    
    // Get some metadata (if it exists)
    originalFileMetadata = [[NSMetadataItem alloc] initWithURL:originalFilePath];
    
    // Set the icon
    [iconOutlet setImage:[[NSWorkspace sharedWorkspace] iconForFileType:[[originalFilePath lastPathComponent] pathExtension]]];
    
    // Set the moddate
    [modifiedDateLabel setStringValue:[NSString stringWithFormat:@"Modified: %@", [originalFileMetadata valueForAttribute:@"kMDItemContentModificationDate"]]];
    
    // Download existing meta into the UI
    if ([originalFileMetadata valueForAttribute:@"kMDItemFinderComment"]) {
        [descriptionTextView setString:[NSString stringWithFormat:@"%@\n\nSUBJECTS: \nFILMED BY: \nUSED IN: \nPROJECTS: \n\nMAINTAINER: DECD TLS Teaching for Effective Learning.", [originalFileMetadata valueForAttribute:@"kMDItemFinderComment"]]];
    } else {
        [descriptionTextView setString:@"SUBJECTS: \nFILMED BY: \nUSED IN: \nPROJECTS: \n\nMAINTAINER: DECD TLS Teaching for Effective Learning."];
    }
}

@end