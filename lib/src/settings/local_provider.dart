import 'package:flutter/material.dart';
import 'package:sklad/assets/constants/storage_keys.dart';
import 'package:sklad/infrastructure/repo/storage_repository.dart';
import 'package:sklad/l10n/localizations.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale(
    StorageRepository.getString(
      StorageKeys.LANGUAGE,
      defValue: 'ru',
    ),
  );
  Locale get locale => _locale;
  void setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _locale = locale;
    await StorageRepository.putString(
      StorageKeys.LANGUAGE,
      locale.languageCode,
    );
    notifyListeners();
  }
}
