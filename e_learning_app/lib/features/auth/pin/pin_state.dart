import 'package:flutter/foundation.dart';

@immutable
class PinState {
  final bool isLoading;
  final bool hasError;
  final String? error;

  const PinState({
    this.isLoading = false,
    this.hasError = false,
    this.error,
  });

  PinState copyWith({
    bool? isLoading,
    bool? hasError,
    String? error,
  }) {
    return PinState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error,
    );
  }

  factory PinState.initial() => const PinState();

  @override
  String toString() =>
      'PinState(isLoading: $isLoading, hasError: $hasError, error: $error)';
}
