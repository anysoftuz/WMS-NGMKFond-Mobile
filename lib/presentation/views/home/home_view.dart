import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/views/home/warehouse_occupancy.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetVisitorsEvent());
    context.read<HomeBloc>().add(GetWarehouseCapacityEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                WarehouseOccupancy(
                  title: "Занятость складов",
                  subtitle: "Здесь будет текст",
                  icon: AppIcons.brandCodepen.svg(),
                  value1: state.warehouseCapacityModel.totalCapacity,
                  value2: state.warehouseCapacityModel.totalExist,
                ),
                const SizedBox(height: 24),
                WarehouseOccupancy(
                  title: "Количество посетителей",
                  subtitle: "Здесь будет текст",
                  icon: AppIcons.users.svg(),
                  value1: state.visitorsModel.visitors.free,
                  value2: state.visitorsModel.visitors.paid,
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
