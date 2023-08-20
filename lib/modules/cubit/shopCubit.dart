import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvix/models/CategoriesModel/categoriesModel.dart';
import 'package:marvix/models/productsModel/ProductsModel.dart';
import 'package:marvix/models/userLoginModel/LoginModel.dart';
import 'package:marvix/modules/cart/cart.dart';
import 'package:marvix/modules/categories/categories.dart';
import 'package:marvix/modules/cubit/shopCubitStates.dart';
import 'package:marvix/modules/profile/profile.dart';
import 'package:marvix/shared/network/local/cacheHelper.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../shared/Components/constants.dart';
import '../../shared/network/remote/dioHelper.dart';
import '../../shared/network/remote/endpoints.dart';
import '../home/home.dart';


class ShopCubit extends Cubit<ShopCubitStates>
{
  ShopCubit() : super(ShopInitialState());
  static ShopCubit of(context) => BlocProvider.of(context);

  int screenIndex = 0;
  List<Widget> screens = [const Home(), const Categories(), const Cart(),
    const Profile()];

  UserModel? userModel;
  int productSum = 0;
  List<dynamic>? receivedProductsJson;
  List<dynamic>? receivedCategoriesJson;
  List<ProductsModel>? products = [];
  List<CategoryModel>? categories = [];
  List<ProductsModel>? cart = [];
  List<int?> cartPrices = [];
  ProductsModel? productsModel;
  String? displayName;
  Widget? startUpScreen;
  List<List<Color>> colors = [];
  List<int> productCounts = [];
  int productsDisplayCounter = 0;
  int total = 0;
  Map<int?, int>? favorites = {};
  List<ProductsModel>? favoritesItems = [];
  List<ProductsModel>? searchResult = [];
  List<Map<int, dynamic>> recFakeItems = [];
  ThemeMode? theme;
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController nameCon = TextEditingController();
  TextEditingController avatarCon = TextEditingController();

  void changeScreen(int index) {
    screenIndex = index;

    if(index == 3)
    {
      receiveUserData();
    }
    emit(ShopChangeState());
  }

  void receiveUserData() {
    emit(ShopGetUserDataLoadingState());
    CacheHelper.getData("token");
    DioHelper.getData(url: AUTHORIZATION,
        query: {}, token: "Bearer ${CacheHelper.getData("token")}").then((value)
    {
      userModel = UserModel.fromJson(value?.data);
      displayName = userModel?.name ?? "None";
      USERID = userModel?.id ?? 0;
      emailCon.text = userModel!.email!;
      passwordCon.text = userModel!.password!;
      nameCon.text = userModel!.name!;
      avatarCon.text = userModel!.avatar!;

      emit(ShopGetUserDataSuccessState());
    }).catchError((error)
    {
      emit(ShopGetUserDataFailState());
    });
  }

  void editUserData(String email, String password,
      String name, String avatar) {
    emit(ShopEditUserDataLoadingState());
    String path = "$USER$USERID";
    DioHelper.putData(url: path,
        data:
        {
          "id": userModel!.id,
          "email": email,
          "password": password,
          "name": name,
          "role": userModel!.role,
          "avatar": avatar,


        }, query: {}).then((value)
    {
      userModel = UserModel.fromJson(value!.data);
      receiveUserData();

      emit(ShopEditUserDataSuccessState());
    }).catchError((error)
    {
      emit(ShopEditUserDataFailState());
    });
  }

  void createProductsData()
  {
    for(int i = 0; i < products!.length; i++)
    {
      fakedItems[i].forEach((key, value)
      {
        recFakeItems.add({products![i].id!:value});
      });
    }
  }

  void editProductsData() {
    emit(ShopEditProductsDataLoadingState());
    for(Map<int, dynamic> item in recFakeItems)
    {
      item.forEach((key, value)
      {
        String path = "$PRODUCTS/$key";
        DioHelper.putData(url: path,
            data:
            {
              'title': value['title'],
              'images': value['images'],

            }, query: {}).then((value)
        {
        }).catchError((error)
        {
          emit(ShopEditProductsDataFailState());
        });
      });

    }
    emit(ShopEditProductsDataSuccessState());


  }


  void setCardBorderColor (int limiter) async {

    int i = 0;
    for(ProductsModel product in products!)
    {
      final PaletteGenerator paletteGenerator = await PaletteGenerator
          .fromImageProvider(Image.network(product.images![0]).image);
      Color? borderColor = paletteGenerator.lightMutedColor?.color ?? const Color(0xFFF4FAFF);
      Color? textColor = paletteGenerator.lightMutedColor?.bodyTextColor ?? Colors.black;
      colors.add([borderColor, textColor]);
      i++;
      if(i == limiter)
      {
        break;
      }
    }
    emit(ShopGetColorsSuccessState());
  }

  void receiveCategoriesData() {
    emit(ShopGetCategoryProductsLoadingState());
    DioHelper.getData(url: CATEGORY, query: {}).then((value)
    {
      receivedCategoriesJson = value?.data;
      if(receivedCategoriesJson != null)
        {
          for (Map<String, dynamic> category in receivedCategoriesJson!)
            {
              categories?.add(CategoryModel.fromJson(category));
            }
        }
      emit(ShopGetCategoryProductsSuccessState());
    }).catchError((error)
    {
      emit(ShopGetCategoryProductsFailState());
    });
  }

