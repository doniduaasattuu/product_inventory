import 'package:product_inventory/data/products.dart';
import 'package:product_inventory/models/product.dart';

class ProductService {
  List<Product> index({String? search, Category? category}) {
    if ((search != null && search.isNotEmpty) && category == null) {
      return products
          .where((product) => product.name.toLowerCase().contains(
                search.toLowerCase(),
              ))
          .toList();
    } else if ((category != null) && (search == null || search.isEmpty)) {
      return products.where((product) => product.category == category).toList();
    } else if ((search != null) && (category != null)) {
      return products.where((product) {
        return (product.name.toLowerCase().contains(search.toLowerCase()) &&
            product.category == category);
      }).toList();
    } else {
      return products;
    }
  }
}
