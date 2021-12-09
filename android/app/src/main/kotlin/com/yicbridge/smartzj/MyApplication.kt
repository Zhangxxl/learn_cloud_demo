package com.yicbridge.smartzj

import cn.leancloud.LCInstallation
import cn.leancloud.LCLogger
import cn.leancloud.LeanCloud
import cn.leancloud.im.LCIMOptions
import io.flutter.app.FlutterApplication

class MyApplication : FlutterApplication() {

    override fun onCreate() {
        super.onCreate();
        //开启未读消息数更新通知
        LCIMOptions.getGlobalOptions().setUnreadNotificationEnabled(true)
        //开启调试日志
        LeanCloud.setLogLevel(LCLogger.Level.DEBUG)
        // 提供 this、App ID、App Key、Server Host 作为参数
        // 请将 xxx.example.com 替换为你的应用绑定的 API 域名
        LeanCloud.initialize(
            this,
            "V2rjnSVoPoLIIiGskzsl73sC-gzGzoHsz",
            "n7kIP1iWSzW4EGeSo7NfMmPn",
            "https://please-replace-with-your-customized.domain.com"
        )
        LCInstallation.getCurrentInstallation().saveInBackground();
    }
}