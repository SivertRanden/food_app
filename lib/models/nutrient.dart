class Nutrient {
  final String _name;
  final String _amount;

  Nutrient(this._name, this._amount);

  Nutrient.fromMap(Map<String, dynamic> data)
    : this(data["name"], data["amount"]);

  get name => _name;
  get amount => _amount;
}