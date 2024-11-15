


import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';
@JsonSerializable()

class QuoteResponse {
  final List<Quote> quotes;
  final int total;
  final int skip;
  final int limit;

  QuoteResponse({
    required this.quotes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory QuoteResponse.fromJson(Map<String, dynamic> json) {
    return QuoteResponse(
      quotes: (json['quotes'] as List)
          .map((quoteJson) => Quote.fromJson(quoteJson))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quotes': quotes.map((quote) => quote.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

class Quote {
  final int id;
  final String quote;
  final String author;

  Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quote': quote,
      'author': author,
    };
  }
}

