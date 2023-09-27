// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_drive/presentation/views/garage_view.dart' as _i2;
import 'package:auto_drive/presentation/views/splash_view.dart' as _i3;
import 'package:auto_drive/presentation/widget/dashboard.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i4;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DashboardWidget.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardWidget(),
      );
    },
    GarageView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.GarageView(),
      );
    },
    SplashView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardWidget]
class DashboardWidget extends _i4.PageRouteInfo<void> {
  const DashboardWidget({List<_i4.PageRouteInfo>? children})
      : super(
          DashboardWidget.name,
          initialChildren: children,
        );

  static const String name = 'DashboardWidget';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GarageView]
class GarageView extends _i4.PageRouteInfo<void> {
  const GarageView({List<_i4.PageRouteInfo>? children})
      : super(
          GarageView.name,
          initialChildren: children,
        );

  static const String name = 'GarageView';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashView]
class SplashView extends _i4.PageRouteInfo<void> {
  const SplashView({List<_i4.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
