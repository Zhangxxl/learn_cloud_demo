// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accHint": MessageLookupByLibrary.simpleMessage("Please input account"),
        "appName": MessageLookupByLibrary.simpleMessage("Test App"),
        "forgetPwd":
            MessageLookupByLibrary.simpleMessage("forget the password"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "login_fail": MessageLookupByLibrary.simpleMessage("Login failed"),
        "pwdHint":
            MessageLookupByLibrary.simpleMessage("Please input password"),
        "register": MessageLookupByLibrary.simpleMessage("register"),
        "registerAcc":
            MessageLookupByLibrary.simpleMessage("Register an account"),
        "register_fail":
            MessageLookupByLibrary.simpleMessage("Registration failed"),
        "register_fail_acc": MessageLookupByLibrary.simpleMessage(
            "Registration failed, duplicate account"),
        "register_success":
            MessageLookupByLibrary.simpleMessage("Registration success"),
        "theme_blue": MessageLookupByLibrary.simpleMessage("Blue"),
        "theme_dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "theme_mode_dark": MessageLookupByLibrary.simpleMessage("Dark mode"),
        "theme_mode_default":
            MessageLookupByLibrary.simpleMessage("Follow the system setting"),
        "theme_mode_light": MessageLookupByLibrary.simpleMessage("Light mode"),
        "theme_mode_setting":
            MessageLookupByLibrary.simpleMessage("Night mode setting"),
        "theme_purple": MessageLookupByLibrary.simpleMessage("Purple"),
        "theme_red": MessageLookupByLibrary.simpleMessage("Red"),
        "theme_setting": MessageLookupByLibrary.simpleMessage("Theme setting"),
        "waiting": MessageLookupByLibrary.simpleMessage("please wait...")
      };
}
