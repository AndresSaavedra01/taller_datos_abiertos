import 'package:go_router/go_router.dart';
import '../views/dashboard_view.dart';
import '../views/listado_view.dart';
import '../views/detalle_view.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardView(),
    ),
    GoRoute(
      path: '/list/:type',
      builder: (context, state) {
        final type = state.pathParameters['type']!;
        return ListadoView(type: type);
      },
    ),
    GoRoute(
      path: '/detail/:type/:id',
      builder: (context, state) {
        final type = state.pathParameters['type']!;
        final id = state.pathParameters['id']!;
        return DetalleView(type: type, id: id);
      },
    ),
  ],
);
