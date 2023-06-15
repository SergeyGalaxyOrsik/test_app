import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocProvider<CategoriesListCubit>(
          create: (context) => sl<CategoriesListCubit>()..loadCategories(),
        ),
        BlocProvider<DishesListCubit>(
          create: (context) => sl<DishesListCubit>(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
