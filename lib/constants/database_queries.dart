class DatabaseQuery {
  static const airportTable = 'airports';
  static const airportTablePath = 'airport_database.db';
  static const queryCreateAirportTable =
      'CREATE TABLE airports(code TEXT PRIMARY KEY, lat TEXT, lon TEXT, name TEXT, city TEXT, state TEXT, country TEXT, woeid TEXT, tz TEXT, phone TEXT, type TEXT, email TEXT, url TEXT, runway_length TEXT, elev TEXT, icao TEXT, direct_flights TEXT, carriers TEXT)';
}
