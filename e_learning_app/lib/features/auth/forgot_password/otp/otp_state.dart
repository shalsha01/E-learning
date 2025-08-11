class OTPState {
  final bool isLoading;
  final String? errorMessage;

  const OTPState({
    required this.isLoading,
    required this.errorMessage,
  });

  factory OTPState.initial() => const OTPState(isLoading: false, errorMessage: null);

  get isVerified => null;

  OTPState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return OTPState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
