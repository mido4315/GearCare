import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repos/auth_repo/auth_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepoImpl authRepo;

  Future<void> userRegister({
    required String name,
    required String phoneNumber,
    required String email,
    required String location,
    required String username,
    required String password,
    required String userType,
    required String latitude,
    required String longitude,
    File? photo,
  }) async {
    emit(RegisterLoading());
    var result = await authRepo.userRegister(
      name: name,
      phoneNumber: phoneNumber,
      email: email,
      location: location,
      username: username,
      password: password,
      userType: userType,
      photo: photo,
        latitude:latitude,
        longitude:longitude,
    );
    result.fold(
      (failure) => emit(
        RegisterFailure(failure.errorMessage),
      ),
      (user) => emit(
        RegisterSuccess(),
      ),
    );
  }
}