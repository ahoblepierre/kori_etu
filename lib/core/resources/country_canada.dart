// ignore_for_file: public_member_api_docs, sort_constructors_first
class CountryCanada {
  String name;
  String currency;
  int rate;
  String flag;
  String code;
  String dialCode;
  List<PaymentSupport> paymentSupport;
  CountryCanada({
    required this.name,
    required this.currency,
    required this.rate,
    required this.flag,
    required this.code,
    required this.dialCode,
    required this.paymentSupport,
  });

  @override
  String toString() {
    return 'CountryCanada(name: $name, currency: $currency, rate: $rate, flag: $flag, code: $code, dialCode: $dialCode, paymentSupport: $paymentSupport)';
  }
}

class PaymentSupport {
  String code;
  String libelle;
  String icon;
  PaymentSupport({
    required this.code,
    required this.libelle,
    required this.icon,
  });

  @override
  String toString() =>
      'PaymentSupport(code: $code, libelle: $libelle, icon: $icon)';
}

List<CountryCanada> countriesCanada = [
  CountryCanada(
    name: "Côte d'Ivoire",
    currency: 'XOF',
    rate: 600,
    flag: '🇨🇮',
    code: 'CI',
    dialCode: '+225',
    paymentSupport: [
      PaymentSupport(
        code: 'visa',
        libelle: 'Visa carte',
        icon: 'assets/images/visa-logo.png',
      ),
      PaymentSupport(
        code: 'wave',
        libelle: 'Wave Money',
        icon: 'assets/images/wave_money.png',
      ),
      PaymentSupport(
        code: 'orange',
        libelle: 'Orange Money',
        icon: 'assets/images/orange_money.png',
      ),
      PaymentSupport(
        code: 'mtn',
        libelle: 'MTN Money',
        icon: 'assets/images/mtn-logo.png',
      ),
      PaymentSupport(
        code: 'moov',
        libelle: 'MOOV Money',
        icon: 'assets/images/moov.png',
      ),
    ],
  ),
  CountryCanada(
    name: 'Canada',
    currency: 'CAD',
    rate: 500,
    flag: '🇨🇦',
    code: 'CA',
    dialCode: '+1',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'mastercard',
          libelle: 'MasterCard',
          icon: 'assets/images/mastercard_logo.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
  CountryCanada(
    name: 'Germany',
    currency: 'EUR',
    rate: 200,
    flag: '🇩🇪',
    code: 'DE',
    dialCode: '+49',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'paypal', libelle: 'PayPal', icon: 'assets/images/paypal.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
  CountryCanada(
    name: 'France',
    currency: 'EUR',
    rate: 100,
    flag: '🇫🇷',
    code: 'FR',
    dialCode: '+33',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'mastercard',
          libelle: 'MasterCard',
          icon: 'assets/images/mastercard_logo.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
  CountryCanada(
    name: 'Cameroon',
    currency: 'XAF',
    rate: 200,
    flag: '🇨🇲',
    code: 'CM',
    dialCode: '+237',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'visa',
          libelle: 'MNT money CAMEROON',
          icon: 'assets/images/mtn-logo.png'),
      PaymentSupport(
          code: 'orange',
          libelle: 'Orange Money CAMEROOn',
          icon: 'assets/images/orange_money.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
  CountryCanada(
    name: 'United States',
    currency: 'USD',
    rate: 350,
    flag: '🇺🇸',
    code: 'US',
    dialCode: '+1',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'paypal', libelle: 'PayPal', icon: 'assets/images/paypal.png'),
      PaymentSupport(
          code: 'apple-pay',
          libelle: 'Apple Pay',
          icon: 'assets/images/apple-pay.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
  CountryCanada(
    name: 'Nigeria',
    currency: 'NGN',
    rate: 450,
    flag: '🇳🇬',
    code: 'NG',
    dialCode: '+234',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
  CountryCanada(
    name: 'Brazil',
    currency: 'BRL',
    rate: 500,
    flag: '🇧🇷',
    code: 'BR',
    dialCode: '+55',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'paypal', libelle: 'PayPal', icon: 'assets/images/paypal.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
  CountryCanada(
    name: 'Italy',
    currency: 'EUR',
    rate: 700,
    flag: '🇮🇹',
    code: 'IT',
    dialCode: '+39',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'mastercard',
          libelle: 'MasterCard',
          icon: 'assets/images/mastercard_logo.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
  CountryCanada(
    name: 'Kenya',
    currency: 'KES',
    rate: 550,
    flag: '🇰🇪',
    code: 'KE',
    dialCode: '+254',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'mpesa', libelle: 'M-Pesa', icon: 'assets/images/mpesa.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
  CountryCanada(
    name: 'Mexico',
    currency: 'MXN',
    rate: 670,
    flag: '🇲🇽',
    code: 'MX',
    dialCode: '+52',
    paymentSupport: [
      PaymentSupport(
          code: 'visa', libelle: 'Visa', icon: 'assets/images/visa-logo.png'),
      PaymentSupport(
          code: 'paypal', libelle: 'PayPal', icon: 'assets/images/paypal.png'),
      PaymentSupport(
          code: 'bank', libelle: 'Bank', icon: 'assets/images/bank.png'),
      PaymentSupport(
          code: 'wallet', libelle: 'Wallet', icon: 'assets/images/wallet.png'),
    ],
  ),
];
