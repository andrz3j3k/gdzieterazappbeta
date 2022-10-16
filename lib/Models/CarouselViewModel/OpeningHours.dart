//wykonywane najpierw

class OpeningHours {
  final String pon;
  final String wt;
  final String sr;
  final String czw;
  final String pt;
  final String sob;
  final String nd;

  const OpeningHours({
    required this.pon,
    required this.wt,
    required this.sr,
    required this.czw,
    required this.pt,
    required this.sob,
    required this.nd,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      pon: json['monday'] as String,
      wt: json['tusday'] as String,
      sr: json['wednesday'] as String,
      czw: json['thursday'] as String,
      pt: json['friday'] as String,
      sob: json['saturday'] as String,
      nd: json['sunday'] as String,
    );
  }
}
