//
//  main.m
//  macOSRuntimeTest
//
//  Created by nor on 2020/12/11.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
#import <malloc/malloc.h>



@interface Person : NSObject
{
    int _age;
}
@end
@implementation Person
@end

@interface Student : Person
{
    int _no;
}
@end
@implementation Student
@end

int main(int argc, const char * argv[]) {
    
    
    NSLog(@"%zd %zd  %zd",
          class_getInstanceSize([NSObject class]),
          class_getInstanceSize([Person class]),
          class_getInstanceSize([Student class])
          );
    NSObject *obj = [[NSObject alloc] init];
    
    malloc_size((__bridge const void *)(obj));
    
    
    
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
    
//    Class objectMetaClass = object_getClass([NSObject class]);
//    Class cls = [[NSObject class] class];
//    Class objectClass3 = [NSObject class];
//    class_isMetaClass(objectMetaClass);
//
//    NSLog(@"%p %p %p", objectMetaClass, objectClass3, cls); // 后面两个地址相同，说明多次调用class得到的还是类对象

    NSObject *object = [[NSObject alloc] init];
    Class objectClass = [NSObject class];
    Class objectMetaClass = object_getClass([NSObject class]);
    NSLog(@"%p %p %p", object, objectClass, objectMetaClass);
    
    
    return 0;
}
