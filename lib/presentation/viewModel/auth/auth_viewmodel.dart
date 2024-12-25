
import 'package:devoida_task/presentation/viewModel/auth/states.dart';
import 'package:devoida_task/presentation/viewModel/auth/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/auth_repository.dart';
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.login(email, password);
      if (user != null) {
        emit(LoginSuccess(message: 'Login successful'));
      } else {
        emit(LoginError(error: 'Login failed'));
      }
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }
  Future<void> signUp(String fullName, String email, String password,String confirmPassword) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signUp(fullName, email, password, confirmPassword);
      if (user != null) {
        emit(RegisterSuccess(message: 'Account created successfully'));
        // You can navigate to another page if needed
      } else {
        emit(RegisterError(error: 'Sign up failed'));
      }
    } catch (e) {
      emit(RegisterError(error: e.toString()));
    }
  }
}

