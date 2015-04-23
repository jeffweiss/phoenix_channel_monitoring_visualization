defmodule PhoenixChannelMonitoringVisualization.Endpoint do
  use Phoenix.Endpoint, otp_app: :phoenix_channel_monitoring_visualization

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :phoenix_channel_monitoring_visualization,
    only: ~w(css images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_phoenix_channel_monitoring_visualization_key",
    signing_salt: "NTrnT4R2",
    encryption_salt: "pLmW6XU1"

  plug :router, PhoenixChannelMonitoringVisualization.Router
end
