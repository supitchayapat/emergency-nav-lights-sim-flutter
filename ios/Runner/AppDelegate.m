#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
  self.window.screen.brightness = 1.0;
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
