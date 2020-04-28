//https://covid19.th-stat.com/api/open/timeline
//https://javiercbk.github.io/json_to_dart/
//https://stackoverflow.com/questions/57545452/dart-convert-time-from-dd-mm-yyyy-to-yyyy-mm-dd

//class Covid19Th {
//  static const String apiUrl = 'https://covid19.th-stat.com/api/open/timeline';
//
//  String _updateDate;
//  String _source;
//  String _devBy;
//  String _severBy;
//  List<Data> _data;
//
//  Covid19Th(
//      {String updateDate,
//      String source,
//      String devBy,
//      String severBy,
//      List<Data> data}) {
//    this._updateDate = updateDate;
//    this._source = source;
//    this._devBy = devBy;
//    this._severBy = severBy;
//    this._data = data;
//  }
//
//  String get updateDate => _updateDate;
//  set updateDate(String updateDate) => _updateDate = updateDate;
//  String get source => _source;
//  set source(String source) => _source = source;
//  String get devBy => _devBy;
//  set devBy(String devBy) => _devBy = devBy;
//  String get severBy => _severBy;
//  set severBy(String severBy) => _severBy = severBy;
//  List<Data> get data => _data;
//  set data(List<Data> data) => _data = data;
//
//  Covid19Th.fromJson(Map<String, dynamic> json) {
//    _updateDate = json['UpdateDate'];
//    _source = json['Source'];
//    _devBy = json['DevBy'];
//    _severBy = json['SeverBy'];
//    if (json['Data'] != null) {
//      _data = new List<Data>();
//      json['Data'].forEach((v) {
//        _data.add(new Data.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['UpdateDate'] = this._updateDate;
//    data['Source'] = this._source;
//    data['DevBy'] = this._devBy;
//    data['SeverBy'] = this._severBy;
//    if (this._data != null) {
//      data['Data'] = this._data.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
//
//class Data {
//  String _date;
//  int _newConfirmed;
//  int _newRecovered;
//  int _newHospitalized;
//  int _newDeaths;
//  int _confirmed;
//  int _recovered;
//  int _hospitalized;
//  int _deaths;
//
//  Data(
//      {String date,
//      int newConfirmed,
//      int newRecovered,
//      int newHospitalized,
//      int newDeaths,
//      int confirmed,
//      int recovered,
//      int hospitalized,
//      int deaths}) {
//    this._date = date;
//    this._newConfirmed = newConfirmed;
//    this._newRecovered = newRecovered;
//    this._newHospitalized = newHospitalized;
//    this._newDeaths = newDeaths;
//    this._confirmed = confirmed;
//    this._recovered = recovered;
//    this._hospitalized = hospitalized;
//    this._deaths = deaths;
//  }
//
//  String get date => _date;
//  set date(String date) => _date = date;
//  int get newConfirmed => _newConfirmed;
//  set newConfirmed(int newConfirmed) => _newConfirmed = newConfirmed;
//  int get newRecovered => _newRecovered;
//  set newRecovered(int newRecovered) => _newRecovered = newRecovered;
//  int get newHospitalized => _newHospitalized;
//  set newHospitalized(int newHospitalized) =>
//      _newHospitalized = newHospitalized;
//  int get newDeaths => _newDeaths;
//  set newDeaths(int newDeaths) => _newDeaths = newDeaths;
//  int get confirmed => _confirmed;
//  set confirmed(int confirmed) => _confirmed = confirmed;
//  int get recovered => _recovered;
//  set recovered(int recovered) => _recovered = recovered;
//  int get hospitalized => _hospitalized;
//  set hospitalized(int hospitalized) => _hospitalized = hospitalized;
//  int get deaths => _deaths;
//  set deaths(int deaths) => _deaths = deaths;
//
//  Data.fromJson(Map<String, dynamic> json) {
//    _date = json['Date'];
//    _newConfirmed = json['NewConfirmed'];
//    _newRecovered = json['NewRecovered'];
//    _newHospitalized = json['NewHospitalized'];
//    _newDeaths = json['NewDeaths'];
//    _confirmed = json['Confirmed'];
//    _recovered = json['Recovered'];
//    _hospitalized = json['Hospitalized'];
//    _deaths = json['Deaths'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['Date'] = this._date;
//    data['NewConfirmed'] = this._newConfirmed;
//    data['NewRecovered'] = this._newRecovered;
//    data['NewHospitalized'] = this._newHospitalized;
//    data['NewDeaths'] = this._newDeaths;
//    data['Confirmed'] = this._confirmed;
//    data['Recovered'] = this._recovered;
//    data['Hospitalized'] = this._hospitalized;
//    data['Deaths'] = this._deaths;
//    return data;
//  }
//}

class Covid19Th {
  static const String apiUrl = 'https://covid19.th-stat.com/api/open/timeline';

  String updateDate;
  String source;
  String devBy;
  String severBy;
  List<Data> data;

  Covid19Th(
      {this.updateDate, this.source, this.devBy, this.severBy, this.data});

  Covid19Th.fromJson(Map<String, dynamic> json) {
    updateDate = json['UpdateDate'];
    source = json['Source'];
    devBy = json['DevBy'];
    severBy = json['SeverBy'];
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UpdateDate'] = this.updateDate;
    data['Source'] = this.source;
    data['DevBy'] = this.devBy;
    data['SeverBy'] = this.severBy;
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String date;
  int newConfirmed;
  int newRecovered;
  int newHospitalized;
  int newDeaths;
  int confirmed;
  int recovered;
  int hospitalized;
  int deaths;

  Data(
      {this.date,
      this.newConfirmed,
      this.newRecovered,
      this.newHospitalized,
      this.newDeaths,
      this.confirmed,
      this.recovered,
      this.hospitalized,
      this.deaths});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    newConfirmed = json['NewConfirmed'];
    newRecovered = json['NewRecovered'];
    newHospitalized = json['NewHospitalized'];
    newDeaths = json['NewDeaths'];
    confirmed = json['Confirmed'];
    recovered = json['Recovered'];
    hospitalized = json['Hospitalized'];
    deaths = json['Deaths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['NewConfirmed'] = this.newConfirmed;
    data['NewRecovered'] = this.newRecovered;
    data['NewHospitalized'] = this.newHospitalized;
    data['NewDeaths'] = this.newDeaths;
    data['Confirmed'] = this.confirmed;
    data['Recovered'] = this.recovered;
    data['Hospitalized'] = this.hospitalized;
    data['Deaths'] = this.deaths;
    return data;
  }
}
