import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizations_ru.dart';
import 'localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('uz')
  ];

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @auth.
  ///
  /// In ru, this message translates to:
  /// **'Авторизация'**
  String get auth;

  /// No description provided for @authDes.
  ///
  /// In ru, this message translates to:
  /// **'Введите свои учетные данные для доступа к вашей учетной записи'**
  String get authDes;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @statistics.
  ///
  /// In ru, this message translates to:
  /// **'Статистика'**
  String get statistics;

  /// No description provided for @logOut.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logOut;

  /// No description provided for @list.
  ///
  /// In ru, this message translates to:
  /// **'Список'**
  String get list;

  /// No description provided for @active.
  ///
  /// In ru, this message translates to:
  /// **'Активный'**
  String get active;

  /// No description provided for @history.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get history;

  /// No description provided for @notIdentified.
  ///
  /// In ru, this message translates to:
  /// **'Неопознанный'**
  String get notIdentified;

  /// No description provided for @filter.
  ///
  /// In ru, this message translates to:
  /// **'Фильтр'**
  String get filter;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @identifiedUser.
  ///
  /// In ru, this message translates to:
  /// **'Опознанный пользователь'**
  String get identifiedUser;

  /// No description provided for @viewAll.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть все'**
  String get viewAll;

  /// No description provided for @lent.
  ///
  /// In ru, this message translates to:
  /// **'Одолжено'**
  String get lent;

  /// No description provided for @phoneNumer.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get phoneNumer;

  /// No description provided for @description.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get description;

  /// No description provided for @birthDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get birthDate;

  /// No description provided for @notifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get notifications;

  /// No description provided for @closed.
  ///
  /// In ru, this message translates to:
  /// **'Закрыто'**
  String get closed;

  /// No description provided for @light.
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In ru, this message translates to:
  /// **'Темная'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In ru, this message translates to:
  /// **'Системная'**
  String get system;

  /// No description provided for @lenguage.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get lenguage;

  /// No description provided for @changePhone.
  ///
  /// In ru, this message translates to:
  /// **'Изменить телефон'**
  String get changePhone;

  /// No description provided for @personalInformation.
  ///
  /// In ru, this message translates to:
  /// **'Персональная информация'**
  String get personalInformation;

  /// No description provided for @firstName.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get lastName;

  /// No description provided for @login.
  ///
  /// In ru, this message translates to:
  /// **'Войти в аккаунт'**
  String get login;

  /// No description provided for @confirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get confirm;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @goToMain.
  ///
  /// In ru, this message translates to:
  /// **'На главную'**
  String get goToMain;

  /// No description provided for @successful.
  ///
  /// In ru, this message translates to:
  /// **'Успешно'**
  String get successful;

  /// No description provided for @rateTheApp.
  ///
  /// In ru, this message translates to:
  /// **'Оцените приложение'**
  String get rateTheApp;

  /// No description provided for @theme.
  ///
  /// In ru, this message translates to:
  /// **'Тема'**
  String get theme;

  /// No description provided for @photofact.
  ///
  /// In ru, this message translates to:
  /// **'Фотодоказательство'**
  String get photofact;

  /// No description provided for @deletePhoto.
  ///
  /// In ru, this message translates to:
  /// **'Удалить фото'**
  String get deletePhoto;

  /// No description provided for @address.
  ///
  /// In ru, this message translates to:
  /// **'Адрес'**
  String get address;

  /// No description provided for @daysLeft.
  ///
  /// In ru, this message translates to:
  /// **'дней осталось'**
  String get daysLeft;

  /// No description provided for @allQuestions.
  ///
  /// In ru, this message translates to:
  /// **'Все вопросы'**
  String get allQuestions;

  /// No description provided for @refresh.
  ///
  /// In ru, this message translates to:
  /// **'Обновить'**
  String get refresh;

  /// No description provided for @date.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get date;

  /// No description provided for @aboutUs.
  ///
  /// In ru, this message translates to:
  /// **'О нас'**
  String get aboutUs;

  /// No description provided for @passingScore.
  ///
  /// In ru, this message translates to:
  /// **'Проходной балл'**
  String get passingScore;

  /// No description provided for @week.
  ///
  /// In ru, this message translates to:
  /// **'неделя'**
  String get week;

  /// No description provided for @day.
  ///
  /// In ru, this message translates to:
  /// **'день'**
  String get day;

  /// No description provided for @moon.
  ///
  /// In ru, this message translates to:
  /// **'месяц'**
  String get moon;

  /// No description provided for @tests.
  ///
  /// In ru, this message translates to:
  /// **'Тесты'**
  String get tests;

  /// No description provided for @goToIdentification.
  ///
  /// In ru, this message translates to:
  /// **'Перейти к идентификации'**
  String get goToIdentification;

  /// No description provided for @scanToLogin.
  ///
  /// In ru, this message translates to:
  /// **'Сканировать для входа'**
  String get scanToLogin;

  /// No description provided for @doYouWantToGoOut.
  ///
  /// In ru, this message translates to:
  /// **'Хочешь выйти?'**
  String get doYouWantToGoOut;

  /// No description provided for @yes.
  ///
  /// In ru, this message translates to:
  /// **'Да'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In ru, this message translates to:
  /// **'Нет'**
  String get no;

  /// No description provided for @enter.
  ///
  /// In ru, this message translates to:
  /// **'Входить'**
  String get enter;

  /// No description provided for @seconds.
  ///
  /// In ru, this message translates to:
  /// **'секунды'**
  String get seconds;

  /// No description provided for @register.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get register;

  /// No description provided for @support.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка'**
  String get support;

  /// No description provided for @frequentlyAskedQuestions.
  ///
  /// In ru, this message translates to:
  /// **'Часто задаваемые вопросы'**
  String get frequentlyAskedQuestions;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return AppLocalizationsRu();
    case 'uz': return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
