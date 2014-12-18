%hook SpringBoard

@interface CLLocationManager
+ (BOOL)locationServicesEnabled;
+ (void)setLocationServicesEnabled:(BOOL)newValue;
@end


-(void)applicationDidFinishLaunching:(id)application {
id CLLocationManager1 = objc_getClass("CLLocationManager");
BOOL b= [CLLocationManager locationServicesEnabled];
[CLLocationManager1 setLocationServicesEnabled:!b];
%orig;


}

- (void)menuButtonDown:(id)down
{
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test"  message:@"Test!" delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
[alert show];

id CLLocationManager1 = objc_getClass("CLLocationManager");
BOOL b= [CLLocationManager locationServicesEnabled];
[CLLocationManager1 setLocationServicesEnabled:!b];
%orig;
}



- (BOOL)launchApplicationWithIdentifier:(id)identifier suspended:(BOOL)suspended
{
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test"  message:@"Test!" delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
[alert show];

id CLLocationManager1 = objc_getClass("CLLocationManager");
BOOL b= [CLLocationManager locationServicesEnabled];
[CLLocationManager1 setLocationServicesEnabled:!b];
return %orig;
}

%end