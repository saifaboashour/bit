class CountryResponse {
  final int? id;
  final String? name;
  final String? code;
  final List<State>? states;
  final List<Currency>? currencies;

  CountryResponse({
    this.id,
    this.name,
    this.code,
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
      id: json['id'],
      name: json['name'],
      code: json['code'],
      states: statesParser,
      currencies: currenciesParser,
    );
  }
}

class State {
  final int? id;
  final String? name;

  State({
    this.id,
    this.name,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Currency {
  final int? id;
  final String? name;
  final String? symbol;
  final String? toJod;

  Currency({
    this.id,
    this.name,
    this.symbol,
    this.toJod,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      toJod: json['to_jod'],
    );
  }
}
/*
{
      "id": 1,
      "name": "Jordan",
      "code": "JO",
      "states": [
        {
          "id": 1,
          "name": "Irbid"
        },
        {
          "id": 2,
          "name": "Amman"
        }
      ],
      "currencies": [
        {
          "id": 1,
          "name": "Jordanian Dinar",
          "symbol": "JOD",
          "to_jod": "1"
        },
        {
          "id": 2,
          "name": "United States Dollar",
          "symbol": "USD",
          "to_jod": "0.71"
        }
      ]
    },
*/
/*
{
  "data": [
    {
      "id": 1,
      "name": "Jordan",
      "code": "JO",
      "states": [
        {
          "id": 1,
          "name": "Irbid"
        },
        {
          "id": 2,
          "name": "Amman"
        }
      ],
      "currencies": [
        {
          "id": 1,
          "name": "Jordanian Dinar",
          "symbol": "JOD",
          "to_jod": "1"
        },
        {
          "id": 2,
          "name": "United States Dollar",
          "symbol": "USD",
          "to_jod": "0.71"
        }
      ]
    },
    {
      "id": 2,
      "name": "Egypt",
      "code": "EG",
      "states": [],
      "currencies": []
    }
  ]
}
*/