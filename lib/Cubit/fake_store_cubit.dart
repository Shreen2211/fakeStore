import 'package:fake_store/Data/Network/DioHealper.dart';
import 'package:fake_store/Data/Network/endPoint.dart';
import 'package:fake_store/constant/Token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/Product.dart';

part 'fake_store_state.dart';

class FakeStoreCubit extends Cubit<FakeStoreState> {
  FakeStoreCubit() : super(FakeStoreInitial());

  static FakeStoreCubit get(context) =>
      BlocProvider.of<FakeStoreCubit>(context);
  TextEditingController? EmailController = TextEditingController();
  TextEditingController? PasswordController = TextEditingController();

  List<String> gategory=[];
  List<product> products=[];

  Future<void> post() async {
    emit(loadingLogingState());
    DioHealper.POST(
      endPoint: EndPoint.login,
      token: token.Token,
      body: {
        'username': EmailController?.text,
        'password': PasswordController?.text,
      },
    ).then((value) {
      print(value.data);
      emit(SucessLogingState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorLogingState());
      throw error;
    });
  }

  Future<void> Get() async {
    emit(loadingGetState());
    DioHealper.get(
      endPoint: EndPoint.End_Point,
    ).then((value) {
      gategory.clear();
      print(value.data);
      if(value.data!=null){
        gategory=value.data.cast<String>();
      }
      print(gategory);
      emit(SucessGetState());
    }).catchError((error) {
      print(error);
      emit(ErrorGetState());
      throw error;
    });
  }


  Future<void> getAllProduct() async{
    emit(loadingProductState());
    DioHealper.get(
      endPoint: EndPoint.product,
    ).then((value) {
      products.clear();
      for(var item in value.data){
        product pro=product.fromJson(item);
        products.add(pro);
      }
      print(products);
      emit(SucessProductState());
    }).catchError((error) {
      print(error);
      emit(ErrorProductState());
      throw error;
    });
  }

}
