import 'country.dart';
import 'currency.dart';
import 'state.dart';

class CountryResponse {
  final Country? country;
  final List<State>? states;
  final List<Currency>? currencies;

  CountryResponse({
    this.country,
    this.states,
    this.currencies,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) {
    List<State> statesParser = [];
    List<Currency> currenciesParser = [];

    if (json['states'] != null) {
      json['states'].forEach((state) {
        statesParser.add(State.fromJson(state));
      });
    }
    if (json['currencies'] != null) {
      json['currencies'].forEach((currency) {
        currenciesParser.add(Currency.fromJson(currency));
      });
    }

    return CountryResponse(
      country: Country(
        id: json['id'],
        name: json['name'],
        code: json['code'],
      ),
      states: statesParser,
      currencies: currenciesParser,
    );
  }
}
