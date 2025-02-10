// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class Transaction {
  String name;
  String description;
  DateTime createdAt;
  String amount;
  Transaction({
    required this.name,
    required this.description,
    required this.createdAt,
    required this.amount,
  });

  String get getNames {
    // Sépare la chaîne en une liste de mots
    List<String> words = name.split(' ');

    // Vérifie si le nom complet contient au moins 2 mots
    if (words.length >= 2) {
      return '${words[0]} ${words[1]}'; // Retourne les deux premiers mots
    } else {
      return name; // Si moins de 2 mots, retourne le nom complet
    }
  }

  String get getCreatedAt {
    final formatter = DateFormat('MM/dd/yy HH:mm');
    return formatter.format(createdAt);
  }

  String get getDescription {
    int maxLength = 10;
    // Vérifie si la chaîne est null ou vide
    if (description.isEmpty) {
      return ''; // Retourne une chaîne vide si la chaîne est nulle ou vide
    }

    // Vérifie si la longueur de la chaîne dépasse la limite
    if (description.length > maxLength) {
      return '${description.substring(0, maxLength)}...';
    } else {
      return description;
    }
  }
}

List<Transaction> allTransactions = [];
