import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/home/presentation/views/update_product_view.dart';
import 'package:store_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case UpdateProductView.routeName:
      final product = settings.arguments as ProductModel;
      return MaterialPageRoute(builder: (_) => UpdateProductView(product: product));
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}
