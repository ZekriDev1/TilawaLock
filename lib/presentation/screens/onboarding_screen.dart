import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/constants/colors.dart';
import 'permissions_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final List<OnboardingData> data = [
      OnboardingData(
        title: l10n.appsBlocked, // Or a more suitable onboarding key if added
        description: l10n.usageLimitDesc,
        icon: Icons.timer_outlined,
      ),
      OnboardingData(
        title: l10n.reciteNow,
        description: l10n.lockMessage,
        icon: Icons.menu_book_outlined,
      ),
      OnboardingData(
        title: l10n.achievements,
        description: l10n.tagline,
        icon: Icons.auto_graph_outlined,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: data[index]);
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      data.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _currentPage == index 
                              ? AppColors.gold 
                              : AppColors.gold.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage == data.length - 1) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => const PermissionsScreen()),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        _currentPage == data.length - 1 ? l10n.getStarted : l10n.next,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_currentPage < data.length - 1)
                    TextButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          data.length - 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        l10n.skip,
                        style: TextStyle(color: AppColors.emerald.withOpacity(0.6)),
                      ),
                    )
                  else
                    const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final IconData icon;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.emerald.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              data.icon,
              size: 100,
              color: AppColors.gold,
            ),
          ),
          const SizedBox(height: 48),
          FadeInDown(
            child: Text(
              data.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          FadeInUp(
            child: Text(
              data.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.emerald.withOpacity(0.7),
                    height: 1.5,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
