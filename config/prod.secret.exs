use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :phoenix_channel_monitoring_visualization, PhoenixChannelMonitoringVisualization.Endpoint,
  secret_key_base: "3JcIR43EXHDGTX58nKo3+wNdQzA+ddbrR+c8zCnMJhvR2ZnQApC9ZGlbLBEccPWq"

# Configure your database
config :phoenix_channel_monitoring_visualization, PhoenixChannelMonitoringVisualization.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "phoenix_channel_monitoring_visualization_prod"
