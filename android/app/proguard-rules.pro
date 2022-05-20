#---------------------------------基本指令区---------------------------------
# 抑制警告
-ignorewarnings
#指定代码的压缩级别
-optimizationpasses 5
#包明不混合大小写
-dontusemixedcaseclassnames
#不去忽略非公共的库类 Flag ignored by R8
#-dontskipnonpubliclibraryclasses
 #优化  不优化输入的类文件
-dontoptimize
#预校验 Flag ignored by R8
#-dontpreverify
 #混淆时是否记录日志
-verbose
 # 混淆时所采用的算法
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

#混淆包路径
-repackageclasses ''
-flattenpackagehierarchy ''

#保护注解
-keepattributes *Annotation*

#避免混淆泛型 如果混淆报错建议关掉
-keepattributes Signature

#保留SourceFile和LineNumber属性
-keepattributes SourceFile,LineNumberTable

#----------记录生成的日志数据,gradle build时在本项目根目录输出---------
#apk 包内所有 class 的内部结构 Flag ignored by R8
#-dump class_files.txt
#未混淆的类和成员
-printseeds seeds.txt
#列出从 apk 中删除的代码
-printusage unused.txt
#混淆前后的映射
-printmapping mapping.txt

#Flutter Wrapper
-keep class io.flutter.**  { *; }

#support
-keep class androidx.** { *; }
-keep class android.support.** { *; }
-keep interface androidx.** { *; }
-keep interface android.support.** { *; }
-dontwarn androidx.**
-dontwarn android.support.**

#chromium
-keep class org.chromium.** { *; }
-keep interface org.chromium.** { *; }

#kotlin
-keep class kotlin.** { *; }
-keep class kotlinx.** { *; }
-keep interface kotlin.** { *; }
-keep interface kotlinx.** { *; }

#native方法不被混淆
-keepclasseswithmembernames class * {
    native <methods>;
}
#Parcelable 不被混淆
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

#Serializable 不被混淆
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    !private <fields>;
    !private <methods>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
#保持枚举 enum 类不被混淆 如果混淆报错，建议直接使用上面的 -keepclassmembers class * implements java.io.Serializable即可
-keepclassmembers enum * {
  public static **[] values();
  public static ** valueOf(java.lang.String);
}

#不混淆资源类
-keepclassmembers class **.R$* {
    public static <fields>;
}

#---------------------------------默认保留区---------------------------------
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference

-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public <init>(android.content.Context, android.util.AttributeSet, int, int);
}

-keep class **.R$* {
 *;
}
-keepclassmembers class * {
    void *(**On*Event);
}

#---------------------------------webview------------------------------------
-keepclassmembers class fqcn.of.javascript.interface.for.Webview {
   public *;
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public void *(android.webkit.WebView, java.lang.String);
    public boolean *(android.webkit.WebView, java.lang.String);
}

-keep class * extends android.webkit.WebChromeClient

#-----------------------------------okhttp-----------------------------------
# JSR 305 annotations are for embedding nullability information.
-dontwarn javax.annotation.**

# A resource is loaded with a relative path so the package of this class must be preserved.
-adaptresourcefilenames okhttp3/internal/publicsuffix/PublicSuffixDatabase.gz

# Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
-dontwarn org.codehaus.mojo.animal_sniffer.*

# OkHttp platform used only on JVM and when Conscrypt and other security providers are available.
-dontwarn okhttp3.internal.platform.**
-dontwarn org.conscrypt.**
-dontwarn org.bouncycastle.**
-dontwarn org.openjsse.**

