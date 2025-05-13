import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslation extends StatefulWidget {
  const LanguageTranslation({super.key});

  @override
  State<LanguageTranslation> createState() => _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslation> {
  final List<String> languages = [
    'English', 'Mandarin Chinese', 'Hindi', 'Spanish', 'French', 'Standard Arabic',
    'Bengali', 'Russian', 'Portuguese', 'Urdu', 'Indonesian', 'German',
    'Japanese', 'Swahili', 'Marathi', 'Telugu', 'Turkish', 'Tamil',
    'Vietnamese', 'Italian', 'Korean', 'Hausa', 'Javanese', 'Egyptian Arabic',
    'Gujarati', 'Iranian Persian', 'Bhojpuri', 'Western Punjabi', 'Yue Chinese',
    'Thai', 'Dutch', 'Cantonese', 'Polish', 'Pashto', 'Kannada',
    'Malayalam', 'Sundanese', 'Romanian', 'Odia', 'Maithili', 'Hungarian',
    'Chhattisgarhi', 'Cebuano', 'Greek', 'Amharic', 'Sinhalese', 'Ukrainian',
    'Malay', 'Uzbek', 'Serbo-Croatian', 'Tagalog', 'Azerbaijani', 'Nepali',
    'Assamese', 'Madurese', 'Kazakh', 'Saraiki', 'Haitian Creole', 'Zulu',
    'Czech', 'Swedish', 'Belarusian', 'Bulgarian', 'Hebrew', 'Kurdish',
    'Quechua', 'Kinyarwanda', 'Slovak', 'Xhosa', 'Tigrinya', 'Danish',
    'Finnish', 'Norwegian', 'Lithuanian', 'Slovenian', 'Latvian', 'Bosnian',
    'Macedonian', 'Tajik', 'Fula', 'Shona', 'Tatar', 'Burmese',
    'Somali', 'Mongolian', 'Afrikaans', 'Lao', 'Armenian', 'Yoruba',
    'Igbo', 'Khmer', 'Malagasy', 'Georgian', 'Tongan', 'Wolof',
    'Tswana', 'Fijian', 'Bislama', 'Tok Pisin', 'Esperanto', 'Chewa'
  ];

  String? originLanguage;
  String? destinationLanguage;
  String output = "";
  bool isLoading = false;

  final TextEditingController languageController = TextEditingController();
  final translator = GoogleTranslator();

  void translate(String src, String dest, String input) async {
    if (input.isEmpty) {
      setState(() {
        output = 'Please enter text to translate';
        isLoading = false;
      });
      return;
    }

    setState(() => isLoading = true);

    try {
      var translation = await translator.translate(input, from: src, to: dest);
      setState(() {
        output = translation.text.toString();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        output = 'Failed to translate: ${e.toString()}';
        isLoading = false;
      });
    }
  }

  String getLanguageCode(String language) {
    const languageCodes = {
      'English': 'en',
      'Mandarin Chinese': 'zh',
      'Hindi': 'hi',
      'Spanish': 'es',
      'French': 'fr',
      'Standard Arabic': 'ar',
      'Bengali': 'bn',
      'Russian': 'ru',
      'Portuguese': 'pt',
      'Urdu': 'ur',
      'Indonesian': 'id',
      'German': 'de',
      'Japanese': 'ja',
      'Swahili': 'sw',
      'Marathi': 'mr',
      'Telugu': 'te',
      'Turkish': 'tr',
      'Tamil': 'ta',
      'Vietnamese': 'vi',
      'Italian': 'it',
      'Korean': 'ko',
      'Hausa': 'ha',
      'Javanese': 'jv',
      'Egyptian Arabic': 'arz',
      'Gujarati': 'gu',
      'Iranian Persian': 'fa',
      'Bhojpuri': 'bho',
      'Western Punjabi': 'pnb',
      'Yue Chinese': 'yue',
      'Thai': 'th',
      'Dutch': 'nl',
      'Cantonese': 'yue',
      'Polish': 'pl',
      'Pashto': 'ps',
      'Kannada': 'kn',
      'Malayalam': 'ml',
      'Sundanese': 'su',
      'Romanian': 'ro',
      'Odia': 'or',
      'Maithili': 'mai',
      'Hungarian': 'hu',
      'Chhattisgarhi': 'hne',
      'Cebuano': 'ceb',
      'Greek': 'el',
      'Amharic': 'am',
      'Sinhalese': 'si',
      'Ukrainian': 'uk',
      'Malay': 'ms',
      'Uzbek': 'uz',
      'Serbo-Croatian': 'sh',
      'Tagalog': 'tl',
      'Azerbaijani': 'az',
      'Nepali': 'ne',
      'Assamese': 'as',
      'Madurese': 'mad',
      'Kazakh': 'kk',
      'Saraiki': 'skr',
      'Haitian Creole': 'ht',
      'Zulu': 'zu',
      'Czech': 'cs',
      'Swedish': 'sv',
      'Belarusian': 'be',
      'Bulgarian': 'bg',
      'Hebrew': 'he',
      'Kurdish': 'ku',
      'Quechua': 'qu',
      'Kinyarwanda': 'rw',
      'Slovak': 'sk',
      'Xhosa': 'xh',
      'Tigrinya': 'ti',
      'Danish': 'da',
      'Finnish': 'fi',
      'Norwegian': 'no',
      'Lithuanian': 'lt',
      'Slovenian': 'sl',
      'Latvian': 'lv',
      'Bosnian': 'bs',
      'Macedonian': 'mk',
      'Tajik': 'tg',
      'Fula': 'ff',
      'Shona': 'sn',
      'Tatar': 'tt',
      'Burmese': 'my',
      'Somali': 'so',
      'Mongolian': 'mn',
      'Afrikaans': 'af',
      'Lao': 'lo',
      'Armenian': 'hy',
      'Yoruba': 'yo',
      'Igbo': 'ig',
      'Khmer': 'km',
      'Malagasy': 'mg',
      'Georgian': 'ka',
      'Tongan': 'to',
      'Wolof': 'wo',
      'Tswana': 'tn',
      'Fijian': 'fj',
      'Bislama': 'bi',
      'Tok Pisin': 'tpi',
      'Esperanto': 'eo',
      'Chewa': 'ny',
    };

    return languageCodes[language] ?? 'en';
  }

  @override
  void dispose() {
    languageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xff1a2d4d),
        appBar: AppBar(
        title: const Text('Language Translator',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
    centerTitle: true,
    elevation: 8,
    leading: const Icon(Icons.translate, color: Colors.white, size: 28),
    backgroundColor: const Color(0xff10223d),
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    ),
        ),
                body: SafeArea(
    child: SingleChildScrollView(
    padding: EdgeInsets.symmetric(
    horizontal: size.width * 0.05,
    vertical: size.height * 0.02
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    // Language Selection Section
    Card(
    elevation: 5,
    color: Colors.white.withOpacity(0.1),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    side: BorderSide(color: Colors.white.withOpacity(0.3), width: 1),
    ),
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    children: [
    const Text('Translate From',
    style: TextStyle(color: Colors.white70, fontSize: 16)),
    const SizedBox(height: 8),
    _buildLanguageDropdown(
    value: originLanguage,
    hint: 'Select source language',
    onChanged: (value) => setState(() => originLanguage = value),
    ),
    const SizedBox(height: 20),
    const Icon(Icons.arrow_downward, color: Colors.white, size: 30),
    const SizedBox(height: 20),
    const Text('Translate To',
    style: TextStyle(color: Colors.white70, fontSize: 16)),
    const SizedBox(height: 8),
    _buildLanguageDropdown(
    value: destinationLanguage,
    hint: 'Select target language',
    onChanged: (value) => setState(() => destinationLanguage = value),
    ),
    ],
    ),
    ),
    ),

    const SizedBox(height: 25),

    // Input Section
    TextField(
    maxLines: isPortrait ? 4 : 2,
    cursorColor: Colors.blueAccent,
    style: const TextStyle(color: Colors.white, fontSize: 18),
    controller: languageController,
    decoration: InputDecoration(
    labelText: 'Enter Text to Translate',
    labelStyle: const TextStyle(color: Colors.white70, fontSize: 16),
    hintText: 'Type something...',
    hintStyle: const TextStyle(color: Colors.white54),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
    borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.lightBlue, width: 2),
    borderRadius: BorderRadius.circular(12),
    ),
    filled: true,
    fillColor: Colors.white.withOpacity(0.15),
    contentPadding: const EdgeInsets.all(16),
    ),
    ),

    const SizedBox(height: 20),

    // Translate Button
    ElevatedButton(
    onPressed: isLoading ? null : () {
    if (originLanguage == null || destinationLanguage == null) {
    setState(() => output = 'Please select both languages');
    return;
    }
    translate(
    getLanguageCode(originLanguage!),
    getLanguageCode(destinationLanguage!),
    languageController.text.trim(),
    );
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xff3a5a8a),
    foregroundColor: Colors.white,
    elevation: 6,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.symmetric(vertical: 16),
    shadowColor: Colors.blueAccent.withOpacity(0.5),
    ),
    child: isLoading
    ? const SizedBox(
    height: 24,
    width: 24,
    child: CircularProgressIndicator(
    strokeWidth: 3,
    color: Colors.white,
    ),
    )
        : const Text('TRANSLATE',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ),

      SizedBox(height: 25),

    // Output Section
    Container(
    decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.1),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.white.withOpacity(0.3)),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text('Translation:',
    style: TextStyle(color: Colors.white70, fontSize: 16)),
    const SizedBox(height: 10),
    Text(
    output.isEmpty ? 'Translation will appear here...' : output,
    style: TextStyle(
    color: output.isEmpty ? Colors.white54 : Colors.white,
    fontSize: 18,
    fontWeight: output.isEmpty ? FontWeight.normal : FontWeight.w500,
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    ),
    );
  }

  Widget _buildLanguageDropdown({
    required String? value,
    required String hint,
    required void Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.2),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        hint: Text(hint, style: const TextStyle(color: Colors.white70)),
        dropdownColor: const Color(0xff2b3c5a),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        iconSize: 28,
        underline: const SizedBox(),
        items: languages.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}