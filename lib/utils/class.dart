class Nutrients {
  String name;
  String weight;
  double percent;
  Nutrients({required this.name, required this.weight, required this.percent});
}

class Recipe {
  String id, imageUrl, title;
  List<String> steps;
  List<String> ingredients;
  List<Nutrients> nutrients;
  Recipe(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.steps,
      required this.ingredients,
      required this.nutrients});
}
