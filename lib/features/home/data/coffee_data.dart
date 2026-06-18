class Coffee {
  final String name;
  final double price;
  final String image;
  final String category;

  const Coffee({
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });
}

final List<Coffee> coffees = [
  const Coffee(
    name: "Cappuccino",
    price: 5.99,
    image: "assets/images/coffee1.jpg",
    category: "Hot",
  ),
  const Coffee(
    name: "Latte",
    price: 4.99,
    image: "assets/images/coffee2.jpg",
    category: "Milk",
  ),
  const Coffee(
    name: "Espresso",
    price: 3.49,
    image: "assets/images/coffee3.jpg",
    category: "Hot",
  ),
  const Coffee(
    name: "Mocha",
    price: 6.25,
    image: "assets/images/coffee4.jpg",
    category: "Milk",
  ),
  const Coffee(
    name: "Americano",
    price: 4.25,
    image: "assets/images/coffee5.jpg",
    category: "Hot",
  ),
  const Coffee(
    name: "Flat White",
    price: 5.50,
    image: "assets/images/coffee6.jpg",
    category: "Milk",
  ),
];
