import 'package:exercicio_8/exercicio/domain/entities/address.dart';
import 'package:exercicio_8/exercicio/domain/entities/company.dart';

class User {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address address;
  final String? phone;
  final String? website;
  final Company company;

  const User(this.id, this.name, this.username, this.email, this.address,
      this.phone, this.website, this.company);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        address = json['address'] = Address.fromJson(json['address']),
        phone = json['phone'],
        website = json['website'],
        company = json['company'] = Company.fromJson(json['company']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address.toJson(),
        'phone': phone,
        'website': website,
        'company': company.toJson(),
      };
}
