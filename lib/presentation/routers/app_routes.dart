import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/data/models/managements_bases_model.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/views/auth/auth_view.dart';
import 'package:sklad/presentation/views/common/pdf_view.dart';
import 'package:sklad/presentation/views/error_view.dart';
import 'package:sklad/presentation/views/home/create_view.dart';
import 'package:sklad/presentation/views/home/filter_view.dart';
import 'package:sklad/presentation/views/home/home_view.dart';
import 'package:sklad/presentation/views/home/kitchen_warehouse_view.dart';
import 'package:sklad/presentation/views/home/notification_view.dart';
import 'package:sklad/presentation/views/memos/incoming_view.dart';
import 'package:sklad/presentation/views/memos/memos_drafts_view.dart';
import 'package:sklad/presentation/views/memos/outgoing_view.dart';
import 'package:sklad/presentation/views/home/pdf_info_view.dart';
import 'package:sklad/presentation/views/main_view.dart';
import 'package:sklad/presentation/views/overhead/overhead_incoming_view.dart';
import 'package:sklad/presentation/views/overhead/overhead_outgoing_view.dart';
import 'package:sklad/presentation/views/requests/received_view.dart';
import 'package:sklad/presentation/views/requests/requests_drafts_view.dart';
import 'package:sklad/presentation/views/requests/sent_view.dart';
import 'package:sklad/presentation/views/splash_view.dart';
import 'package:sklad/presentation/views/warehouse_bases/meat_warehouse_view.dart';
import 'package:sklad/presentation/views/warehouse_bases/rice_warehouse_view.dart';
import 'package:sklad/presentation/views/warehouse_bases/vegetable_warehouse_view.dart';

sealed class AppRouts {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRouteName.splash,
    errorBuilder: (context, state) => const ErrorView(),
    routes: [
      GoRoute(
        path: AppRouteName.auth,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        path: AppRouteName.errorFound,
        builder: (context, state) => const ErrorView(),
      ),
      GoRoute(
        path: AppRouteName.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRouteName.filter,
        builder: (context, state) => FilterView(
          controllerDate1: (state.extra as Map<String, dynamic>)['date1'],
          controllerNumber: (state.extra as Map<String, dynamic>)['number'],
          controllerTema: (state.extra as Map<String, dynamic>)['tema'],
          controllerKomu: (state.extra as Map<String, dynamic>)['komu'],
          controllerOtp: (state.extra as Map<String, dynamic>)['otp'],
          controllerDate2: (state.extra as Map<String, dynamic>)['date2'],
        ),
      ),
      GoRoute(
        path: AppRouteName.create,
        builder: (context, state) => const CreateView(),
      ),
      GoRoute(
        path: AppRouteName.pdfInfo,
        builder: (context, state) => const PdfInfoView(),
      ),
      GoRoute(
        path: AppRouteName.notification,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: AppRouteName.pdfView,
        builder: (context, state) => PDFViewerPage(
          title: (state.extra as Map<String, dynamic>)['title'] ?? '',
          id: (state.extra as Map<String, dynamic>)['id'] ?? '',
          onCancel: (state.extra as Map<String, dynamic>)['onCancel'],
          onSucces: (state.extra as Map<String, dynamic>)['onSucces'],
        ),
      ),
      mainView,
    ],
  );

  static final mainView = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MainView(navigationShell: navigationShell);
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.home,
            builder: (context, state) => const HomeView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.incoming,
            builder: (context, state) => const IncomingView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.outgoing,
            builder: (context, state) => const OutgoingView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.memosDrafts,
            builder: (context, state) => const MemosDraftsView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.received,
            builder: (context, state) => const ReceivedView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.sent,
            builder: (context, state) => const SentView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.requestsDrafts,
            builder: (context, state) => const RequestsDraftsView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.overheadIncoming,
            builder: (context, state) => const OverheadIncomingView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.overheadOutgoing,
            builder: (context, state) => const OverheadOutgoingView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.meatWarehouse,
            builder: (context, state) => MeatWarehouseView(
              model: state.extra as Base,
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.vegetableWarehouse,
            builder: (context, state) => const VegetableWarehouseView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.riceWarehouse,
            builder: (context, state) => const RiceWarehouseView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.kitchenWarehouse,
            builder: (context, state) => const KitchenWarehouseView(),
          ),
        ],
      ),
    ],
  );
}
