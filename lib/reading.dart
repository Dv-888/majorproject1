class UserDB {
  final String id;
  final String ip;
  final String rssi;
  final String name;
  final String chipid;
  final String temperatureSoil;
  final String temperatureAir;
  final String humidityAir;
  final String light;
  final String soilMoisture;
  final String rain;
  final String date;
  final String time;
  final String ts;

  UserDB({
    this.id,
    this.ip,
    this.rssi,
    this.name,
    this.chipid,
    this.temperatureSoil,
    this.temperatureAir,
    this.humidityAir,
    this.light,
    this.soilMoisture,
    this.rain,
    this.date,
    this.time,
    this.ts,
  });

  factory UserDB.fromJson(Map<String, dynamic> json) {
    return UserDB(
        id: json['_id'],
        ip: json['IP'],
        rssi: json['RSSI'],
        name: json['name'],
        chipid: json['chipid'],
        temperatureSoil: json['Temperature Soil'],
        temperatureAir: json['Temperature Air'],
        humidityAir: json['Humidity Air'],
        light: json['Light'],
        soilMoisture: json['Soil Moisture'],
        rain: json['Rain'],
        date: json['Date'],
        time: json['Time'],
        ts: json['ts']);
  }
}
