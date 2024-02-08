import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plateron_task/features/salad/bloc/salad_bloc.dart';
import 'package:plateron_task/features/salad/presentation/pages/salad_list_page.dart';
import 'package:plateron_task/features/salad/repository/salad_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salad Ordering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => SaladBloc(repository: SaladRepositoryImpl()),
        child: const SaladListPage(),
      ),
    );
  }
}
