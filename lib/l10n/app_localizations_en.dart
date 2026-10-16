// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pro Flutter Extensions';

  @override
  String get partOne => 'Extension Part 1';

  @override
  String get partTwo => 'Extension Part 2';

  @override
  String get partThree => 'Extension Part 3';

  @override
  String get partTwoTitle => 'Flutter Extensions — Part 2';

  @override
  String get contextExample => 'Context Extension Example';

  @override
  String get showSnackBar => 'Show SnackBar';

  @override
  String get profileSaved => 'Profile saved successfully!';
}
