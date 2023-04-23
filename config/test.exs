import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fetcher_service, FetcherServiceWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "FTmMBBuKrEHOe5sp4TVk1h0nnSRW57WwIR5jOv+3/Va/2JAufuuaJFHbTpBqorOl",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
