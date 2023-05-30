import 'package:comparateur_prix/models/Categorie.dart';
import 'package:comparateur_prix/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../http.dart';
import '../config/interceptor.dart';
import '../controllerConfig/base_controller.dart';
/*
class CategoriesController extends BaseController {

  /// VARIABLES
  final TextEditingController searchTextEditingController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final ApiService _catsServices = ApiService();
  List<Categorie> categoriesList = <Categorie>[];
  List<Categorie> searchResult = <Categorie>[];
  List<Categorie> categoriesCartList = <Categorie>[];
  bool isLoading = true;


  /// GET LIST OF BOOKS IN PAGE INITIALISATION
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  /// GET ALL BOOKS
  void getCategories() {
    loadingState();
      DioInterceptor.enableLoader();
    _catsServices.getCategories().then((List<Categorie>? response) {
      successState();
      if (response != null) {
        fillListCategories(response);
      } else {
        noDataState();
      }
    }).onError((error, stackTrace) {
      errorState();
    });
  }

  /// CLEAR SHOPPING CART
  void clearCart(){
    categoriesCartList = [];
    update();
  }

  /// SET THE LIST OF BOOKS
  void fillListCategories(List<Categorie> categories) {
    categoriesList.clear();
    categoriesList.addAll(categories);
    categoriesList.addAll(categories);
    update();
  }

  /// ADD BOOK TO CART
  void addToCart(Categorie categorie) {
    if(!categoriesCartList.contains(categorie)){
      categoriesCartList.add(categorie);
      Get.snackbar(
          "Succès",
          "Le categorie est ajouté dans votre panier",
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: const Duration(milliseconds: 800),
          duration: const Duration(milliseconds: 800)
      );
    }else{
      Get.snackbar(
          "Info",
          "Vous avez deja ajouter ce livre dans votre panier",
          icon: const Icon(Icons.error, color: Colors.white),
          snackPosition: SnackPosition.TOP,
          animationDuration: const Duration(milliseconds: 800),
          duration: const Duration(milliseconds: 800)
      );
    }

    update();
  }

  

  


}*/