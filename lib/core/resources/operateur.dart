class Operateur {
  final int id;
  final String name;
  final String imagePath;

  Operateur({required this.id, required this.name, required this.imagePath});
}

List<Operateur> operateurs = [
  Operateur(
    id: 1,
    name: 'Master Card',
    imagePath: 'assets/images/mastercard_logo.png',
  ),
  Operateur(
    id: 2,
    name: 'Wave Money',
    imagePath: 'assets/images/wave_money.png',
  ),
  Operateur(
    id: 3,
    name: 'Moov Money',
    imagePath: 'assets/images/moov.png',
  ),
  Operateur(
    id: 4,
    name: 'Orange Money ',
    imagePath: 'assets/images/orange_money.png',
  ),
  Operateur(
    id: 3,
    name: 'MTN Money',
    imagePath: 'assets/images/mtn-logo.png',
  ),
  Operateur(
    id: 5,
    name: 'Carte Visa',
    imagePath: 'assets/images/visa-logo.png',
  ),
];
