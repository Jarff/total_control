class Transaction {
  String? id = "1";
  String name = "Sin nombre";
  String date = "-";
  double amount = 0.0;

  Transaction({
    this.id,
    required this.name,
    required this.date,
    required this.amount,
  }) : super();
}
