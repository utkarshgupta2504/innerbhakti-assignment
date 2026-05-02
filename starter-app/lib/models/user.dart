/// The paid status of a user.
///
/// NOTE: The backend returns these as lowercase strings (e.g. "subscribed"),
/// and we compare against these enum-like string constants at various places
/// in the app.
class PaidStatus {
  static const free = 'FREE';
  static const subscribed = 'SUBSCRIBED';
  static const cancelled = 'CANCELLED';
  static const expired = 'EXPIRED';
  static const trial = 'TRIAL';
}

class User {
  final int id;
  final String name;
  final String email;
  final String? phone;

  /// Raw paid status string from the backend.
  final String paidStatus;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.paidStatus,
    this.phone,
  });

  /// Whether this user currently has paid access.
  bool get isPaid => paidStatus == PaidStatus.subscribed;

  factory User.fromJsonPlaceholder(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      // The mock backend tells us the user is subscribed.
      paidStatus: 'subscribed',
    );
  }
}
