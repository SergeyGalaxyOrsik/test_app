import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/common/app_colors.dart';
import 'package:test_app/feature/presentation/bloc/cart_bloc/add_to_cart_bloc.dart';
import 'package:test_app/feature/presentation/bloc/categories_list_cubit/categories_list_cubit.dart';
import 'package:test_app/feature/presentation/bloc/dishes_list_cubit/dishes_list_cubit.dart';
import 'package:test_app/feature/presentation/pages/main_screen.dart';
import 'package:test_app/locator_service.dart' as di;
import 'locator_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DishesListCubit>(
          create: (context) => sl<DishesListCubit>()..loadDishe(),
        ),
        BlocProvider<CategoriesListCubit>(
          create: (context) => sl<CategoriesListCubit>()..loadCategories(),
        ),
        BlocProvider<CartBloc>(create: (context) => sl<CartBloc>())
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          backgroundColor: AppColors.mainBackground,
          scaffoldBackgroundColor: AppColors.mainBackground
        ),
        home: const MainPage(),
      ),
    );
  }
}
