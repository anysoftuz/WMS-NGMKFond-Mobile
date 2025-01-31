import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sklad/app/bloc/doc_create_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/infrastructure/core/service_locator.dart';
import 'package:sklad/infrastructure/repo/apis_repo_impl.dart';
import 'package:sklad/presentation/views/home/create_parish_view.dart';
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
      body: BlocProvider(
        create: (context) => DocCreateBloc(serviceLocator<ApisRepoImpl>()),
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CreateIteam(
                  icon: AppIcons.notes,
                  text: "Служебная записка",
                  onTap: () {
                    final bloc = context.read<DocCreateBloc>();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: bloc,
                        child: const MemoCreateView(),
                      ),
                    ));
                  },
                ),
                const SizedBox(height: 16),
                CreateIteam(
                  icon: AppIcons.fileSymlink,
                  text: "Приход",
                  onTap: () {
                    final bloc = context.read<DocCreateBloc>();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: bloc,
                        child: const CreateParishView(),
                      ),
                    ));
                  },
                ),
                const SizedBox(height: 16),
                CreateIteam(
                  icon: AppIcons.request,
                  text: "Запросы",
                  onTap: () {
                    final bloc = context.read<DocCreateBloc>();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: bloc,
                        child: const CreateRequestView(),
                      ),
                    ));
                  },
                ),
              ],
            ),
          );
        }),
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
