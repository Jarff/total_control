class AccountType {
  static const credit = 'credit';
  static const debit = 'debit';
  static const repository = 'repository';

  static String string(String type) {
    String text;
    switch (type) {
      case AccountType.credit:
        text = 'Crédito';
        break;
      case AccountType.debit:
        text = 'Débito';
        break;
      case AccountType.repository:
        text = 'Repositorio';
        break;
      default:
        text = '';
    }
    return text;
  }
}
