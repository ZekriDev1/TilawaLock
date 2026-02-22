import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tilawalock/l10n/app_localizations.dart';
import '../../core/constants/colors.dart';
import 'app_selection_screen.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool _isMicGranted = false;
  bool _isUsageGranted = false;
  bool _isNotificationGranted = false;
  bool _isOverlayGranted = false;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final mic = await Permission.microphone.status;
    final notification = await Permission.notification.status;
    
    setState(() {
      _isMicGranted = mic.isGranted;
      _isNotificationGranted = notification.isGranted;
    });
  }

  Future<void> _requestMic() async {
    final status = await Permission.microphone.request();
    setState(() => _isMicGranted = status.isGranted);
  }

  Future<void> _requestNotification() async {
    final status = await Permission.notification.request();
    setState(() => _isNotificationGranted = status.isGranted);
  }

  Future<void> _requestUsage() async {
    setState(() => _isUsageGranted = true);
  }

  Future<void> _requestOverlay() async {
    setState(() => _isOverlayGranted = true);
  }

  bool get _allGranted => _isMicGranted && _isUsageGranted && _isNotificationGranted && _isOverlayGranted;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              FadeInDown(
                child: Text(
                  l10n.permissionsTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  l10n.permissionsSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.emerald.withOpacity(0.7),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              _PermissionTile(
                title: l10n.microphone,
                description: l10n.microphoneDesc,
                icon: Icons.mic_none_rounded,
                isGranted: _isMicGranted,
                onTap: _requestMic,
              ),
              _PermissionTile(
                title: l10n.usageStats,
                description: l10n.usageStatsDesc,
                icon: Icons.bar_chart_rounded,
                isGranted: _isUsageGranted,
                onTap: _requestUsage,
              ),
              _PermissionTile(
                title: l10n.notifications,
                description: l10n.notificationsDesc,
                icon: Icons.notifications_none_rounded,
                isGranted: _isNotificationGranted,
                onTap: _requestNotification,
              ),
              _PermissionTile(
                title: l10n.overlay,
                description: l10n.overlayDesc,
                icon: Icons.layers_outlined,
                isGranted: _isOverlayGranted,
                onTap: _requestOverlay,
              ),
              
              const Spacer(),
              
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _allGranted 
                    ? () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const AppSelectionScreen())
                      )
                    : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _allGranted ? AppColors.emerald : Colors.grey,
                  ),
                  child: Text(l10n.continueText),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isGranted;
  final VoidCallback onTap;

  const _PermissionTile({
    required this.title,
    required this.description,
    required this.icon,
    required this.isGranted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: (isGranted ? AppColors.gold : AppColors.emerald).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isGranted ? AppColors.gold : AppColors.emerald,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: isGranted 
          ? const Icon(Icons.check_circle, color: AppColors.gold)
          : ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                minimumSize: const Size(80, 36),
              ),
              child: Text(l10n.allow),
            ),
      ),
    );
  }
}
