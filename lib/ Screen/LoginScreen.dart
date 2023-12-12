import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/fake_store_cubit.dart';
import 'NewStore.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FakeStoreCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<FakeStoreCubit, FakeStoreState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit=FakeStoreCubit.get(context);
              return Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(18),
                      child: TextFormField(
                        controller:cubit.EmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email_outlined, color: Colors.pink,),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.pink,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.pink,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(18),
                      child: TextFormField(
                        controller:cubit.PasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText:true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.remove_red_eye_rounded,
                              color: Colors.pink,),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.pink,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.pink,
                                ),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.post().then((value){
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return  NewStore();
                          }));
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        width: double.infinity,
                        height: 50,

                        margin: const EdgeInsets.all(18),
                        child: const Center(child: Text('Login')),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

      ),
    );
  }
}
