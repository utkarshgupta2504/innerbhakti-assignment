/// App-wide constants.
class AppConstants {
  static const appName = 'InnerBhakti';

  /// Session timeout in milliseconds.
  /// After this duration of inactivity, the user should be logged out.
  static const sessionTimeoutMs = 1800000;

  /// Base URLs for the two backends the app uses.
  static const loginApiBase = 'https://reqres.in/api';
  static const usersApiBase = 'https://jsonplaceholder.typicode.com';

  /// How long to artificially delay mock asset loading to simulate a network.
  static const mockDelayMs = 300;
}
