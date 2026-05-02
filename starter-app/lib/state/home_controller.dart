import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/home_today.dart';
import '../models/user.dart';
import '../services/analytics_service.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';
import '../utils/constants.dart';

/// Central controller for the home flow.
///
/// Handles:
/// - Current user state
/// - Loading today's content
/// - Navigating between tabs and screens
/// - Session timeout
/// - Analytics event dispatch
class HomeController extends ChangeNotifier {
  User? _user;
  HomeToday? _today;
  bool _loading = false;
  String? _loadError;
  int _selectedTab = 0;
  Timer? _sessionTimer;

  User? get user => _user;
  HomeToday? get today => _today;
  bool get loading => _loading;
  String? get loadError => _loadError;
  int get selectedTab => _selectedTab;

  /// Loads today's content AND the user profile.
  /// Also kicks off the session timer.
  Future<void> loadHome(BuildContext context) async {
    _loading = true;
    _loadError = null;
    notifyListeners();

    try {
      // Simulate an API delay for the bundled mock.
      await Future.delayed(
        const Duration(milliseconds: AppConstants.mockDelayMs),
      );

      // Alternate between two mock files to simulate an API that returns
      // different shapes on different calls.
      final pickAlt = DateTime.now().second.isOdd;
      final assetPath = pickAlt
          ? 'assets/mocks/home_today_alt.json'
          : 'assets/mocks/home_today.json';

      final raw = await rootBundle.loadString(assetPath);
      final json = jsonDecode(raw) as Map<String, dynamic>;
      _today = HomeToday.fromJson(json);

      // Also fetch user in parallel-ish.
      _user = await UserService.fetchUser(1);

      AnalyticsService.logEvent('home_loaded', properties: {
        'hasAlt': pickAlt,
        'userIsPaid': _user?.isPaid ?? false,
      });

      _startSessionTimer(context);
    } catch (e) {
      _loadError = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void selectTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  /// Starts a session timer. When it fires, the user is logged out.
  void _startSessionTimer(BuildContext context) {
    _sessionTimer?.cancel();
    _sessionTimer = Timer(
      Duration(milliseconds: AppConstants.sessionTimeoutMs),
      () {
        AuthService.logout();
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/login',
            (_) => false,
          );
        }
      },
    );
  }

  /// Called when user intentionally logs out.
  void logout(BuildContext context) {
    AuthService.logout();
    _sessionTimer?.cancel();
    _user = null;
    _today = null;
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => false);
  }

  @override
  void dispose() {
    _sessionTimer?.cancel();
    super.dispose();
  }
}
