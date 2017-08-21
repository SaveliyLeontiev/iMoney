#import "AppDelegate.h"
#import "StorageManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[StorageManager manager] saveStorage];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    [[StorageManager manager] saveStorage];
}


@end
