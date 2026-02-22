import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:animate_do/animate_do.dart';
import 'package:tilawalock/l10n/app_localizations.dart';
import '../../core/constants/colors.dart';
import '../../core/theme/app_theme.dart';

class RecitationScreen extends StatefulWidget {
  const RecitationScreen({super.key});

  @override
  State<RecitationScreen> createState() => _RecitationScreenState();
}

class _RecitationScreenState extends State<RecitationScreen> with SingleTickerProviderStateMixin {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  // ignore: unused_field
  double _accuracy = 0.0;
  int _currentVerseIndex = 0;
  
  late AnimationController _waveController;

  final List<Map<String, String>> _verses = [
    {
      "arabic": "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
      "transliteration": "Bismillahir Rahmanir Rahim",
      "meaning": "In the name of Allah, the Entirely Merciful, the Especially Merciful."
    },
    {
      "arabic": "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
      "transliteration": "Alhamdu lillahi rabbil 'alamin",
      "meaning": "All praise is [due] to Allah, Lord of the worlds."
    },
    {
      "arabic": "الرَّحْمَٰنِ الرَّحِيمِ",
      "transliteration": "Ar-Rahmanir-Rahim",
      "meaning": "The Entirely Merciful, the Especially Merciful."
    },
    {
      "arabic": "مَالِكِ يَوْمِ الدِّينِ",
      "transliteration": "Maliki yawmid-din",
      "meaning": "Sovereign of the Day of Recompense."
    },
    {
      "arabic": "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
      "transliteration": "Iyyaka na'budu wa iyyaka nasta'in",
      "meaning": "It is You we worship and You we ask for help."
    }
  ];

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _accuracy = val.confidence;
            }
            if (_text.toLowerCase().contains("alhamdulillah")) {
               _handleNextVerse();
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _handleNextVerse() {
    if (_currentVerseIndex < _verses.length - 1) {
      setState(() {
        _currentVerseIndex++;
        _text = '';
      });
    } else {
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(l10n.mashaAllah),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             const Icon(Icons.check_circle, color: AppColors.gold, size: 60),
             const SizedBox(height: 16),
             Text(l10n.successMessage),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            child: Text(l10n.finish),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.timeForTilawa),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (_currentVerseIndex + 1) / _verses.length,
              backgroundColor: AppColors.gold.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.gold),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.verseCounter(_currentVerseIndex + 1, _verses.length),
              style: TextStyle(color: AppColors.emerald.withOpacity(0.6), fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            
            // Verse Card
            FadeInRight(
              key: ValueKey(_currentVerseIndex),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      _verses[_currentVerseIndex]["arabic"]!,
                      style: AppTheme.arabicStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _verses[_currentVerseIndex]["transliteration"]!,
                      style: const TextStyle(fontSize: 16, color: Colors.grey, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            const Spacer(),
            
            if (_text.isNotEmpty)
              FadeIn(
                child: Text(
                  _text,
                  style: const TextStyle(color: AppColors.emerald, fontWeight: FontWeight.w500),
                ),
              ),
            
            const SizedBox(height: 40),
            
            GestureDetector(
              onTap: _listen,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_isListening)
                    ...List.generate(3, (index) => _buildRipple(index)),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: _isListening ? Colors.red : AppColors.emerald,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: (_isListening ? Colors.red : AppColors.emerald).withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      _isListening ? Icons.stop : Icons.mic,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _isListening ? l10n.listening : l10n.tapToRecite,
              style: TextStyle(
                color: _isListening ? Colors.red : AppColors.emerald,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildRipple(int index) {
    return AnimatedBuilder(
      animation: _waveController,
      builder: (context, child) {
        double value = (_waveController.value + (index * 0.3)) % 1.0;
        return Container(
          width: 80 + (100 * value),
          height: 80 + (100 * value),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.red.withOpacity(1 - value),
              width: 2,
            ),
          ),
        );
      },
    );
  }
}
