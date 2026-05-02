import 'package:flutter_test/flutter_test.dart';
import 'package:innerbhakti_assignment/models/user.dart';
import 'package:innerbhakti_assignment/models/home_today.dart';

void main() {
  group('User', () {
    test('parses a JSONPlaceholder response', () {
      final user = User.fromJsonPlaceholder({
        'id': 1,
        'name': 'Leanne Graham',
        'email': 'Sincere@april.biz',
        'phone': '1-770-736-8031 x56442',
      });

      expect(user.id, 1);
      expect(user.name, 'Leanne Graham');
      expect(user.email, 'Sincere@april.biz');
    });

    test('a subscribed user reports isPaid = true', () {
      final user = User.fromJsonPlaceholder({
        'id': 1,
        'name': 'Leanne Graham',
        'email': 'Sincere@april.biz',
      });
      // Backend says this user is subscribed.
      expect(user.isPaid, true);
    });
  });

  group('HomeToday', () {
    test('parses the standard home_today.json shape', () {
      final json = {
        'date': '2026-04-16',
        'mantra': {
          'id': 'm_101',
          'title': 'Om Namah Shivaya',
          'durationSeconds': 180,
        },
        'prayer': {
          'id': 'p_55',
          'title': 'Morning Gratitude',
          'language': 'en',
          'body': 'test',
        },
        'course': {
          'id': 'c_9',
          'title': 'Foundations of Calm',
          'dayNumber': 3,
          'totalDays': 21,
          'coverImageUrl': 'https://example.com/i.jpg',
        },
        'streak': 5,
      };
      final today = HomeToday.fromJson(json);
      expect(today.date, '2026-04-16');
      expect(today.streak, 5);
    });
  });
}
