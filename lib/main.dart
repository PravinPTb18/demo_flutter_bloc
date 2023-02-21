import 'package:demo_flutter_bloc/pages/comments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_provider/comments_api_provider.dart';
import 'bloc/comments/comments_bloc.dart';
import 'bloc/favorites/favorites_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CommentsBloc>(
              create: (context) => CommentsBloc(CommentsApiProvider())),
          BlocProvider<FavoritesBloc>(create: (context) => FavoritesBloc())
        ],
        child: MaterialApp(
          title: 'Flutter Bloc',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.orange,
              appBarTheme: const AppBarTheme(
                  color: Colors.orange,
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),
          home: const CommentsPage(),
        ));
  }
}
