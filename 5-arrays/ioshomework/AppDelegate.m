
#import "AppDelegate.h"
#import "AZHuman.h"
#import "AZJumper.h"
#import "AZSwimmer.h"
#import "AZBicycler.h"
#import "AZProger.h"
#import "animals/AZBird.h"
#import "animals/AZDog.h"
#import "animals/AZAnimal.h"

@interface AppDelegate ()
    
    @end

@implementation AppDelegate
    
    
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    AZHuman *bicycler = [[AZBicycler alloc] initWithName:@"Zoidberg Velosipedist" height:170 weigth:75.5f male:Man];
    AZHuman *jumper = [[AZJumper alloc] initWithName:@"Boris Prigun" height:185 weigth:60.f male:Man];
    AZHuman *swimmer = [[AZSwimmer alloc] initWithName:@"Calvin Plavchikha" height:167 weigth:56.4f male:Woman];
    AZProger *proger = [[AZProger alloc] initWithName:@"Artem" height:171 weigth:76.5f male:Man];
    proger.salary = 225000;
    proger.language = Java;
    
    
    NSArray *humanArray = [[NSArray alloc] initWithObjects:bicycler, jumper, swimmer, proger, nil];
    
    NSEnumerator<AZHuman*> * reverseEnumerator = [humanArray reverseObjectEnumerator];
    
    for (AZHuman *human in reverseEnumerator){
        NSLog(@"name=%@, height=%ld, weigth=%f,male=%@", human.name,(long)human.height,human.weight,[human getMaleString]);
        if ([human respondsToSelector:@selector(move)]){
            [human move];
        }
        if ([human conformsToProtocol:@protocol(Worker)]){
            [human performSelector:@selector(work)];
        }
        if ([human isKindOfClass:[AZProger class]]){
            AZProger *p = (AZProger*) human;
            NSLog(@"зарплата = %ld", [p salary]);
            NSLog(@"язык программирования = %@", [p getProgramLanguageString]);
        }
    }
    
    NSLog(@"\n --- LETS GO WITH ENUMERATOR!!! --- \n");
    
    [humanArray enumerateObjectsUsingBlock:^(AZHuman* _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"name = %@", obj.name);
        if ([obj.name isEqualToString:@"Nastya Plavchikha"]){
            NSLog(@"Nastya found for %ld tryes! exit...", (long)idx);
            *stop = YES;
        }
    }];
    
    /*MASTER LEVEL*/
    NSLog(@"\n------MASTER LEVEL-------\n");
    
    AZBird *bird = [AZBird new];
    bird.name = @"Tsipa";
    bird.movingType = Fly;
    
    AZDog *dog = [AZDog new];
    dog.movingType = Run;
    dog.name = @"Barbos";
    dog.breed = Shepherd;
    
    NSArray *animalArray = [NSArray arrayWithObjects:bird, dog, nil];
    NSMutableArray *allArray = [NSMutableArray arrayWithArray:animalArray];
    [allArray addObjectsFromArray:humanArray];
    
    for (id obj in allArray){
        if ([obj isKindOfClass:[AZHuman class]]){
            NSLog(@"i am Human!");
            AZHuman *human = obj;
            NSLog(@"name=%@, height=%ld, weigth=%f,male=%@", human.name,(long)human.height,human.weight,[human getMaleString]);
        }
        if ([obj isKindOfClass:[AZAnimal class]]){
            NSLog(@"i am Animal");
            AZAnimal *animal = obj;
            NSLog(@"name=%@", animal.name);
            [animal move];
            [animal speak];
        }
        if ([obj isKindOfClass:[AZDog class]]){
            NSLog(@"%@ breed is %@", dog.name, [dog breed]);
        }
    }
        
        /*STAR LEVEL*/
        NSLog(@"\n------STAR LEVEL-------\n");
        
        NSInteger maxCount = humanArray.count > animalArray.count ? humanArray.count : animalArray.count;
        for (int i = 0; i < maxCount; i++){
            @autoreleasepool {
                if (humanArray.count > i){
                    AZHuman *human =  humanArray[i];
                    NSLog(@"name=%@, height=%ld, weigth=%f,male=%@", human.name,(long)human.height,human.weight,[human getMaleString]);
                }
                if (animalArray.count > i){
                AZAnimal *animal = animalArray[i];
                    NSLog(@"name=%@", animal.name);
                }
        }
    }
    
    /*SUPERMAN LEVEL*/
    NSLog(@"\n------STAR LEVEL-------\n");
    [allArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 isKindOfClass:AZHuman.class] && [obj2 isKindOfClass:AZHuman.class]){
            return [[(AZHuman*)obj1 name] compare:[(AZHuman*)obj2 name]];
        }
        else if([obj1 isKindOfClass:AZAnimal.class] && [obj2 isKindOfClass:AZAnimal.class]){
            return [[(AZAnimal*)obj1 name] compare:[(AZAnimal*)obj2 name]];
        }
        else if ([obj1 isKindOfClass:AZHuman.class]){
            return NSOrderedAscending;
        } else {
        return NSOrderedDescending;
        }
    }];
    
    for (id obj in allArray){
        if ([obj isKindOfClass:AZHuman.class]){
            NSLog(@"Human, name = %@",[(AZHuman*)obj name]);
        }
        if ([obj isKindOfClass:AZAnimal.class]){
            NSLog(@"Human, name = %@",[(AZAnimal*)obj name]);
        }
    }
    
    
    return YES;
}
    
    
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
    
    
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
    
    
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
    
    
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
    
    
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
    
    
    @end
