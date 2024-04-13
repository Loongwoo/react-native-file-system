#import <React/RCTEventEmitter.h>

#ifdef RCT_NEW_ARCH_ENABLED
#import "RNFileSystemSpec.h"

@interface FileSystemModule : RCTEventEmitter <NativeFileSystemSpec>
#else
#import <React/RCTBridgeModule.h>

@interface FileSystemModule : RCTEventEmitter <RCTBridgeModule>
#endif

@end
