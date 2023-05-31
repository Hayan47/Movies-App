// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/app_router.dart';

import 'business_logic/cubit/favorite_cubit.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteCubit favoriteCubit = FavoriteCubit([]);
    return BlocProvider(
      create: (context) => favoriteCubit,
      child: MaterialApp(
        theme: ThemeData(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
