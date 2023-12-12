import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/fake_store_cubit.dart';

class NewStore extends StatelessWidget {
  NewStore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: FakeStoreCubit.get(context)
        ..Get()
        ..getAllProduct(),
      child: Scaffold(
        body: SafeArea(child: BlocBuilder<FakeStoreCubit, FakeStoreState>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pink,
                          ),
                          child: Center(
                              child: Text(
                            FakeStoreCubit.get(context).gategory[index],
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          )),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 15);
                    },
                    itemCount: FakeStoreCubit.get(context).gategory.length,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Products',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                              height: 160,
                              width: double.infinity,
                              child: Image.network(
                                FakeStoreCubit.get(context)
                                    .products[index]
                                    .image as String,
                              )),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  FakeStoreCubit.get(context)
                                      .products[index]
                                      .title as String,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                FakeStoreCubit.get(context)
                                    .products[index]
                                    .rating!
                                    .rate
                                    .toString(),
                                style: TextStyle(color: Colors.black38),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              '${FakeStoreCubit.get(context).products[index].price.toString()}\$',
                              textAlign: TextAlign.start)
                        ],
                      ),
                    );
                  },
                  itemCount: FakeStoreCubit.get(context).products.length,
                )
              ],
            );
          },
        )),
      ),
    );
  }
}
