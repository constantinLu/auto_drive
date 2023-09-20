class Pizza {
  final PizzaSize size;
  final PizzaCrust crust;
  final PizzaSauce sauce;
  final List<String> toppings;
  final bool hasExtraCheese;
  final bool hasDoubleMeat;
  final String notes;

  Pizza(
      {required this.size,
      required this.crust,
      required this.sauce,
      required this.toppings,
      this.hasExtraCheese = false,
      this.hasDoubleMeat = false,
      required this.notes});

  Future<Pizza> copyWith(
          {required PizzaSize size,
          required PizzaCrust crust,
          required PizzaSauce sauce,
          required List<String> toppings,
          required bool hasExtraCheese,
          required bool hasDoubleMeat,
          required String notes}) async =>
      Pizza(
          size: size ?? this.size,
          crust: crust ?? this.crust,
          sauce: sauce ?? this.sauce,
          toppings: toppings ?? this.toppings,
          hasExtraCheese: hasExtraCheese ?? this.hasExtraCheese,
          hasDoubleMeat: hasDoubleMeat ?? this.hasDoubleMeat,
          notes: notes ?? this.notes);
}

enum PizzaSize {
  S,
  M,
  L,
  XL,
}

enum PizzaSauce {
  none,
  marinara,
  garlic,
}

enum PizzaCrust {
  classic,
  deepDish,
}
