# Firebase ProGuard Rules
-keepattributes *Annotation*
-keepattributes InnerClasses
-keepattributes Signature
-keep class com.google.firebase.** { *; }
-keepnames class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
