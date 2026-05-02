import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/user_service.dart';
import '../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _user;
  Map<String, dynamic>? _insights;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final user = await UserService.fetchUser(1);
      // TODO(candidate): This endpoint doesn't exist on the backend yet.
      // The UI expects a "this week's insights" card below the profile header.
      // Currently this throws UnimplementedError and the whole screen fails.
      // Decide on a graceful handling strategy and implement it.
      final insights = await UserService.fetchInsights(user.id);
      if (!mounted) return;
      setState(() {
        _user = user;
        _insights = insights;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Failed to load profile:\n$_error',
          style: const TextStyle(color: AppColors.errorRed),
        ),
      );
    }
    final user = _user!;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.transparentOrange,
          child: Text(
            user.name.isNotEmpty ? user.name[0] : '?',
            style: const TextStyle(
              fontSize: 32,
              color: AppColors.orangeDark,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            user.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Center(
          child: Text(
            user.email,
            style: const TextStyle(color: AppColors.grey_7),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'This week\'s insights',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        // Whatever the candidate decides to do for the missing insights
        // endpoint should end up here.
        Text(
          _insights != null
              ? _insights.toString()
              : '(insights unavailable)',
          style: const TextStyle(color: AppColors.grey_7),
        ),
      ],
    );
  }
}
