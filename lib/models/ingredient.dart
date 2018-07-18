class Ingredient {
  final String _name;
  final String _amount;

  Ingredient(this._name, this._amount);

  Ingredient.fromMap(Map<dynamic, dynamic> data)
    : this(data["name"], data["amount"]);

  get name => _name;
  get amount => _amount;
}