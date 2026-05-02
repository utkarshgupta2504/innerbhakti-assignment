import 'package:flutter/material.dart';

import '../state/home_controller.dart';
import '../utils/colors.dart';
import '../widgets/content_card.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.loadHome(() {
        if (!mounted) return;
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => false);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final body = _buildBody();
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
            title: const Text(
              'InnerBhakti',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            iconTheme: const IconThemeData(color: AppColors.textPrimary),
          ),
          body: body,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _controller.selectedTab,
            selectedItemColor: AppColors.orange,
            unselectedItemColor: AppColors.grey_7,
            onTap: (i) {
              _controller.selectTab(i);
              if (i == 1) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                );
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    if (_controller.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_controller.loadError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Something went wrong:\n${_controller.loadError}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.errorRed),
          ),
        ),
      );
    }

    final today = _controller.today;
    final user = _controller.user;
    if (today == null) {
      return const Center(child: Text('No content for today.'));
    }

    return ListView(
      children: [
        if (user != null && !user.isPaid)
          Container(
            color: AppColors.transparentOrange,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Icon(Icons.lock_outline, color: AppColors.orange),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Upgrade to unlock all content',
                    style: TextStyle(color: AppColors.orangeDark),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Upgrade',
                    style: TextStyle(color: AppColors.orange),
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
          child: Text(
            'Hello${user != null ? ', ${user.name.split(' ').first}' : ''}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(
            'Streak: ${today.streak} days',
            style: const TextStyle(color: AppColors.grey_7),
          ),
        ),
        ContentCard(
          typeLabel: kContentTypeMantra,
          title: today.mantra.title,
          subtitle: '${today.mantra.durationSeconds ~/ 60} min',
        ),
        ContentCard(
          typeLabel: kContentTypePrayer,
          title: today.prayer?.title ?? 'Prayer unavailable today',
          subtitle: today.prayer?.body ?? 'Please check back tomorrow.',
        ),
        ContentCard(
          typeLabel: kContentTypeCourse,
          title: today.course.title,
          subtitle:
              'Day ${today.course.dayNumber} of ${today.course.totalDays}',
        ),
      ],
    );
  }
}
