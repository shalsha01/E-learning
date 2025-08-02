// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CreateNewPasswordPage]
class CreateNewPasswordRoute extends PageRouteInfo<void> {
  const CreateNewPasswordRoute({List<PageRouteInfo>? children})
      : super(CreateNewPasswordRoute.name, initialChildren: children);

  static const String name = 'CreateNewPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateNewPasswordPage();
    },
  );
}

/// generated route for
/// [CreatePinScreen]
class CreatePinRoute extends PageRouteInfo<void> {
  const CreatePinRoute({List<PageRouteInfo>? children})
      : super(CreatePinRoute.name, initialChildren: children);

  static const String name = 'CreatePinRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreatePinScreen();
    },
  );
}

/// generated route for
/// [FillProfilePage]
class FillProfileRoute extends PageRouteInfo<void> {
  const FillProfileRoute({List<PageRouteInfo>? children})
      : super(FillProfileRoute.name, initialChildren: children);

  static const String name = 'FillProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FillProfilePage();
    },
  );
}

/// generated route for
/// [ForgotPasswordMethodPage]
class ForgotPasswordMethodRoute extends PageRouteInfo<void> {
  const ForgotPasswordMethodRoute({List<PageRouteInfo>? children})
      : super(ForgotPasswordMethodRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordMethodRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordMethodPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [IntroductionScreen]
class IntroductionRoute extends PageRouteInfo<void> {
  const IntroductionRoute({List<PageRouteInfo>? children})
      : super(IntroductionRoute.name, initialChildren: children);

  static const String name = 'IntroductionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IntroductionScreen();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [OTPVerificationPage]
class OTPVerificationRoute extends PageRouteInfo<OTPVerificationRouteArgs> {
  OTPVerificationRoute({
    Key? key,
    required String method,
    List<PageRouteInfo>? children,
  }) : super(
          OTPVerificationRoute.name,
          args: OTPVerificationRouteArgs(key: key, method: method),
          initialChildren: children,
        );

  static const String name = 'OTPVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OTPVerificationRouteArgs>();
      return OTPVerificationPage(key: args.key, method: args.method);
    },
  );
}

class OTPVerificationRouteArgs {
  const OTPVerificationRouteArgs({this.key, required this.method});

  final Key? key;

  final String method;

  @override
  String toString() {
    return 'OTPVerificationRouteArgs{key: $key, method: $method}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OTPVerificationRouteArgs) return false;
    return key == other.key && method == other.method;
  }

  @override
  int get hashCode => key.hashCode ^ method.hashCode;
}

/// generated route for
/// [PasswordResetSuccessPage]
class PasswordResetSuccessRoute extends PageRouteInfo<void> {
  const PasswordResetSuccessRoute({List<PageRouteInfo>? children})
      : super(PasswordResetSuccessRoute.name, initialChildren: children);

  static const String name = 'PasswordResetSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PasswordResetSuccessPage();
    },
  );
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterPage();
    },
  );
}
