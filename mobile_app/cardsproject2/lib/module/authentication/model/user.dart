import 'package:cardsproject2/module/authentication/model/country.dart';
import 'package:cardsproject2/module/authentication/model/currency.dart';
import 'package:cardsproject2/module/authentication/model/state.dart';

class User {
  final String? name;
  final String? address;
  final String? phone;
  final String? password;
  final String? commercialName;
  final String? email;
  final String? image;
  final String? credit;
  final String? isApproved;
  final String? isBlocked;
  final String? canGiveCredit;
  final String? isEmailVerified;
  final String? isPhoneVerified;
  final String? vendor;
  final Country? country;
  final State? state;
  final Currency? currency;
  final String? group;

  User({
    this.name,
    this.address,
    this.phone,
    this.password,
    this.commercialName,
    this.email,
    this.image,
    this.credit,
    this.isApproved,
    this.isBlocked,
    this.canGiveCredit,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.vendor,
    this.country,
    this.state,
    this.currency,
    this.group,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      password: json['password'],
      commercialName: json['commercial_name'],
      email: json['email'],
      image: json['image'],
      credit: json['credit'],
      isApproved: json['is_approved'],
      isBlocked: json['is_blocked'],
      canGiveCredit: json['can_give_credit'],
      isEmailVerified: json['is_email_verified'],
      isPhoneVerified: json['is_phone_verified'],
      vendor: json['vendor'],
      country: Country.fromJson(json['country']),
      state: State.fromJson(json['state']),
      currency: Currency.fromJson(json['currency']),
      group: json['group'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'password': password,
      'commercial_name': commercialName,
      'email': email,
      'image': image,
      'credit': credit,
      'is_approved': isApproved,
      'is_blocked': isBlocked,
      'can_give_credit': canGiveCredit,
      'is_email_verified': isEmailVerified,
      'is_phone_verified': isPhoneVerified,
      'vendor': vendor,
      'country': country,
      'state': state,
      'currency': currency,
      'group': group,
    };
  }
}
