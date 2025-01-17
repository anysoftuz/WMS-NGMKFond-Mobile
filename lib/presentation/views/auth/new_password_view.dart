import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/assets/images.dart';
import 'package:sklad/data/models/send_code_model.dart';
import 'package:sklad/presentation/widgets/custom_snackbar.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_button.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({
    super.key,
    required this.model,
    required this.phone,
    required this.code,
  });
  final SendCodeModel model;
  final String phone;
  final String code;

  @override
  State<NewPasswordView> createState() => _ForgotPasswordPhoneState();
}

class _ForgotPasswordPhoneState extends State<NewPasswordView> {
  late TextEditingController controllerPhone;
  late TextEditingController controllerCode;

  @override
  void initState() {
    controllerPhone = TextEditingController();
    controllerCode = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerPhone.dispose();
    controllerCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                AppImages.rus.imgAsset(),
                const SizedBox(width: 8),
                const Text(
                  'Русский',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: blue,
                  ),
                ),
                const SizedBox(width: 4),
                AppIcons.chevronDown.svg(color: blue),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImages.logo.imgAsset(),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ФОНД",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'НГМК',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: secondary500,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Установления нового постоянного пароля",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "НВведите свои учетные данные для доступа к вашей учетной записи",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: secondary500,
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              title: 'Новый пароль',
              hintText: 'Введите',
              controller: controllerCode,
              suffixIcon: AppIcons.eyeOff.svg(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Подтвердите пароль',
              hintText: 'Введите',
              controller: controllerPhone,
              suffixIcon: AppIcons.eyeOff.svg(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return WButton(
                  onTap: () {
                    if (controllerPhone.text.isNotEmpty &&
                        controllerCode.text.isNotEmpty) {
                      if (controllerPhone.text == controllerCode.text) {
                        context.read<AuthBloc>().add(ForgotPasswordEvent(
                              phone: widget.phone,
                              onError: (text) {
                                CustomSnackbar.show(context, text);
                              },
                              code: widget.code,
                              otpSessionId: widget.model.otp.sessionId,
                              newPassword: controllerCode.text,
                              onSucces: () {
                                Navigator.of(context)
                                  ..pop()
                                  ..pop()
                                  ..pop();
                              },
                            ));
                      } else {
                        CustomSnackbar.show(context, 'Kod birhil emas');
                      }
                    } else {
                      CustomSnackbar.show(
                        context,
                        "To'liq malumotni kirgazing",
                      );
                    }
                  },
                  isLoading: state.status.isInProgress,
                  text: 'Войти',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
