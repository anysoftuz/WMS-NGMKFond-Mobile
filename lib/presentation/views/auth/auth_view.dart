import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/assets/images.dart';
import 'package:sklad/presentation/views/auth/forgot_password_phone.dart';
import 'package:sklad/presentation/widgets/custom_snackbar.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';
import 'package:sklad/utils/formatters.dart';
import 'package:sklad/utils/my_function.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late TextEditingController controllerPhone;
  late TextEditingController controllerPassword;

  @override
  void initState() {
    controllerPassword = TextEditingController();
    controllerPhone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerPhone.dispose();
    controllerPassword.dispose();
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
              "Войти в аккаунт",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Введите свои учетные данные для доступа к вашей учетной записи",
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
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Пароль',
              hintText: 'Введите',
              controller: controllerPassword,
              suffixIcon: AppIcons.eyeOff.svg(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: WScaleAnimation(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPhone(),
                  ));
                },
                child: const Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return WButton(
                  onTap: () {
                    if (controllerPassword.text.isNotEmpty &&
                        controllerPhone.text.isNotEmpty) {
                      context.read<AuthBloc>().add(LoginEvent(
                            phone:
                                '998${MyFunction.convertPhoneNumber(controllerPhone.text)}',
                            password: controllerPassword.text,
                            onError: (text) {
                              CustomSnackbar.show(context, text);
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
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'или',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: secondary500,
                    ),
                  ),
                ),
                Expanded(child: Divider())
              ],
            ),
            const SizedBox(height: 16),
            WButton(
              onTap: () {
                CustomSnackbar.show(
                  context,
                  "Yasash jarayonda",
                );
              },
              color: const Color(0xFF4825C2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ONE'),
                  const SizedBox(width: 8),
                  AppIcons.subtract.svg(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
