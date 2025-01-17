import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/assets/images.dart';
import 'package:sklad/presentation/views/auth/forgot_password_confirm.dart';
import 'package:sklad/presentation/widgets/custom_snackbar.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/utils/formatters.dart';
import 'package:sklad/utils/my_function.dart';

class ForgotPasswordPhone extends StatefulWidget {
  const ForgotPasswordPhone({super.key});

  @override
  State<ForgotPasswordPhone> createState() => _ForgotPasswordPhoneState();
}

class _ForgotPasswordPhoneState extends State<ForgotPasswordPhone> {
  late TextEditingController controllerPhone;

  @override
  void initState() {
    controllerPhone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerPhone.dispose();
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
              "Сброс пароля",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "На данной странице Вы можете восстановить доступ к своему аккаунту. Введите Ваш номер телефона и система автоматически отправит Вам временный. код для сброса пароля.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: secondary500,
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              title: 'Номер телефона',
              controller: controllerPhone,
              keyboardType: TextInputType.phone,
              formatter: [Formatters.phoneFormatter],
              prefixIcon: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xFFEEEEEF),
                ),
                child: const Text(
                  '+998',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8F9194),
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return WButton(
                  onTap: () {
                    if (controllerPhone.text.isNotEmpty) {
                      context.read<AuthBloc>().add(SendCodeEvent(
                            phone:
                                '998${MyFunction.convertPhoneNumber(controllerPhone.text)}',
                            onSucces: (model) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgotPasswordConfirm(
                                  model: model,
                                  phone: controllerPhone.text,
                                ),
                              ));
                            },
                            onError: (model) {
                              CustomSnackbar.show(context, model);
                            },
                          ));
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
