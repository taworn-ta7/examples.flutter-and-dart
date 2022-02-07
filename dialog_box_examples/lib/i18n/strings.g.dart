
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 36 (18.0 per locale)
 *
 * Built on 2021-12-14 at 13:43 UTC
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
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.useDeviceLocale().languageTag
	static AppLocale useDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			return setLocaleRaw(deviceLocale);
		} else {
			return setLocale(_baseLocale);
		}
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
	static AppLocale setLocaleRaw(String localeRaw) {
		final selected = _selectLocale(localeRaw);
		return setLocale(selected ?? _baseLocale);
	}

	/// Gets current locale.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.currentLocale.languageTag
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.baseLocale.languageTag
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

// context enums

// interfaces generated as mixins

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _StringsEn._instance;
			case AppLocale.th: return _StringsTh._instance;
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

class _StringsEn {
	_StringsEn._(); // no constructor

	static final _StringsEn _instance = _StringsEn._();

	String get app => 'Dialog Box Examples';
	_StringsSwitchLocaleEn get switchLocale => _StringsSwitchLocaleEn._instance;
	_StringsCommonEn get common => _StringsCommonEn._instance;
	_StringsMessageBoxEn get messageBox => _StringsMessageBoxEn._instance;
	_StringsWaitBoxEn get waitBox => _StringsWaitBoxEn._instance;
	_StringsHomePageEn get homePage => _StringsHomePageEn._instance;

	/// A flat map containing all translations.
	dynamic operator[](String key) {
		return _translationMap[AppLocale.en]![key];
	}
}

class _StringsSwitchLocaleEn {
	_StringsSwitchLocaleEn._(); // no constructor

	static final _StringsSwitchLocaleEn _instance = _StringsSwitchLocaleEn._();

	String get english => 'English';
	String get thai => 'ไทย';
}

class _StringsCommonEn {
	_StringsCommonEn._(); // no constructor

	static final _StringsCommonEn _instance = _StringsCommonEn._();

	String get close => 'Close';
	String get ok => 'OK';
	String get cancel => 'Cancel';
	String get yes => 'Yes';
	String get no => 'No';
	String get retry => 'Retry';
}

class _StringsMessageBoxEn {
	_StringsMessageBoxEn._(); // no constructor

	static final _StringsMessageBoxEn _instance = _StringsMessageBoxEn._();

	String get info => 'Information';
	String get warning => 'Warning';
	String get error => 'Error';
	String get question => 'Question';
}

class _StringsWaitBoxEn {
	_StringsWaitBoxEn._(); // no constructor

	static final _StringsWaitBoxEn _instance = _StringsWaitBoxEn._();

	String get message => 'Please wait...';
}

class _StringsHomePageEn {
	_StringsHomePageEn._(); // no constructor

	static final _StringsHomePageEn _instance = _StringsHomePageEn._();

	String get title => 'Home Page';
	String get messageBoxTest => 'Test, testing, tested.';
	String get inputBoxTest => 'Input Value';
	String get inputBoxHintTest => 'Input anything to test';
}

class _StringsTh implements _StringsEn {
	_StringsTh._(); // no constructor

	static final _StringsTh _instance = _StringsTh._();

	@override String get app => 'ตัวอย่าง Dialog Box';
	@override _StringsSwitchLocaleTh get switchLocale => _StringsSwitchLocaleTh._instance;
	@override _StringsCommonTh get common => _StringsCommonTh._instance;
	@override _StringsMessageBoxTh get messageBox => _StringsMessageBoxTh._instance;
	@override _StringsWaitBoxTh get waitBox => _StringsWaitBoxTh._instance;
	@override _StringsHomePageTh get homePage => _StringsHomePageTh._instance;

	/// A flat map containing all translations.
	@override
	dynamic operator[](String key) {
		return _translationMap[AppLocale.th]![key];
	}
}

class _StringsSwitchLocaleTh implements _StringsSwitchLocaleEn {
	_StringsSwitchLocaleTh._(); // no constructor

	static final _StringsSwitchLocaleTh _instance = _StringsSwitchLocaleTh._();

	@override String get english => 'English';
	@override String get thai => 'ไทย';
}

class _StringsCommonTh implements _StringsCommonEn {
	_StringsCommonTh._(); // no constructor

	static final _StringsCommonTh _instance = _StringsCommonTh._();

	@override String get close => 'ปิด';
	@override String get ok => 'ตกลง';
	@override String get cancel => 'ยกเลิก';
	@override String get yes => 'ใช่';
	@override String get no => 'ไม่ใช่';
	@override String get retry => 'ลองใหม่';
}

class _StringsMessageBoxTh implements _StringsMessageBoxEn {
	_StringsMessageBoxTh._(); // no constructor

	static final _StringsMessageBoxTh _instance = _StringsMessageBoxTh._();

	@override String get info => 'ข้อมูลข่าวสาร';
	@override String get warning => 'แจ้งเตือน';
	@override String get error => 'เกิดข้อผิดพลาด';
	@override String get question => 'คำถาม';
}

class _StringsWaitBoxTh implements _StringsWaitBoxEn {
	_StringsWaitBoxTh._(); // no constructor

	static final _StringsWaitBoxTh _instance = _StringsWaitBoxTh._();

	@override String get message => 'โปรดรอสักครู่...';
}

class _StringsHomePageTh implements _StringsHomePageEn {
	_StringsHomePageTh._(); // no constructor

	static final _StringsHomePageTh _instance = _StringsHomePageTh._();

	@override String get title => 'จุดเริ่มต้น';
	@override String get messageBoxTest => 'ทดสอบ, กำลังทดสอบ, ทดสอบเสร็จแล้ว';
	@override String get inputBoxTest => 'ใส่ค่า';
	@override String get inputBoxHintTest => 'ใส่ค่าอะไรก็ได้เพื่อทดสอบ';
}

/// A flat map containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
late Map<AppLocale, Map<String, dynamic>> _translationMap = {
	AppLocale.en: {
		'app': 'Dialog Box Examples',
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
		'waitBox.message': 'Please wait...',
		'homePage.title': 'Home Page',
		'homePage.messageBoxTest': 'Test, testing, tested.',
		'homePage.inputBoxTest': 'Input Value',
		'homePage.inputBoxHintTest': 'Input anything to test',
	},
	AppLocale.th: {
		'app': 'ตัวอย่าง Dialog Box',
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
		'waitBox.message': 'โปรดรอสักครู่...',
		'homePage.title': 'จุดเริ่มต้น',
		'homePage.messageBoxTest': 'ทดสอบ, กำลังทดสอบ, ทดสอบเสร็จแล้ว',
		'homePage.inputBoxTest': 'ใส่ค่า',
		'homePage.inputBoxHintTest': 'ใส่ค่าอะไรก็ได้เพื่อทดสอบ',
	},
};
