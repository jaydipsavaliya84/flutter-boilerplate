enum Environment {
  staging,
  production,
}

class BuildConfiguration {
  static final shared = BuildConfiguration();

  late Environment environment;

  String get baseUrl {
    switch (environment) {
      case Environment.staging:
        return "https://staging-apis/api/v2/";
      case Environment.production:
        return "https://apis.stockpe/api/v2/";
    }
  }

  String get mode {
    switch (environment) {
      case Environment.staging:
        return "TEST";
      case Environment.production:
        return "PROD";
    }
  }
}
