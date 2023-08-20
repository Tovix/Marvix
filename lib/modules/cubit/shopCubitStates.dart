abstract class ShopCubitStates {}

class ShopInitialState extends ShopCubitStates{}
class ShopChangeState extends ShopCubitStates{}
class ShopGetColorsSuccessState extends ShopCubitStates{}
class ShopAddItemToCartSuccessState extends ShopCubitStates{}
class ShopAddItemToCartFailState extends ShopCubitStates{}

class ShopGetUserDataLoadingState extends ShopCubitStates{}
class ShopGetUserDataSuccessState extends ShopCubitStates{}
class ShopGetUserDataFailState extends ShopCubitStates{}

class ShopEditUserDataLoadingState extends ShopCubitStates{}
class ShopEditUserDataSuccessState extends ShopCubitStates{}
class ShopEditUserDataFailState extends ShopCubitStates{}

class ShopEditProductsDataLoadingState extends ShopCubitStates{}
class ShopEditProductsDataSuccessState extends ShopCubitStates{}
class ShopEditProductsDataFailState extends ShopCubitStates{}


class ShopGetProductsLoadingState extends ShopCubitStates{}
class ShopGetProductsSuccessState extends ShopCubitStates{}
class ShopGetProductsFailState extends ShopCubitStates{}

class ShopGetCategoryProductsLoadingState extends ShopCubitStates{}
class ShopGetCategoryProductsSuccessState extends ShopCubitStates{}
class ShopGetCategoryProductsFailState extends ShopCubitStates{}

class ShopGetSelectedProductsSuccessState extends ShopCubitStates{}

class ShopIncreaseProductsSuccessState extends ShopCubitStates{}
class ShopDecreaseProductsSuccessState extends ShopCubitStates{}

class ShopToggleFavSuccessState extends ShopCubitStates{}
class ShopDismissFavSuccessState extends ShopCubitStates{}

class ShopFetchFavSuccessState extends ShopCubitStates{}

class ShopChangeThemeSuccessState extends ShopCubitStates{}
class ShopGetSearchSuccessState extends ShopCubitStates{}

class ShopFetchStartupThemeSuccessState extends ShopCubitStates{}






