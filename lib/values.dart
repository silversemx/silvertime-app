const String serverURL = String.fromEnvironment(
  "SERVER_URL", defaultValue: "https://time.silverse.mx"
);

const String forcedBearerToken = String.fromEnvironment("FORCE_BEARER_TOKEN");

const String runtime = String.fromEnvironment("RUNTIME", defaultValue: "Production");

const String domain = String.fromEnvironment(
  "DOMAIN", defaultValue: ".silverse.mx"
);

const String appName = String.fromEnvironment(
  "APP_NAME", defaultValue: "silvertime"
);

const String alias = String.fromEnvironment("ALIAS", defaultValue: "app");

const String jwtKey = String.fromEnvironment(
  "JWT_KEY", defaultValue: "silverse-jwt"
);