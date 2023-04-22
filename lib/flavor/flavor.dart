enum Flavor { DEV, UAT, STG, PROD, NATIVE, BETA }

extension FlavorExtensions on Flavor {
  String get displayText {
    switch (this) {
      case Flavor.DEV:
        return 'dev';
      case Flavor.STG:
        return 'stg';
      case Flavor.PROD:
        return 'prod';
      case Flavor.NATIVE:
        return 'native';
      case Flavor.UAT:
        return 'uat';
      case Flavor.BETA:
        return 'beta';
    }
  }
}
