package com.yunjiacloud.my_plugin

import android.app.Application
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar

/** MyPlugin */
class MyPlugin : FlutterPlugin, ActivityAware {
    companion object {
        const val FLUTTER_CHANNEL_NAME = "com.yunjiacloud.my_plugin/channel"

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            MyPlugin().setupMethodChannel(registrar.messenger())
        }
    }

    private lateinit var channel: MethodChannel
    private var activityBinding: ActivityPluginBinding? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        setupMethodChannel(flutterPluginBinding.binaryMessenger)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        tearDownChannel()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityBinding = binding
    }

    override fun onDetachedFromActivity() {
        activityBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activityBinding = binding
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityBinding = null
    }

    private fun setupMethodChannel(messenger: BinaryMessenger) {
        channel = MethodChannel(messenger, FLUTTER_CHANNEL_NAME)
        channel.setMethodCallHandler(MethodCallHandlerImpl())
    }

    private fun tearDownChannel() {
        channel.setMethodCallHandler(null)
    }
}
