// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String name;
  String lastName;
  String country;
  String city;
  String adresse;
  String phone;
  User({
    required this.name,
    required this.lastName,
    required this.country,
    required this.city,
    required this.adresse,
    required this.phone,
  });
}

List<User> usersBeneficiaire = [
  // Afrique
  User(name: "Koffi", lastName: "Yao", country: "Côte d'Ivoire", city: "Abidjan", adresse: "Cocody, Rue des Jardins", phone: "+225 07 58 96 32"),
  User(name: "Samuel", lastName: "Eto'o", country: "Cameroun", city: "Douala", adresse: "Bonanjo, Boulevard de la Liberté", phone: "+237 699 45 78 12"),
  User(name: "Fatou", lastName: "Ndoye", country: "Sénégal", city: "Dakar", adresse: "Medina, Rue 25", phone: "+221 77 321 45 98"),
  User(name: "Mohamed", lastName: "Abdel", country: "Égypte", city: "Le Caire", adresse: "Place Tahrir, Immeuble 12", phone: "+20 102 456 78 90"),
  User(name: "Hassan", lastName: "El Fassi", country: "Maroc", city: "Casablanca", adresse: "Maarif, Boulevard Zerktouni", phone: "+212 661 78 90 12"),

  // Europe
  User(name: "Jean", lastName: "Dupont", country: "France", city: "Paris", adresse: "10 Rue de la Paix", phone: "+33 6 12 34 56 78"),
  User(name: "Maria", lastName: "Gomez", country: "Espagne", city: "Madrid", adresse: "Avenida Gran Via 45", phone: "+34 612 345 678"),
  User(name: "Luca", lastName: "Bianchi", country: "Italie", city: "Rome", adresse: "Via Veneto 22", phone: "+39 334 567 8901"),
  User(name: "William", lastName: "Taylor", country: "Royaume-Uni", city: "Londres", adresse: "Baker Street 221B", phone: "+44 20 7946 0123"),
  User(name: "Hans", lastName: "Müller", country: "Allemagne", city: "Berlin", adresse: "Alexanderplatz 7", phone: "+49 30 9876 5432"),

  // Amérique
  User(name: "John", lastName: "Smith", country: "USA", city: "New York", adresse: "123 Broadway", phone: "+1 212 555 7890"),
  User(name: "Carlos", lastName: "Rodriguez", country: "Mexique", city: "Mexico", adresse: "Avenida Reforma 99", phone: "+52 55 1234 5678"),
  User(name: "Luís", lastName: "Silva", country: "Brésil", city: "São Paulo", adresse: "Avenida Paulista 1000", phone: "+55 11 91234 5678"),
  User(name: "Sophie", lastName: "Lefebvre", country: "Canada", city: "Montréal", adresse: "Rue Saint-Denis 45", phone: "+1 514 876 5432"),

  // Asie
  User(name: "Chen", lastName: "Wei", country: "Chine", city: "Pékin", adresse: "Wangfujing Street 56", phone: "+86 10 8765 4321"),
  User(name: "Raj", lastName: "Patel", country: "Inde", city: "Mumbai", adresse: "Andheri West, Tower 12", phone: "+91 98765 43210"),
  User(name: "Taro", lastName: "Yamamoto", country: "Japon", city: "Tokyo", adresse: "Shibuya 5-10-3", phone: "+81 90 1234 5678"),
  User(name: "Ali", lastName: "Khan", country: "Pakistan", city: "Lahore", adresse: "Main Boulevard 22", phone: "+92 300 1234567"),
  User(name: "Rizky", lastName: "Putra", country: "Indonésie", city: "Jakarta", adresse: "Jl. Sudirman No. 78", phone: "+62 812 3456 7890"),
  User(name: "Mehmet", lastName: "Demir", country: "Turquie", city: "Istanbul", adresse: "Taksim Square 14", phone: "+90 532 678 90 12"),
];

