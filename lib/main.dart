

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import ' Screen/LoginScreen.dart';
import 'Cubit/fake_store_cubit.dart';
import 'Data/Network/DioHealper.dart';

void main()
{
  DioHealper.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context)=>FakeStoreCubit())
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginScreen(),
    ),
  ));
}