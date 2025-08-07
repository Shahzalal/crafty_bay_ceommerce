import 'package:crafty_bay_ecommerce/app/app_routes.dart';
import 'package:crafty_bay_ecommerce/app/app_theme.dart';
import 'package:flutter/material.dart';

class CraftyBayEcommerce extends StatefulWidget {
  const CraftyBayEcommerce({super.key});

  @override
  State<CraftyBayEcommerce> createState() => _CraftyBayEcommerceState();
}

class _CraftyBayEcommerceState extends State<CraftyBayEcommerce> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme:AppTheme.lightThemeData ,
      onGenerateRoute:AppRoutes.routes,
    );
  }
}
