import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zartek/app/models/get_foods_response.dart';

RxList<CategoryDishes> ITEMS_IN_CART = <CategoryDishes>[].obs;

class CartSessionManager {
  static final cartStorage = GetStorage();
  static final String cart = 'Items in Cart';

  static Future<RxList<CategoryDishes>> getCart() async {
    List? itemsInCart = await cartStorage.read(cart);
    if (itemsInCart != null) {
      ITEMS_IN_CART.value = [];
      for (dynamic item in itemsInCart) {
        ITEMS_IN_CART.add(
          CategoryDishes.fromJson(item),
        );
      }
    }
    print("Items in Cart  ==> $ITEMS_IN_CART.");
    return ITEMS_IN_CART;
  }

  static Future<void> addItemToCart(CategoryDishes dish) async {
    ITEMS_IN_CART.add(dish);

    List itemsInCart = [];
    for (CategoryDishes item in ITEMS_IN_CART) {
      itemsInCart.add(item.toJson());
    }

    cartStorage.write(cart, itemsInCart);
    print("Item added in Cart ==> $dish.");
  }

  static Future<void> deleteItemFromCart(CategoryDishes dish) async {
    ITEMS_IN_CART.removeAt(
      ITEMS_IN_CART.indexWhere(
        (dishInCart) => dishInCart.dishId == dish.dishId,
      ),
    );

    List itemsInCart = [];
    for (CategoryDishes item in ITEMS_IN_CART) {
      itemsInCart.add(item.toJson());
    }

    cartStorage.write(cart, itemsInCart);
    print("Item deleted from Cart ==> $dish.");
  }

  static int getQuantityOfDishPresentInCart(CategoryDishes dish) {
    int dishQuantity = ITEMS_IN_CART.fold(
      0,
      (int previousValue, dishInCart) {
        return dishInCart.dishId == dish.dishId
            ? previousValue + 1
            : previousValue + 0;
      },
    );
    print("Quantity Of Dish Present In Cart ==> $dishQuantity.");
    return dishQuantity;
  }

  static void clearSession() {
    cartStorage.erase();
    print("Cart Session Cleared.");
  }
}
