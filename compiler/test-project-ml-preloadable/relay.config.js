module.exports = {
  src: "./src",
  schema: "../test-project-ml/schema.graphql",
  artifactDirectory: "./src/__generated__",
  customScalarTypes: {
    Datetime: "SomeModule.Datetime",
    Timestamp: "Timestamp.t"
  },
  featureFlags: {
    enable_relay_resolver_transform: true
  },
  persistConfig: {
    file: "./persisted_queries.json",
    algorithm: "MD5" // this can be one of MD5, SHA256, SHA1
  }
};
