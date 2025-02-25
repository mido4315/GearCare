import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repos/auth_repo/auth_repo_impl.dart';



part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepoImpl authRepo;

  Future<void> userLogin({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await authRepo.userLogin(
      username: username,
      password: password,
    );
    result.fold(
      (failure)
      {

        emit(
          LoginFailure(failure.errorMessage),
        );
      },
      (user) {

        emit(
              LoginSuccess(),
        );
      },
    );
  }
}