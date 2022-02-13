
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 34 (17.0 per locale)
 *
 * Built on 2022-02-13 at 04:55 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	th, // 'th'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsTh _translationsTh = _StringsTh.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.th: return _translationsTh;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.th: return _StringsTh.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.th: return 'th';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.th: return const Locale.fromSubtags(languageCode: 'th');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'th': return AppLocale.th;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	late final _StringsEn _root = this;

	// Translations
	String get app => 'Password Input Examples';
	late final _StringsSwitchLocaleEn switchLocale = _StringsSwitchLocaleEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsMessageBoxEn messageBox = _StringsMessageBoxEn._(_root);
	late final _StringsHomePageEn homePage = _StringsHomePageEn._(_root);
}

// Path: switchLocale
class _StringsSwitchLocaleEn {
	_StringsSwitchLocaleEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get english => 'English';
	String get thai => 'ไทย';
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get close => 'Close';
	String get ok => 'OK';
	String get cancel => 'Cancel';
	String get yes => 'Yes';
	String get no => 'No';
	String get retry => 'Retry';
}

// Path: messageBox
class _StringsMessageBoxEn {
	_StringsMessageBoxEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get info => 'Information';
	String get warning => 'Warning';
	String get error => 'Error';
	String get question => 'Question';
}

// Path: homePage
class _StringsHomePageEn {
	_StringsHomePageEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get title => 'Home Page';
	String get username => 'Username';
	String get password => 'Password';
	String get ok => 'Login';
}

// Path: <root>
class _StringsTh implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTh.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsTh _root = this;

	// Translations
	@override String get app => 'ตัวอย่างการกรอกรหัสผ่าน';
	@override late final _StringsSwitchLocaleTh switchLocale = _StringsSwitchLocaleTh._(_root);
	@override late final _StringsCommonTh common = _StringsCommonTh._(_root);
	@override late final _StringsMessageBoxTh messageBox = _StringsMessageBoxTh._(_root);
	@override late final _StringsHomePageTh homePage = _StringsHomePageTh._(_root);
}

// Path: switchLocale
class _StringsSwitchLocaleTh implements _StringsSwitchLocaleEn {
	_StringsSwitchLocaleTh._(this._root);

	// ignore: unused_field
	@override final _StringsTh _root;

	// Translations
	@override String get english => 'English';
	@override String get thai => 'ไทย';
}

// Path: common
class _StringsCommonTh implements _StringsCommonEn {
	_StringsCommonTh._(this._root);

	// ignore: unused_field
	@override final _StringsTh _root;

	// Translations
	@override String get close => 'ปิด';
	@override String get ok => 'ตกลง';
	@override String get cancel => 'ยกเลิก';
	@override String get yes => 'ใช่';
	@override String get no => 'ไม่ใช่';
	@override String get retry => 'ลองใหม่';
}

// Path: messageBox
class _StringsMessageBoxTh implements _StringsMessageBoxEn {
	_StringsMessageBoxTh._(this._root);

	// ignore: unused_field
	@override final _StringsTh _root;

	// Translations
	@override String get info => 'ข้อมูลข่าวสาร';
	@override String get warning => 'แจ้งเตือน';
	@override String get error => 'เกิดข้อผิดพลาด';
	@override String get question => 'คำถาม';
}

// Path: homePage
class _StringsHomePageTh implements _StringsHomePageEn {
	_StringsHomePageTh._(this._root);

	// ignore: unused_field
	@override final _StringsTh _root;

	// Translations
	@override String get title => 'จุดเริ่มต้น';
	@override String get username => 'ชื่อผู้ใช้';
	@override String get password => 'รหัสผ่าน';
	@override String get ok => 'เข้าสู่ระบบ';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'app': 'Password Input Examples',
			'switchLocale.english': 'English',
			'switchLocale.thai': 'ไทย',
			'common.close': 'Close',
			'common.ok': 'OK',
			'common.cancel': 'Cancel',
			'common.yes': 'Yes',
			'common.no': 'No',
			'common.retry': 'Retry',
			'messageBox.info': 'Information',
			'messageBox.warning': 'Warning',
			'messageBox.error': 'Error',
			'messageBox.question': 'Question',
			'homePage.title': 'Home Page',
			'homePage.username': 'Username',
			'homePage.password': 'Password',
			'homePage.ok': 'Login',
		};
	}
}

extension on _StringsTh {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'app': 'ตัวอย่างการกรอกรหัสผ่าน',
			'switchLocale.english': 'English',
			'switchLocale.thai': 'ไทย',
			'common.close': 'ปิด',
			'common.ok': 'ตกลง',
			'common.cancel': 'ยกเลิก',
			'common.yes': 'ใช่',
			'common.no': 'ไม่ใช่',
			'common.retry': 'ลองใหม่',
			'messageBox.info': 'ข้อมูลข่าวสาร',
			'messageBox.warning': 'แจ้งเตือน',
			'messageBox.error': 'เกิดข้อผิดพลาด',
			'messageBox.question': 'คำถาม',
			'homePage.title': 'จุดเริ่มต้น',
			'homePage.username': 'ชื่อผู้ใช้',
			'homePage.password': 'รหัสผ่าน',
			'homePage.ok': 'เข้าสู่ระบบ',
		};
	}
}
