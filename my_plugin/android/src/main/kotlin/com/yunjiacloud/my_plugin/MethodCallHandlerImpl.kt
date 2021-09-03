package com.yunjiacloud.my_plugin

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * Copyright © 2021 yunjia Ltd.
 * All rights reserved
 *
 * @project  : android
 * @package  : com.yunjiacloud.my_plugin
 * @author   : zhang
 * @date     : 2021/8/11 0011
 * @email    : zhangxx@yunjiacloud.com
 */
class MethodCallHandlerImpl: MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "test" -> {
                result.success("Android test ok!")
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}