  void receiveProductsData() {
    emit(ShopGetProductsLoadingState());
    int count = 0;
    DioHelper.getData(url: PRODUCTS, query: {}).then((value)
    {
      receivedProductsJson = value?.data;
      if(receivedProductsJson != null)
      {
        for (Map<String, dynamic> product in receivedProductsJson!)
          {

            products?.add(ProductsModel.fromJson(product));
            favorites?[ProductsModel.fromJson(product).id] = 0;
            count ++;
            if(count == 50)
            {
              break;
            }
          }
      }
      createProductsData();
      editProductsData();

      emit(ShopGetProductsSuccessState());
    }).catchError((error)
    {
      emit(ShopGetUserDataFailState());
    });
  }

  void addProductToCart(int? id) {
    bool isInCart = false;
    for(ProductsModel product in cart!)
    {
      if(product.id == id)
      {
        isInCart = true;
        emit(ShopAddItemToCartFailState());
        break;
      }
    }
    if(!isInCart) {
      for(ProductsModel product in products!)
      {
        if(product.id == id)
        {
          cart?.add(product);
          cartPrices.add(product.price);
          productSum = productSum + product.price!.toInt();
          productCounts.add(1);
          int sum = 0;
          productsDisplayCounter ++;
          for(int i = 0; i < cart!.length; i++)
          {
            sum += (cart![i].price! * productCounts[i]);
          }
          total = sum + 5;
          emit(ShopAddItemToCartSuccessState());
          break;
        }
      }
    }

  }

  int getCategoryCount(int? id) {
    int count = 0;
    for(ProductsModel product in products!)
    {
      if(product.category!.id == id)
      {
        count += 1;
      }
    }
    return count;
  }

  List<ProductsModel> displaySelectedCategoryScreen(int? id) {
    List<ProductsModel> categoryProducts = [];
    for(ProductsModel product in products!)
    {
      if(product.category!.id == id)
      {
        categoryProducts.add(product);
      }
    }
    return categoryProducts;
  }

  void increaseProductQuan(int index) {
    productCounts[index] ++;
    productsDisplayCounter ++;
    int sum = 0;
    for(int i = 0; i < cart!.length; i++)
    {
      sum += (cart![i].price! * productCounts[i]);
    }
    total = sum + 5;
    emit(ShopIncreaseProductsSuccessState());
  }

  void decreaseProductQuan(int index) {
    if(productCounts[index] > 0)
    {
      productCounts[index] --;
      productsDisplayCounter --;
      int sum = 0;
      for(int i = 0; i < cart!.length; i++)
      {
        sum += (cart![i].price! * productCounts[i]);
      }
      total = sum + 5;
      emit(ShopDecreaseProductsSuccessState());
    }
  }

  void decreaseOnDiscard(int index) {
    productsDisplayCounter = productsDisplayCounter - (productCounts[index]);
    total -= cartPrices[index]! * productCounts[index];
    cartPrices.removeAt(index);
    productCounts.removeAt(index);
    emit(ShopDecreaseProductsSuccessState());

  }

  void toggleFavorite(int? id)
  {
    if(favorites![id] == 0)
    {
      favorites![id] = 1;
    }
    else
    {
      favorites![id] = 0;
    }
    emit(ShopToggleFavSuccessState());
  }

  void viewFavList()
  {
    favoritesItems!.clear();
    favorites!.forEach((key, value)
    {
      if(favorites![key] == 1)
      {
        for(ProductsModel product in products!)
        {
          if(product.id == key)
          {
            favoritesItems!.add(product);
          }
        }
      }
    });
    emit(ShopFetchFavSuccessState());
  }

  void dismissFavorite(int? id)
  {
    favorites![id] = 0;
    for(ProductsModel product in favoritesItems!)
    {
      if(product.id == id)
      {
        favoritesItems!.remove(product);
        break;
      }
    }
    emit(ShopDismissFavSuccessState());
  }

 void changeTheme(int index, BuildContext context)
  {
    if(index == 0)
    {
      theme = ThemeMode.light;
      CacheHelper.setData("theme", "light");
    }
    else
    {
      theme = ThemeMode.dark;
      CacheHelper.setData("theme", "dark");
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: theme == ThemeMode.light ? const Color(0xFFFFF8F0) : const Color(0xFF131B23),
      statusBarIconBrightness: theme == ThemeMode.light ? Brightness.light : Brightness.dark,
    ));
    emit(ShopChangeThemeSuccessState());
  }

  void startupTheme()
  {
    String recTheme = CacheHelper.getData('theme');

    if(recTheme == 'light')
    {
      theme = ThemeMode.light;
    }
    else if(recTheme == 'dark')
    {
      theme = ThemeMode.dark;
    }
    emit(ShopFetchStartupThemeSuccessState());
  }

  void searchForProduct(String name)
  {
    searchResult!.clear();
    for(ProductsModel product in products!)
    {
      if(product.title!.toLowerCase().contains(name.toLowerCase()))
      {
        searchResult!.add(product);
      }
    }
    emit(ShopGetSearchSuccessState());
  }



}

