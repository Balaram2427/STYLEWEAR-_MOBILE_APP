class AppConstants {
  // Application Name
  static const String appName = 'Stylewear';

  // API Endpoints
  static const String baseUrl = 'https://api.stylewear.com';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String productsEndpoint = '/products';
  static const String categoriesEndpoint = '/categories';

  // Timeout durations
  static const int apiTimeout = 30000; // 30 seconds

  // Shared Preferences Keys
  static const String userTokenKey = 'USER_TOKEN';
  static const String userIdKey = 'USER_ID';

  // Default values
  static const String defaultCurrency = 'USD';
  static const String defaultLanguage = 'en';

  // Error Messages
  static const String networkError = 'Please check your internet connection.';
  static const String serverError = 'Server error. Please try again later.';
  static const String unauthorizedError = 'Unauthorized access. Please login again.';
}