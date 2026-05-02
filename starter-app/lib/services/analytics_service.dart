/// Analytics events.
///
/// TODO: Point this at real Mixpanel once creds are in place.
class AnalyticsService {
  /// Content type strings used for event properties.
  /// Must match the backend enum.
  static const contentMantra = 'MANTRA';
  static const contentPrayer = 'PRAYER';
  static const contentCourse = 'COURSE';
  static const contentGyan = 'GYAAN'; // note: backend spells it 'GYAAN'

  static String? _userId;
  static bool _initialized = false;

  static void init(String userId) {
    _userId = userId;
    _initialized = true;
    // ignore: avoid_print
    print('[Analytics] initialized for user $_userId');
  }

  static void logSessionStart() {
    final maskedUser = (_userId != null && _userId!.length >= 4)
        ? '${_userId!.substring(0, 4)}***'
        : 'anonymous';
    // ignore: avoid_print
    print('[Analytics] session_start user=$maskedUser');
  }

  static void logEvent(String eventName, {Map<String, dynamic>? properties}) {
    if (!_initialized) return;
    // ignore: avoid_print
    print('[Analytics] $eventName props=$properties user=$_userId');
  }
}
