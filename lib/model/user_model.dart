import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User{
  const factory User({
    required String name,
    required String username,
    @Default("") String email,
    @Default("") String phone,
    Address? address,
}) = _User;

  factory User.fromJson(Map<String, Object?> json)
  => _$UserFromJson(json);
}

@freezed
class Address with _$Address{
  const factory Address({
    @Default("") final String street,
    @Default("") final String? city,
    final Geo? geo,
}) = _Address;

  factory Address.fromJson(Map<String, Object?> json)
  => _$AddressFromJson(json);
}

@freezed
class Geo with _$Geo{
  const factory Geo({
    @Default("") final String? lat,
    @Default("") final String? lng,
}) = _Geo;

  factory Geo.fromJson(Map<String, Object?> json)
  => _$GeoFromJson(json);
}