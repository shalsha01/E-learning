// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get app_name => 'تليد';

  @override
  String get sign_in => 'تسجيل الدخول';

  @override
  String get sign_up => 'إنشاء حساب';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgot_password => 'نسيت كلمة المرور؟';

  @override
  String get remember_me => 'تذكرني';

  @override
  String get skip => 'تخطي';

  @override
  String get getting_started => 'لنبدأ!';

  @override
  String get login_subtitle => 'قم بتسجيل الدخول للمتابعة في الدورات.';

  @override
  String get register_subtitle => 'أنشئ حسابًا لتكمل جميع الدورات';

  @override
  String get agree_terms => 'أوافق على الشروط والأحكام';

  @override
  String get continueLabel => 'متابعة';

  @override
  String get skip_for_now => 'تخطي الآن';

  @override
  String get full_name => 'الاسم الكامل';

  @override
  String get nick_name => 'الاسم المستعار';

  @override
  String get dob => 'تاريخ الميلاد';

  @override
  String get gender => 'الجنس';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get fill_profile => 'املأ ملفك الشخصي';

  @override
  String get complete_profile => 'إكمال الملف الشخصي';

  @override
  String get fill_profile_subtitle => 'املأ بياناتك لتجربة أفضل';

  @override
  String get introTitle1 => 'تعلم عبر الإنترنت';

  @override
  String get introDesc1 =>
      'الوصول إلى آلاف الدورات والدراسة في أي وقت ومن أي مكان.';

  @override
  String get introTitle2 => 'تعلم في أي وقت';

  @override
  String get introDesc2 => 'تحكم في جدولك الدراسي وتعلم حسب وتيرتك.';

  @override
  String get introTitle3 => 'احصل على شهادة';

  @override
  String get introDesc3 => 'احصل على شهادات رسمية لتعزيز مسيرتك المهنية.';

  @override
  String get getStarted => 'لنبدأ';

  @override
  String get have_acount => 'لديك بالفعل حساب مسبقاً؟';

  @override
  String get dont_have_acount => 'ليس لديك اي حساب ؟';

  @override
  String get forgot_password_title => 'نسيت كلمة المرور';

  @override
  String get reset_password_instruction =>
      'حدد وسيلة الاتصال التي نستخدمها لإعادة تعيين كلمة المرور الخاصة بك';

  @override
  String get via_email => 'عبر البريد الإلكتروني';

  @override
  String get via_sms => 'عبر الرسائل النصية';

  @override
  String get code_sent_to => 'تم إرسال الكود إلى';

  @override
  String resend_code_in(Object seconds) {
    return 'يمكنك إعادة إرسال الكود خلال $seconds ثانية';
  }

  @override
  String get verify => 'تحقق';

  @override
  String get create_new_password_title => 'إنشاء كلمة مرور جديدة';

  @override
  String get password_reset_success_title => 'تهانينا';

  @override
  String get password_reset_success_message =>
      'تم إعداد حسابك. سيتم تحويلك إلى الصفحة الرئيسية خلال لحظات.';

  @override
  String get otp_example => '* * 8 *';

  @override
  String get email_required => 'البريد الإلكتروني مطلوب';

  @override
  String get password_required => 'كلمة المرور مطلوبة';

  @override
  String get full_name_required => 'الاسم الكامل مطلوب';

  @override
  String get nick_name_required => 'الاسم المستعار مطلوب';

  @override
  String get dob_required => 'تاريخ الميلاد مطلوب';

  @override
  String get phone_required => 'رقم الهاتف مطلوب';

  @override
  String get gender_required => 'يرجى اختيار الجنس';

  @override
  String get passwords_do_not_match => 'كلمتا المرور غير متطابقتين';

  @override
  String get fix_errors_first => 'يرجى تصحيح الأخطاء أولاً';
}
