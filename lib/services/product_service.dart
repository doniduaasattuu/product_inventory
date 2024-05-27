import 'package:product_inventory/data/products.dart';
import 'package:product_inventory/models/product.dart';

class ProductService {
  List<Product> index({String? search}) {
    if (search != null) {
      return products
          .where((product) =>
              product.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    } else {
      return products;
    }
  }
}
