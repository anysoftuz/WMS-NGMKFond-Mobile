import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/views/home/create_request_view.dart';
import 'package:sklad/presentation/views/home/memo_create_view.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';

class CreateView extends StatefulWidget {
  const CreateView({super.key});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Создать")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CreateIteam(
              icon: AppIcons.notes,
              text: "Служебная записка",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MemoCreateView(),
                ));
              },
            ),
            // const SizedBox(height: 16),
            // CreateIteam(
            //   icon: AppIcons.fileSymlink,
            //   text: "Приход",
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => const CreateParishView(),
            //     ));
            //   },
            // ),
            const SizedBox(height: 16),
            CreateIteam(
              icon: AppIcons.request,
              text: "Запросы",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CreateRequestView(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CreateIteam extends StatelessWidget {
  const CreateIteam({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final String icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: whiteGrey,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon.svg(height: 40, width: 40),
            const SizedBox(height: 12),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: backgroundText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
