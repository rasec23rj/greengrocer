import 'package:greengrocer/src/models/item_cart_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/orders_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [apple, grape, guava, kiwi, mango, papaya];
List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
  'Legumes',
];

List<ItemCartModel> cartitems = [
  ItemCartModel(itemModel: apple, quantidade: 1),
  ItemCartModel(itemModel: grape, quantidade: 2),
  ItemCartModel(itemModel: kiwi, quantidade: 5),
];

UserModel userModel = UserModel(
  id: '',
  token: '',
  name: 'name',
  email: 'email',
  phone: '21991173820',
  cpf: '11111111111',
  password: '123456',
);

List<OrdersModel> orders = [
  OrdersModel(
    id: '11333',
    createdDateTime: DateTime.parse('2025-09-18 19:19:00.458'),
    overdueDateTime: DateTime.parse('2025-09-18 19:19:00.458'),
    items: [ItemCartModel(quantidade: 2, itemModel: apple)],
    status: 'pending_payment',
    copyAndPaste: 'dsadasdasas',
    total: 11.5,
  ),
  OrdersModel(
    id: '2222',
    createdDateTime: DateTime.parse('2025-09-14 19:19:00.458'),
    overdueDateTime: DateTime.parse('2025-09-14 19:19:00.458'),
    items: [
      ItemCartModel(quantidade: 2, itemModel: grape),
      ItemCartModel(quantidade: 5, itemModel: kiwi),
    ],
    status: 'delivered',
    copyAndPaste: 'dfdfdsfdsfd',
    total: 11.0,
  ),
];
