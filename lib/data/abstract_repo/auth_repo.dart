import 'package:sklad/data/common/login_model.dart';
import 'package:sklad/data/common/response_model.dart';
import 'package:sklad/data/common/token_model.dart';
import 'package:sklad/data/models/forget_password_model.dart';
import 'package:sklad/data/models/send_code_model.dart';
import 'package:sklad/data/models/user_model.dart';
import 'package:sklad/data/models/verify_code_model.dart';
import 'package:sklad/infrastructure/core/exceptions/failures.dart';
import 'package:sklad/utils/either.dart';

abstract class AuthRepo {
  Future<Either<Failure, ResponseModel<UserModel>>> getMe();
  Future<Either<Failure, ResponseModel<SendCodeModel>>> postSendCode(
    String phone,
  );
  Future<Either<Failure, ResponseModel<bool>>> postForgotPassword(
    ForgetPasswordModel model,
  );
  Future<Either<Failure, ResponseModel<bool>>> postVerifyCode(
    VerifyCodeModel model,
  );
  Future<Either<Failure, ResponseModel<TokenModel>>> postLogin(
    LoginModel model,
  );
  Future<Either<Failure, ResponseModel<TokenModel>>> refreshToken();
  Future<Either<Failure, bool>> logout();
}
