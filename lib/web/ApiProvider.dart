import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tasknew/data/ProductlistStatus.dart';
import 'package:tasknew/data/product_list_entity.dart';
import 'package:tasknew/models/login_response.dart';

import '../data/registration_response.dart';


class ApiProvider {
Dio dio=new Dio();
  final String _url = 'https://fakestoreapi.com/';

Future<LoginResponse> authenticate(String username,String password) async {
  try {
    String fullurl=_url+"auth/login";
    print(fullurl);

    Response response = await dio.post(fullurl,data: {'username': username, 'password': password});
    print(response.data.toString());

    return LoginResponse.fromJson(response.data);
  } catch (error, stacktrace) {
    print("Exception occured: $error stackTrace: $stacktrace");
    return LoginResponse.fromJson(  {
      "token": "No data found"
    });

  }
}


Future<RegistrationResponse> register(Map m) async {
  try {
    String fullurl=_url+"users";
    print(fullurl);

    Response response = await dio.post(fullurl,data: m);

    print(response.data.toString());
    return RegistrationResponse.fromJson(response.data);
  } catch (error, stacktrace) {
    print("Exception occured: $error stackTrace: $stacktrace");
    return RegistrationResponse.fromJson(  {
      "id": "0"
    });

  }
}


Future<ProductlistStatus> getproducts() async {
  try {
    String fullurl=_url+"products";
    print(fullurl);

    Response response = await dio.get(fullurl);

    print(response.data.toString());
    List<ProductListEntity>allproducts=[];

    List<dynamic> js=response.data;
    for(int i=0;i<js.length;i++)
      {
var a=js[i];
ProductListEntity productListEntity=ProductListEntity.fromJson(a);
allproducts.add(productListEntity);
      }

ProductlistStatus plstatus=new ProductlistStatus();
    plstatus.plistentity=allproducts;
    plstatus.status=1;


    return plstatus;
  } catch (error, stacktrace) {
    print("Exception occured: $error stackTrace: $stacktrace");
    ProductlistStatus plstatus=new ProductlistStatus();
    plstatus.status=1;

    return plstatus;

  }
}


}