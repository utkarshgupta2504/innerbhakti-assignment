import '../models/user.dart';

/// Normalizes backend responses into a single app-facing [User] model.
class UserMapper {
  static User fromReqResLogin(Map<String, dynamic> json) {
    return User(
      id: 0,
      name: 'InnerBhakti User',
      email: 'eve.holt@reqres.in',
      paidStatus: PaidStatus.free,
      phone: null,
    );
  }

  static User fromJsonPlaceholder(Map<String, dynamic> json) {
    return User(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?)?.trim().isNotEmpty == true
          ? (json['name'] as String).trim()
          : 'Unknown User',
      email: (json['email'] as String?)?.trim() ?? '',
      phone: json['phone'] as String?,
      // Mock backend business rule for assignment fixtures.
      paidStatus: PaidStatus.subscribed,
    );
  }
}
