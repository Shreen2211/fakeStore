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
  List<product> SingleProducts=[];

  Future<void> post() async {
    emit(loadingLogingState());
    DioHealper.POST(
      endPoint: EndPoint.login,
      token: token.Token,
      body: {
        'username': 'mor_2314',
        'password': '83r5^_'
      },
    ).then((value) {
      print(value.data);
      print('اشطر كتكوته');
      emit(SucessLogingState());
    }).catchError((error) {
      print(error.toString());
      print('every thing kharaaa');
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
      print('اشطر كتكوته2');
      print(gategory);
      emit(SucessGetState());
    }).catchError((error) {
      print(error);
      print('every thing kharaaa yl3nk');
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
      print('اشطر كتكوته2');
      emit(SucessProductState());
    }).catchError((error) {
      print(error);
      print('every thing kharaaa yl3n meteen 4akly');
      emit(ErrorProductState());
      throw error;
    });
  }

  Future<void> getSingleProduct() async{
    emit(loadingSingleProductState());
    DioHealper.get(
      endPoint: '${EndPoint.End_Point}/',
    ).then((value) {
      SingleProducts.clear();
      for(var item in value.data){
        product pro=product.fromJson(item);
        SingleProducts.add(pro);
      }
      print(SingleProducts);
      print('اشطر كتكوته2');
      emit(SucessSingleProductState());
    }).catchError((error) {
      print(error);
      print('every thing kharaaa yl3n meteen 4akly');
      emit(ErrorSingleProductState());
      throw error;
    });
  }
}
