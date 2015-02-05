//
//  DLVersionSpec.m
//  DLVersionSpec
//
//  Created by Nate West on 02/05/2015.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import <DLVersion/DLVersion.h>

@interface DLVersion ()

@property (nonatomic, assign) NSInteger major;
@property (nonatomic, assign) NSInteger minor;
@property (nonatomic, assign) NSInteger patch;

@end

SpecBegin(DLVersionSpec)

describe(@"DLVersion", ^{
    describe(@"- fromString:", ^{
        it(@"can be created with a string", ^{
            DLVersion *version = [DLVersion fromString:@"1.2.3"];
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
});

SpecEnd
