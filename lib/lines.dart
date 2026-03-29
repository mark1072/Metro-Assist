final Map<String, List<String>> metroMap = {
  // ===== Line 1 =====
  'Helwan': ['Ain Helwan'],
  'Ain Helwan': ['Helwan', 'Helwan University'],
  'Helwan University': ['Ain Helwan', 'Wadi Hof'],
  'Wadi Hof': ['Helwan University', 'Hadayek Helwan'],
  'Hadayek Helwan': ['Wadi Hof', 'El Maasara'],
  'El Maasara': ['Hadayek Helwan', 'Tora El Asmant'],
  'Tora El Asmant': ['El Maasara', 'Kozzika'],
  'Kozzika': ['Tora El Asmant', 'Tora El Balad'],
  'Tora El Balad': ['Kozzika', 'Sakanat El Maadi'],
  'Sakanat El Maadi': ['Tora El Balad', 'Maadi'],
  'Maadi': ['Sakanat El Maadi', 'Hadayek El Maadi'],
  'Hadayek El Maadi': ['Maadi', 'Dar El Salam'],
  'Dar El Salam': ['Hadayek El Maadi', 'El Zahraa'],
  'El Zahraa': ['Dar El Salam', 'Mar Girgis'],
  'Mar Girgis': ['El Zahraa', 'El Malek El Saleh'],
  'El Malek El Saleh': ['Mar Girgis', 'Al Sayeda Zeinab'],
  'Al Sayeda Zeinab': ['El Malek El Saleh', 'Saad Zaghloul'],
  'Saad Zaghloul': ['Al Sayeda Zeinab', 'Sadat'],
  'Sadat': [
    'Saad Zaghloul',
    'Nasser',
    'Naguib',
    'Opera',
  ], // Interchange Station
  'Nasser': ['Sadat', 'Orabi', 'Attaba', 'Maspero'], // Interchange Station
  'Orabi': ['Nasser', 'Al Shohadaa'],
  'Al Shohadaa': ['Orabi', 'Ghamra', 'Masarra'], // Interchange Station
  'Ghamra': ['Al Shohadaa', 'El Demerdash'],
  'El Demerdash': ['Ghamra', 'Manshiet El Sadr'],
  'Manshiet El Sadr': ['El Demerdash', 'Kobri El Qobba'],
  'Kobri El Qobba': ['Manshiet El Sadr', 'Hammamat El Qobba'],
  'Hammamat El Qobba': ['Kobri El Qobba', 'Saray El Qobba'],
  'Saray El Qobba': ['Hammamat El Qobba', 'Hadayeq El Zaitoun'],
  'Hadayeq El Zaitoun': ['Saray El Qobba', 'Helmeyet El Zaitoun'],
  'Helmeyet El Zaitoun': ['Hadayeq El Zaitoun', 'El Matareyya'],
  'El Matareyya': ['Helmeyet El Zaitoun', 'Ain Shams'],
  'Ain Shams': ['El Matareyya', 'Ezbet El Nakhl'],
  'Ezbet El Nakhl': ['Ain Shams', 'El Marg'],
  'El Marg': ['Ezbet El Nakhl', 'New El Marg'],
  'New El Marg': ['El Marg'],

  // ===== Line 2 =====
  'Shubra El Kheima': ['Kolleyet El Zeraa'],
  'Kolleyet El Zeraa': ['Shubra El Kheima', 'Mezallat'],
  'Mezallat': ['Kolleyet El Zeraa', 'Khalafawy'],
  'Khalafawy': ['Mezallat', 'St. Teresa'],
  'St. Teresa': ['Khalafawy', 'Rod El Farag'],
  'Rod El Farag': ['St. Teresa', 'Masarra'],
  'Masarra': ['Rod El Farag', 'Al Shohadaa'],
  'Naguib': ['Attaba', 'Sadat'],
  'Opera': ['Sadat', 'Dokki'],
  'Dokki': ['Opera', 'El Bohoth'],
  'El Bohoth': ['Dokki', 'Cairo University'],
  'Cairo University': [
    'El Bohoth',
    'Faisal',
    'Boulak El Dakrour',
  ], // Interchange Station
  'Faisal': ['Cairo University', 'Giza'],
  'Giza': ['Faisal', 'Omm El Misryeen'],
  'Omm El Misryeen': ['Giza', 'Sakiat Mekky'],
  'Sakiat Mekky': ['Omm El Misryeen', 'El Mounib'],
  'El Mounib': ['Sakiat Mekky'],

  // ===== Line 3 =====
  'Adly Mansour': ['El Haykestep'],
  'El Haykestep': ['Adly Mansour', 'Omar Ibn El Khattab'],
  'Omar Ibn El Khattab': ['El Haykestep', 'Qobaa'],
  'Qobaa': ['Omar Ibn El Khattab', 'Hesham Barakat'],
  'Hesham Barakat': ['Qobaa', 'El Nozha'],
  'El Nozha': ['Hesham Barakat', 'Nadi El Shams'],
  'Nadi El Shams': ['El Nozha', 'Alf Maskan'],
  'Alf Maskan': ['Nadi El Shams', 'Heliopolis Square'],
  'Heliopolis Square': ['Alf Maskan', 'Haroun'],
  'Haroun': ['Heliopolis Square', 'Al Ahram'],
  'Al Ahram': ['Haroun', 'Kolleyet El Banat'],
  'Kolleyet El Banat': ['Al Ahram', 'Stadium'],
  'Stadium': ['Kolleyet El Banat', 'Fair Zone'],
  'Fair Zone': ['Stadium', 'Abbassiya'],
  'Abbassiya': ['Fair Zone', 'Abdou Pasha'],
  'Abdou Pasha': ['Abbassiya', 'El Geish'],
  'El Geish': ['Abdou Pasha', 'Bab El Shaaria'],
  'Bab El Shaaria': ['El Geish', 'Attaba'],
  'Attaba': ['Nasser', 'Bab El Shaaria', 'Naguib'], // Interchange Station
  'Maspero': ['Nasser', 'Safaa Hegazy'],
  'Safaa Hegazy': ['Maspero', 'Kit Kat'],
  'Kit Kat': ['Safaa Hegazy', 'Sudan', 'Tawfikia'], // Branches
  // ===== Branch: Ring Road =====
  'Sudan': ['Kit Kat', 'Imbaba'],
  'Imbaba': ['Sudan', 'El Bohey'],
  'El Bohey': ['Imbaba', 'El Qawmeya'],
  'El Qawmeya': ['El Bohey', 'Ring Road'],
  'Ring Road': ['El Qawmeya'],

  // ===== Branch: Cairo University =====
  'Tawfikia': ['Kit Kat', 'Wadi El Nile'],
  'Wadi El Nile': ['Tawfikia', 'Gamet El Dowal'],
  'Gamet El Dowal': ['Wadi El Nile', 'Boulak El Dakrour'],
  'Boulak El Dakrour': ['Gamet El Dowal', 'Cairo University'],
};

enum MetroLine { line1, line2, line3 }

final Map<String, Set<MetroLine>> stationLines = {
  // ===== Line 1 =====
  'Helwan': {MetroLine.line1},
  'Sadat': {MetroLine.line1, MetroLine.line2},
  'Nasser': {MetroLine.line1, MetroLine.line3},
  'Attaba': {MetroLine.line2, MetroLine.line3},
  'Orabi': {MetroLine.line1},
  'Al Shohadaa': {MetroLine.line1, MetroLine.line2},

  // ===== Line 2 =====
  'Shubra El Kheima': {MetroLine.line2},
  'Cairo University': {MetroLine.line2, MetroLine.line3},

  // ===== Line 3 =====
  'Kit Kat': {MetroLine.line3},
  'Imbaba': {MetroLine.line3},
};
String lineName(MetroLine line) {
  switch (line) {
    case MetroLine.line1:
      return 'Line 1 (Red)';
    case MetroLine.line2:
      return 'Line 2 (Green)';
    case MetroLine.line3:
      return 'Line 3 (Yellow)';
  }
}
