// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.the15Min,
    required this.the1Hour,
    required this.the1Min,
    required this.the30Min,
    required this.the5Hour,
    required this.the5Min,
    required this.daily,
    required this.monthly,
    required this.technicalIndicatorOf,
    required this.weekly,
  });

  The15Min the15Min;
  The15Min the1Hour;
  The15Min the1Min;
  The15Min the30Min;
  The15Min the5Hour;
  The15Min the5Min;
  The15Min daily;
  The15Min monthly;
  String technicalIndicatorOf;
  The15Min weekly;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        the15Min: The15Min.fromJson(json["15min"]),
        the1Hour: The15Min.fromJson(json["1hour"]),
        the1Min: The15Min.fromJson(json["1min"]),
        the30Min: The15Min.fromJson(json["30min"]),
        the5Hour: The15Min.fromJson(json["5hour"]),
        the5Min: The15Min.fromJson(json["5min"]),
        daily: The15Min.fromJson(json["daily"]),
        monthly: The15Min.fromJson(json["monthly"]),
        technicalIndicatorOf: json["technical_indicator_of"],
        weekly: The15Min.fromJson(json["weekly"]),
      );

  Map<String, dynamic> toJson() => {
        "15min": the15Min.toJson(),
        "1hour": the1Hour.toJson(),
        "1min": the1Min.toJson(),
        "30min": the30Min.toJson(),
        "5hour": the5Hour.toJson(),
        "5min": the5Min.toJson(),
        "daily": daily.toJson(),
        "monthly": monthly.toJson(),
        "technical_indicator_of": technicalIndicatorOf,
        "weekly": weekly.toJson(),
      };
}

class The15Min {
  The15Min({
    required this.movingAverages,
    required this.pivotPoints,
    required this.summary,
    required this.technicalIndicator,
  });

  MovingAverages movingAverages;
  PivotPoints pivotPoints;
  Summary summary;
  TechnicalIndicator technicalIndicator;

  factory The15Min.fromJson(Map<String, dynamic> json) => The15Min(
        movingAverages: MovingAverages.fromJson(json["moving_averages"]),
        pivotPoints: PivotPoints.fromJson(json["pivot_points"]),
        summary: Summary.fromJson(json["summary"]),
        technicalIndicator:
            TechnicalIndicator.fromJson(json["technical_indicator"]),
      );

  Map<String, dynamic> toJson() => {
        "moving_averages": movingAverages.toJson(),
        "pivot_points": pivotPoints.toJson(),
        "summary": summary.toJson(),
        "technical_indicator": technicalIndicator.toJson(),
      };
}

class MovingAverages {
  MovingAverages({
    required this.buy,
    required this.sell,
    required this.tableData,
    required this.Text1,
  });

  String buy;
  String sell;
  TableData tableData;
  String Text1;

  factory MovingAverages.fromJson(Map<String, dynamic> json) => MovingAverages(
        buy: json["buy"],
        sell: json["sell"],
        tableData: TableData.fromJson(json["table_data"]),
        Text1: textValues.map[json["Text1"]].toString(),
      );

  Map<String, dynamic> toJson() => {
        "buy": buy,
        "sell": sell,
        "table_data": tableData.toJson(),
        "Text1": textValues.reverse[Text1],
      };
}

class TableData {
  TableData({
    required this.exponential,
    required this.simple,
  });

  List<Exponential> exponential;
  List<Exponential> simple;

