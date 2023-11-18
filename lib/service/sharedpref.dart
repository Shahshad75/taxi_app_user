import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  Sharedpref._();
  static final Sharedpref _instence = Sharedpref._();
  static Sharedpref get instence => _instence;

  static const String email = 'email';
  static const String password = 'password';

  late SharedPreferences sharedpref;

  initeStorage() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  setAuthDetaials(String emails, String passwords) async {
    await sharedpref.setString(email, emails);
    await sharedpref.setString(password, passwords);
  }

  signout() {
    sharedpref.remove(email);
    sharedpref.remove(password);
  }

  Map<String, dynamic>? getAuthDetails() {
    String? emails = sharedpref.getString(email);
    String? passwords = sharedpref.getString(password);
    if (emails == null || passwords == null) return null;
    Map<String, dynamic> authDetails = {
      'email': emails,
      'password': passwords,
    };
    return authDetails;
  }
}
