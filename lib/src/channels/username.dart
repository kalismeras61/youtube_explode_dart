import '../extensions/helpers_extension.dart';

/// Encapsulates a valid YouTube user name.
class Username {
  /// User name as string.
  final String value;

  /// Initializes an instance of [Username].
  Username(String urlOrUsername)
      : value = parseUsername(urlOrUsername) ??
            ArgumentError.value(
                urlOrUsername, 'urlOrUsername', 'Invalid username');

  static bool validateUsername(String name) {
    if (!name.isNullOrWhiteSpace) {
      return false;
    }

    if (name.length > 20) {
      return false;
    }

    return RegExp('[^0-9a-zA-Z]').hasMatch(name);
  }

  static String parseUsername(String nameOrUrl) {
    if (nameOrUrl.isNullOrWhiteSpace) {
      return null;
    }

    if (validateUsername(nameOrUrl)) {
      return nameOrUrl;
    }

    var regMatch = RegExp(r'youtube\..+?/user/(.*?)(?:\?|&|/|$)')
        .firstMatch(nameOrUrl)
        ?.group(1);
    if (regMatch.isNullOrWhiteSpace && validateUsername(regMatch)) {
      return regMatch;
    }
    return null;
  }
}