  factory TableData.fromJson(Map<String, dynamic> json) => TableData(
        exponential: List<Exponential>.from(
            json["exponential"].map((x) => Exponential.fromJson(x))),
        simple: List<Exponential>.from(
            json["simple"].map((x) => Exponential.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "exponential": List<dynamic>.from(exponential.map((x) => x.toJson())),
        "simple": List<dynamic>.from(simple.map((x) => x.toJson())),
      };
}

class Exponential {
  Exponential({
    required this.title,
    required this.type,
    required this.value,
  });

  String title;
  String type;
  String value;

  factory Exponential.fromJson(Map<String, dynamic> json) => Exponential(
        title: titleValues.map[json["title"]].toString(),
        type: textValues.map[json["type"]].toString(),
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "title": titleValues.reverse[title],
        "type": textValues.reverse[type],
        "value": value,
      };
}

enum Title { MA5, MA10, MA20, MA50, MA100, MA200 }

final titleValues = EnumValues({
  "MA10": Title.MA10,
  "MA100": Title.MA100,
  "MA20": Title.MA20,
  "MA200": Title.MA200,
  "MA5": Title.MA5,
  "MA50": Title.MA50
});

enum Text1 {
  BUY,
  SELL,
  OVERBOUGHT,
  HIGH_VOLATILITY,
  NEUTRAL,
  LESS_VOLATILITY,
  OVERSOLD
}

final textValues = EnumValues({
  "Buy": Text1.BUY,
  "High Volatility": Text1.HIGH_VOLATILITY,
  "Less Volatility": Text1.LESS_VOLATILITY,
  "Neutral": Text1.NEUTRAL,
  "Overbought": Text1.OVERBOUGHT,
  "Oversold": Text1.OVERSOLD,
  "Sell": Text1.SELL
});

class PivotPoints {
  PivotPoints({
    required this.camarilla,
    required this.classic,
    required this.demark,
    required this.fibonacci,
    required this.woodie,
  });

  Camarilla camarilla;
  Camarilla classic;
  Camarilla demark;
  Camarilla fibonacci;
  Camarilla woodie;

  factory PivotPoints.fromJson(Map<String, dynamic> json) => PivotPoints(
        camarilla: Camarilla.fromJson(json["camarilla"]),
        classic: Camarilla.fromJson(json["classic"]),
        demark: Camarilla.fromJson(json["demark"]),
        fibonacci: Camarilla.fromJson(json["fibonacci"]),
        woodie: Camarilla.fromJson(json["woodie"]),
      );

  Map<String, dynamic> toJson() => {
        "camarilla": camarilla.toJson(),
        "classic": classic.toJson(),
        "demark": demark.toJson(),
        "fibonacci": fibonacci.toJson(),
        "woodie": woodie.toJson(),
      };
}

class Camarilla {
  Camarilla({
    required this.pivotPoints,
    required this.r1,
    required this.r2,
    required this.r3,
    required this.s1,
    required this.s2,
    required this.s3,
  });

  String pivotPoints;
  String r1;
  String r2;
  String r3;
  String s1;
  String s2;
  String s3;

  factory Camarilla.fromJson(Map<String, dynamic> json) => Camarilla(
        pivotPoints: json["pivot_points"],
        r1: json["r1"],
        r2: json["r2"],
        r3: json["r3"],
        s1: json["s1"],
        s2: json["s2"],
        s3: json["s3"],
      );

  Map<String, dynamic> toJson() => {
        "pivot_points": pivotPoints,
        "r1": r1,
        "r2": r2,
        "r3": r3,
        "s1": s1,
        "s2": s2,
        "s3": s3,
      };
}

class Summary {
  Summary({
    required this.summaryText,
  });

  String summaryText;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        summaryText: json["summary_text"],
      );

  Map<String, dynamic> toJson() => {
        "summary_text": summaryText,
      };
}

class TechnicalIndicator {
  TechnicalIndicator({
    required this.buy,
    required this.neutral,
    required this.sell,
    required this.tableData,
    required this.Text1,
  });

  String buy;
  String neutral;
  String sell;
  List<TableDatum> tableData;
  String Text1;

  factory TechnicalIndicator.fromJson(Map<String, dynamic> json) =>
      TechnicalIndicator(
        buy: json["buy"],
        neutral: json["neutral"],
        sell: json["sell"],
        tableData: List<TableDatum>.from(
            json["table_data"].map((x) => TableDatum.fromJson(x))),
        Text1: json["Text1"] == null ? 'Null' : json["Text1"],
      );

  Map<String, dynamic> toJson() => {
        "buy": buy,
        "neutral": neutral,
        "sell": sell,
        "table_data": List<dynamic>.from(tableData.map((x) => x.toJson())),
        "Text1": Text1,
      };
}

class TableDatum {
  TableDatum({
    required this.action,
    required this.name,
    required this.value,
  });

  String action;
  String name;
  String value;

  factory TableDatum.fromJson(Map<String, dynamic> json) => TableDatum(
        action: textValues.map[json["action"]].toString(),
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "action": textValues.reverse[action],
        "name": name,
        "value": value,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
