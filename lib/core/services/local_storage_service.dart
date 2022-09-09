import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  ///
  /// List of const keys
  ///
  static const String onboardingCountKey = 'onBoardingCount';
  static const String orderId = 'orderId';
  static const String bookingId = 'bookingId';

  static const String paymentMethodKey = 'paymentMethod';

  static const String notificationsCountKey = 'snotificationsCount';
  static const String notifications = "notifications";
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';
  static const String primaryAddress = 'primaryAddress';
  static const String emailAddress = 'emailAddress';
  static const String password = 'password';

  ///
  /// Setters and getters
  ///
  int get onBoardingPageCount => _getFromDisk(onboardingCountKey) ?? 0;
  set onBoardingPageCount(int count) => _saveToDisk(onboardingCountKey, count);

  int get addPrimaryAddress => _getFromDisk(primaryAddress) ?? 1;
  set addPrimaryAddress(int count) => _saveToDisk(primaryAddress, count);

  bool get getNotifications => _getFromDisk(notifications) ?? true;
  set getNotifications(bool count) => _saveToDisk(notifications, count);

  String get getEmail => _getFromDisk(emailAddress) ?? true;
  set getEmail(String count) => _saveToDisk(emailAddress, count);

  String get getPassword => _getFromDisk(password) ?? true;
  set getPassword(String count) => _saveToDisk(password, count);

  ///
  /// order id
  ///
  String get getOrderId => _getFromDisk(orderId) ?? '';
  set getOrderId(String count) => _saveToDisk(orderId, count);

  ///
  /// booking id
  ///
  String get getBookingId => _getFromDisk(bookingId) ?? '';
  set getBookingId(String count) => _saveToDisk(bookingId, count);

  ///
  /// payemntsMethod
  ///
  bool get isCashOnDelivery => _getFromDisk(paymentMethodKey) ?? false;
  set isCashOnDelivery(bool count) => _saveToDisk(paymentMethodKey, count);

  int get setNotificationsCount => _getFromDisk(notificationsCountKey) ?? 0;
  set setNotificationsCount(int count) =>
      _saveToDisk(notificationsCountKey, count);

  dynamic get accessToken => _getFromDisk(accessTokenKey) ?? null;
  set accessToken(token) => _saveToDisk(accessTokenKey, token);

  dynamic get refreshToken => _getFromDisk(refreshTokenKey) ?? null;

////
  ///initializing instance
  ///
  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences!.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk<T>(String key, T? content) {
    print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }

    if (content == null) {
      _preferences!.remove(key);
    }
  }

  // static Future<LocalStorageService> getInstance() async {
  //   if (_instance == null) {
  //     _instance = LocalStorageService();
  //   }
  //   if (_preferences == null) {
  //     _preferences = await SharedPreferences.getInstance();
  //   }
  //   return _instance!;
  // }
}
