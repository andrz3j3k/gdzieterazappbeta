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
      pon: json['pon'] as String,
      wt: json['wt'] as String,
      sr: json['sr'] as String,
      czw: json['czw'] as String,
      pt: json['pt'] as String,
      sob: json['sob'] as String,
      nd: json['nd'] as String,
    );
  }
}
