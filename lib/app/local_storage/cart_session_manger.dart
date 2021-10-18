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
    cartStorage.write(cart, ITEMS_IN_CART);
    print("Item added in Cart ==> $dish.");
  }

  static Future<void> deleteItemFromCart(CategoryDishes dish) async {
    ITEMS_IN_CART.remove(dish);
    cartStorage.write(cart, ITEMS_IN_CART);
    print("Item deleted from Cart ==> $dish.");
  }

  static int getQuantityOfDishPresentInCart(CategoryDishes dish) {
    int quantityOfDishPresentInCart = ITEMS_IN_CART.fold(
      0,
      (int previousValue, dishInCart) {
        return dishInCart == dish ? previousValue + 1 : previousValue + 0;
      },
    );
    print("Quantity Of Dish Present In Cart ==> $quantityOfDishPresentInCart.");
    return quantityOfDishPresentInCart;
  }

  static void clearSession() {
    cartStorage.erase();
    print("Cart Session Cleared.");
  }
}