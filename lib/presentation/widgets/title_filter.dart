import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/widgets/w_button.dart';

class TitileFilter extends StatefulWidget {
  const TitileFilter({
    super.key,
    required this.text,
    required this.onFilter,
  });
  final String text;
  final Function(
    TextEditingController controllerNumber,
    TextEditingController controllerTema,
    TextEditingController controllerKomu,
    TextEditingController controllerOtp,
    TextEditingController controllerDate1,
    TextEditingController controllerDate2,
  ) onFilter;

  @override
  State<TitileFilter> createState() => _TitileFilterState();
}

class _TitileFilterState extends State<TitileFilter> {
  late TextEditingController controllerNumber;
  late TextEditingController controllerTema;
  late TextEditingController controllerKomu;
  late TextEditingController controllerOtp;
  late TextEditingController controllerDate1;
  late TextEditingController controllerDate2;
  @override
  void initState() {
    controllerNumber = TextEditingController();
    controllerTema = TextEditingController();
    controllerKomu = TextEditingController();
    controllerOtp = TextEditingController();
    controllerDate1 = TextEditingController();
    controllerDate2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerNumber.dispose();
    controllerTema.dispose();
    controllerKomu.dispose();
    controllerOtp.dispose();
    controllerDate1.dispose();
    controllerDate2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 12),
        WButton(
          onTap: () {
            context.push(
              AppRouteName.filter,
              extra: {
                'date1': controllerDate1,
                'number': controllerNumber,
                'tema': controllerTema,
                'komu': controllerKomu,
                'otp': controllerOtp,
                'date2': controllerDate2,
              },
            ).then(
              (value) {
                if (value == true) {
                  widget.onFilter(
                    controllerNumber,
                    controllerTema,
                    controllerKomu,
                    controllerOtp,
                    controllerDate1,
                    controllerDate2,
                  );
                }
              },
            );
          },
          height: 52,
          width: 52,
          borderRadius: 20,
          color: whiteGrey,
          child: AppIcons.frame.svg(),
        ),
      ],
    );
  }
}
