class Movement {
  final String date;
  final String name;
  final double value;
  Movement({this.date, this.name, this.value});
}

final movements = [
  Movement(date: '30 OCT', name: 'Dinero Depositado', value: 30),
  Movement(date: '31 OCT', name: 'Compra Curso Udemy', value: -10),
  Movement(date: '31 OCT', name: 'Pago trabajo U', value: 120),
  Movement(date: '31 OCT', name: 'Debito Netflix', value: -13.99),
  Movement(date: '01 NOV', name: 'Debito Adobe', value: -16.99),
  Movement(date: '02 NOV', name: 'Pago Interfaz Flutter', value: 250),
  Movement(date: '02 NOV', name: 'Compra Teclado', value: -120.0),
  Movement(date: '02 NOV', name: 'Compra Mouse', value: -90.0),
];
