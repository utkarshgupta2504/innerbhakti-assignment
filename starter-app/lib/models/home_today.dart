class HomeToday {
  final String date;
  final Mantra mantra;
  final Prayer prayer;
  final Course course;
  final int streak;

  HomeToday({
    required this.date,
    required this.mantra,
    required this.prayer,
    required this.course,
    required this.streak,
  });

  factory HomeToday.fromJson(Map<String, dynamic> json) {
    return HomeToday(
      date: json['date'] as String,
      mantra: Mantra.fromJson(json['mantra'] as Map<String, dynamic>),
      prayer: Prayer.fromJson(json['prayer'] as Map<String, dynamic>),
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      streak: json['streak'] as int,
    );
  }
}

class Mantra {
  final String id;
  final String title;
  final int durationSeconds;
  final String? audioUrl;

  Mantra({
    required this.id,
    required this.title,
    required this.durationSeconds,
    this.audioUrl,
  });

  factory Mantra.fromJson(Map<String, dynamic> json) => Mantra(
        id: json['id'] as String,
        title: json['title'] as String,
        durationSeconds: json['durationSeconds'] as int,
        audioUrl: json['audioUrl'] as String?,
      );
}

class Prayer {
  final String id;
  final String title;
  final String language;
  final String body;

  Prayer({
    required this.id,
    required this.title,
    required this.language,
    required this.body,
  });

  factory Prayer.fromJson(Map<String, dynamic> json) => Prayer(
        id: json['id'] as String,
        title: json['title'] as String,
        language: json['language'] as String,
        body: json['body'] as String,
      );
}

class Course {
  final String id;
  final String title;
  final int dayNumber;
  final int totalDays;
  final String coverImageUrl;

  Course({
    required this.id,
    required this.title,
    required this.dayNumber,
    required this.totalDays,
    required this.coverImageUrl,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as String,
        title: json['title'] as String,
        dayNumber: json['dayNumber'] as int,
        totalDays: json['totalDays'] as int,
        coverImageUrl: json['coverImageUrl'] as String,
      );
}
