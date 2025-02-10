import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kori_etu/core/resources/transaction.dart';

class TransactionController extends GetxController {
  List<Transaction> transactions = <Transaction>[].obs;

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }
}
