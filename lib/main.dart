import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'screens/login_signup_screen.dart';
import 'controller/fetchbiodatadetails_controller.dart';
import 'controller/showbiodata_controller.dart';
import 'controller/user_controller.dart';
import 'screens/AppTheme.dart';
import 'screens/home_screen/home_page.dart';
import 'screens/login_form.dart';
import 'screens/payment_screen.dart';
import 'screens/template_selection_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ShowbiodataController(),
        ),
        ChangeNotifierProvider(
          create: (_) => FetchbiodatadetailsController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Biodata Maker',
        theme: AppTheme.lightTheme,
        // home: HomePage(),
        home: const CheckAuth(),
        routes: {
          '/home': (context) => const HomePage(),
          '/login': (context) => LoginForm(
                onLoginSuccess: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
          // '/home': (context) => PaymentScreen(),
          '/BiodataPreviewPage': (context) => PaymentScreen(),
          '/alldetailpage': (context) => TemplateSelectionPage(
                id: '',
              ),
          // '/alldetailpage': (context) => TemplateDetailPage(selectedTemplateUrl: selectedTemplateUrl, biodata: biodata)
        },
      ),
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isLoading = true;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    print('isLoggedIn: $loggedIn'); // Debug print
    setState(() {
      isLoggedIn = loggedIn;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      if (isLoggedIn) {
        return const HomePage();
      } else {
        return LoginForm(
          onLoginSuccess: () {
            setState(() {
              isLoggedIn = true;
            });
            Navigator.pushReplacementNamed(context, '/home');
          },
        );
      }
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';

// void main() {
//   runApp(const MyApp());
// }

// mixin AppLocale {
//   static const String title = 'title';
//   static const String thisIs = 'thisIs';

//   static const Map<String, dynamic> EN = {
//     title: 'Localization',
//     thisIs: 'This is %a package, version %a.',
//   };
//   static const Map<String, dynamic> KM = {
//     title: 'ការធ្វើមូលដ្ឋានីយកម្ម',
//     thisIs: 'នេះគឺជាកញ្ចប់%a កំណែ%a.',
//   };
//   static const Map<String, dynamic> JA = {
//     title: 'ローカリゼーション',
//     thisIs: 'これは%aパッケージ、バージョン%aです。',
//   };
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final FlutterLocalization _localization = FlutterLocalization.instance;

//   @override
//   void initState() {
//     _localization.init(
//       mapLocales: [
//         const MapLocale(
//           'en',
//           AppLocale.EN,
//           countryCode: 'US',
//           fontFamily: 'Font EN',
//         ),
//         const MapLocale(
//           'km',
//           AppLocale.KM,
//           countryCode: 'KH',
//           fontFamily: 'Font KM',
//         ),
//         const MapLocale(
//           'ja',
//           AppLocale.JA,
//           countryCode: 'JP',
//           fontFamily: 'Font JA',
//         ),
//       ],
//       initLanguageCode: 'en',
//     );
//     _localization.onTranslatedLanguage = _onTranslatedLanguage;
//     super.initState();
//   }

//   void _onTranslatedLanguage(Locale? locale) {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       supportedLocales: _localization.supportedLocales,
//       localizationsDelegates: _localization.localizationsDelegates,
//       home: const SettingsScreen(),
//       theme: ThemeData(fontFamily: _localization.fontFamily),
//     );
//   }
// }

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   final FlutterLocalization _localization = FlutterLocalization.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(AppLocale.title.getString(context))),
//       body: Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     child: const Text('English'),
//                     onPressed: () {
//                       _localization.translate('en');
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 16.0),
//                 Expanded(
//                   child: ElevatedButton(
//                     child: const Text('ភាសាខ្មែរ'),
//                     onPressed: () {
//                       _localization.translate('km');
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 16.0),
//                 Expanded(
//                   child: ElevatedButton(
//                     child: const Text('日本語'),
//                     onPressed: () {
//                       _localization.translate('ja', save: false);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             ItemWidget(
//               title: 'Current Language',
//               content: _localization.getLanguageName(),
//             ),
//             ItemWidget(
//               title: 'Font Family',
//               content: _localization.fontFamily,
//             ),
//             ItemWidget(
//               title: 'Locale Identifier',
//               content: _localization.currentLocale.localeIdentifier,
//             ),
//             ItemWidget(
//               title: 'String Format',
//               content: Strings.format(
//                 'Hello %a, this is me %a.',
//                 ['Dara', 'Sopheak'],
//               ),
//             ),
//             ItemWidget(
//               title: 'Context Format String',
//               content: context.formatString(
//                 AppLocale.thisIs,
//                 [AppLocale.title, 'LATEST'],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ItemWidget extends StatelessWidget {
//   const ItemWidget({
//     super.key,
//     required this.title,
//     required this.content,
//   });

//   final String? title;
//   final String? content;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(child: Text(title ?? '')),
//           const Text(' : '),
//           Expanded(child: Text(content ?? '')),
//         ],
//       ),
//     );
//   }
// }
