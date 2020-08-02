//
//  SettingsWindowController.m
//  NativeDisplayBrightness
//
//  Created by Volodymyr Klymenko on 1/28/18.
//  Copyright © 2018 Volodymyr Klymenko. All rights reserved.
//

#import "SettingsWindowController.h"
#import "Config.h"

@interface SettingsWindowController ()

@end

@implementation SettingsWindowController

-(void)windowDidLoad {
    [super windowDidLoad];

    [self.decreaseBrightnessKey removeAllItems];
    [self.increaseBrightnessKey removeAllItems];
    
    for (int i = 1; i <= 2; i++) {
        NSString *item = [NSString stringWithFormat:@"F%d",i];
        [self.decreaseBrightnessKey addItemWithTitle:item];
        [self.increaseBrightnessKey addItemWithTitle:item];
    }
    [self.increaseBrightnessKey selectItemWithTitle:APP_DELEGATE.increaseBrightnessKey];
    [self.decreaseBrightnessKey selectItemWithTitle:APP_DELEGATE.decreaseBrightnessKey];
    
    [self updateKeys];
    
    self.multiMonitor.state = APP_DELEGATE.multiMonitor;
    self.smoothStep.state = APP_DELEGATE.smoothStep;
    self.showBrightness.state = APP_DELEGATE.showBrightness;
    [self.maxBrightness selectItemWithTag: APP_DELEGATE.maxBrightness];
}

- (void)windowWillClose:(NSNotification *)notification {
    [NSApp stopModal];
}

- (IBAction)multiMonitor:(NSButton *)sender {
    APP_DELEGATE.multiMonitor = sender.state;
}

- (IBAction)smoothStep:(NSButton *)sender {
    APP_DELEGATE.smoothStep = sender.state;
}

- (IBAction)showBrightness:(NSButton *)sender {
    APP_DELEGATE.showBrightness = sender.state;
    if (sender.state == NSControlStateValueOn) {
        APP_DELEGATE.statusBarIcon.title = [NSString stringWithFormat:@"%i%%",APP_DELEGATE.currentBrightness];
        APP_DELEGATE.statusBarIcon.length = APP_DELEGATE.currentBrightness == 100 ? STATUS_ICON_WIDTH_TEXT_100 : STATUS_ICON_WIDTH_TEXT;
    } else {
        APP_DELEGATE.statusBarIcon.title = @"";
        APP_DELEGATE.statusBarIcon.length = STATUS_ICON_WIDTH;
    }    
}

- (IBAction)changeDecreaseBrightnessKey:(NSPopUpButton *)sender {
    APP_DELEGATE.decreaseBrightnessKey = sender.selectedItem.title;
    [self updateKeys];
}

- (IBAction)changeIncreaseBrightnessKey:(NSPopUpButton *)sender {
    APP_DELEGATE.increaseBrightnessKey = sender.selectedItem.title;
    [self updateKeys];
}

- (IBAction)maxBrightness:(NSPopUpButton *)sender {
    APP_DELEGATE.maxBrightness = (int)sender.selectedTag;
}

- (void)updateKeys {
}

- (void) enableAllItems:(NSArray *) items {
    for (NSMenuItem *item in items) {
        item.enabled = YES;
    }
}

@end
