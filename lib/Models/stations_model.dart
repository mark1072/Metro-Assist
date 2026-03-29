class MetroStation {
  final String name;
  final double lat;
  final double lng;
 
  MetroStation(this.name, this.lat, this.lng);
}

final List<MetroStation> metroStations = [
  // =======================
  // 🚇 LINE 1 (Helwan ↔ New El Marg)
  // =======================
  MetroStation('Helwan', 29.8410, 31.3342),
  MetroStation('Ain Helwan', 29.8626, 31.3256),
  MetroStation('Helwan University', 29.8697, 31.3200),
  MetroStation('Wadi Hof', 29.8790, 31.3135),
  MetroStation('Hadayek Helwan', 29.8970, 31.3030),
  MetroStation('El Maasara', 29.9066, 31.2990),
  MetroStation('Tora El Asmant', 29.9250, 31.2870),
  MetroStation('Kozzika', 29.9360, 31.2810),
  MetroStation('Tora El Balad', 29.9460, 31.2730),
  MetroStation('Sakanat El Maadi', 29.9530, 31.2660),
  MetroStation('Maadi', 29.9602, 31.2569),
  MetroStation('Hadayek El Maadi', 29.9700, 31.2500),
  MetroStation('Dar El Salam', 29.9820, 31.2420),
  MetroStation('El Zahraa', 29.9950, 31.2310),
  MetroStation('Mar Girgis', 30.0060, 31.2290),
  MetroStation('El Malek El Saleh', 30.0170, 31.2310),
  MetroStation('Sayeda Zeinab', 30.0290, 31.2350),
  MetroStation('Saad Zaghloul', 30.0370, 31.2380),
  MetroStation('Sadat', 30.0444, 31.2357), //
  MetroStation('Nasser', 30.0530, 31.2380), //
  MetroStation('Orabi', 30.0560, 31.2420),
  MetroStation('El Shohadaa', 30.0611, 31.2460), //
  MetroStation('Ghamra', 30.0690, 31.2640),
  MetroStation('El Demerdash', 30.0770, 31.2770),
  MetroStation('Manshiet El Sadr', 30.0820, 31.2870),
  MetroStation('Kobri El Qobba', 30.0870, 31.2920),
  MetroStation('Hammamat El Qobba', 30.0910, 31.2990),
  MetroStation('Saray El Qobba', 30.0970, 31.3040),
  MetroStation('Hadayeq El Zaitoun', 30.1050, 31.3100),
  MetroStation('Helmeyet El Zaitoun', 30.1130, 31.3140),
  MetroStation('El Matareyya', 30.1210, 31.3180),
  MetroStation('Ain Shams', 30.1310, 31.3200),
  MetroStation('Ezbet El Nakhl', 30.1390, 31.3240),
  MetroStation('El Marg', 30.1500, 31.3350),
  MetroStation('New El Marg', 30.1630, 31.3383),

  // =======================
  // 🚇 LINE 2 (El Mounib ↔ Shubra El Kheima)
  // =======================
  MetroStation('El Mounib', 29.9811, 31.2122),
  MetroStation('Sakiat Mekky', 29.9950, 31.2080),
  MetroStation('Omm El Misryeen', 30.0050, 31.2050),
  MetroStation('Giza', 30.0106, 31.2070),
  MetroStation('Faisal', 30.0170, 31.2030),
  MetroStation('Cairo University', 30.0260, 31.2010), //
  MetroStation('El Bohoth', 30.0350, 31.2000),
  MetroStation('Dokki', 30.0380, 31.2110),
  MetroStation('Opera', 30.0410, 31.2240),
  MetroStation('Mohamed Naguib', 30.0480, 31.2440),
  MetroStation('Attaba', 30.0523, 31.2468), //
  MetroStation('Masara', 30.0710, 31.2450),
  MetroStation('Rod El Farag', 30.0810, 31.2450),
  MetroStation('St. Teresa', 30.0880, 31.2450),
  MetroStation('Khalafawy', 30.0970, 31.2450),
  MetroStation('Mezallat', 30.1040, 31.2450),
  MetroStation('Kolleyet El Zeraa', 30.113803244211827, 31.248669895718216),
  MetroStation('Shubra El Kheima', 30.124353545313348, 31.24333385811701),

  // =======================
  // 🚇 LINE 3 (Adly Mansour ↔ Kit Kat)
  // =======================
  MetroStation('Adly Mansour', 30.1470, 31.4210),
  MetroStation('El Haykestep', 30.1430, 31.4040),
  MetroStation('Omar Ibn El Khattab', 30.1400, 31.3940),
  MetroStation('Qobaa', 30.1340, 31.3830),
  MetroStation('Hesham Barakat', 30.1310, 31.3720),
  MetroStation('El Nozha', 30.1280, 31.3600),
  MetroStation('El Shams Club', 30.1250, 31.3480),
  MetroStation('Alf Maskan', 30.1200, 31.3380),
  MetroStation('Heliopolis Square', 30.1180, 31.3310),
  MetroStation('Haroun', 30.1130, 31.3220),
  MetroStation('Al Ahram', 30.1090, 31.3160),
  MetroStation('Koleyet El Banat', 30.1050, 31.3100),
  MetroStation('Stadium', 30.1010, 31.2990),
  MetroStation('Fair Zone', 30.0990, 31.2870),
  MetroStation('Abbassia', 30.0725, 31.2830),
  MetroStation('Abdou Pasha', 30.0640, 31.2740),
  MetroStation('El Geish', 30.0570, 31.2660),
  MetroStation('Bab El Shaaria', 30.0540, 31.2550),
  MetroStation('Nasser', 30.0530, 31.2380),
  MetroStation('Maspero', 30.0550, 31.2320),
  MetroStation('Safaa Hijazy', 30.0600, 31.2240),
  MetroStation('Kit Kat', 30.0660, 31.2130),
];
