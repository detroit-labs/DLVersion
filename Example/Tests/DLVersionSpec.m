//
//  DLVersionSpec.m
//  DLVersionSpec
//
//  Created by Nate West on 02/05/2015.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import <DLVersion/DLVersion.h>

#define EXP_SHORTHAND
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

@interface DLVersion ()

@property (nonatomic, assign) NSInteger major;
@property (nonatomic, assign) NSInteger minor;
@property (nonatomic, assign) NSInteger patch;

@end

SpecBegin(DLVersionSpec)

describe(@"DLVersion", ^{
    describe(@"- versionWithString:", ^{
        it(@"can be created with a string", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.2.3"];
            expect(version.major).to.equal(1);
            expect(version.minor).to.equal(2);
            expect(version.patch).to.equal(3);
        });
    });

    describe(@"+ localVersion", ^{
        it(@"pulls the local version of the app", ^{
            DLVersion *version = [DLVersion localVersion];
            expect(version.major).to.equal(1);
            expect(version.minor).to.equal(0);
            expect(version.patch).to.equal(0);
        });
    });

    describe(@"- string", ^{
        it(@"provides a string representation", ^{
            DLVersion *version = [DLVersion localVersion];
            expect([version string]).to.equal(@"1.0.0");
        });
    });

    describe(@"- compare:", ^{
        it(@"is the same if the versions match", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.0.0"];
            expect([version compare:anotherVersion]).to.equal(NSOrderedSame);
        });
        it(@"is older if the other version is greater", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.2.0"];
            expect([version compare:anotherVersion]).to.equal(NSOrderedAscending);
        });
        it(@"is newer if the other version is less", ^{
            DLVersion *version = [DLVersion versionWithString:@"2.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.2.0"];
            expect([version compare:anotherVersion]).to.equal(NSOrderedDescending);
        });
    });
    
    describe(@"- isEqual:", ^{
        it(@"is false if passed another class", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            NSString *aString = @"1.0.0";
            expect([version isEqual:aString]).to.beFalsy;
        });
        
        it(@"is false if passed nil", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            expect([version isEqual:nil]).to.beFalsy;
        });
    });
    
    describe(@"- hash:", ^{
        it(@"is equal for two equal versions", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.0.0"];
            expect(version.hash).to.equal(anotherVersion.hash);
        });
        it(@"is not equal for two inequal versions", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.2.0"];
            expect(version.hash).notTo.equal(anotherVersion.hash);
        });
    });
    
    describe(@"- isEqualToVersion:", ^{
        it(@"is true if the versions match", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.0.0"];
            expect([version isEqualToVersion:anotherVersion]).to.beTruthy;
        });
        it(@"is false if the versions do not match", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.2.0"];
            expect([version isEqualToVersion:anotherVersion]).to.beFalsy;
        });
    });

    describe(@"- isOlderThanVersion:", ^{
        it(@"is older if the version is smaller", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.2.0"];
            expect([version isOlderThanVersion:anotherVersion]).to.equal(YES);
        });

        it(@"is not older if the version is greater", ^{
            DLVersion *version = [DLVersion versionWithString:@"2.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.2.0"];
            expect([version isOlderThanVersion:anotherVersion]).to.equal(NO);
        });
    });

    describe(@"- isNewerThanVersion:", ^{
        it(@"is newer if the version is greater", ^{
            DLVersion *version = [DLVersion versionWithString:@"2.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.2.0"];
            expect([version isNewerThanVersion:anotherVersion]).to.equal(YES);
        });
        
        it(@"is not newer if the version is smaller", ^{
            DLVersion *version = [DLVersion versionWithString:@"1.0.0"];
            DLVersion *anotherVersion = [DLVersion versionWithString:@"1.2.0"];
            expect([version isNewerThanVersion:anotherVersion]).to.equal(NO);
        });
        
    });
});

SpecEnd
