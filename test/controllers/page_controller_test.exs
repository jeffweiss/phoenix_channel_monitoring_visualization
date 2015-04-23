defmodule PhoenixChannelMonitoringVisualization.PageControllerTest do
  use PhoenixChannelMonitoringVisualization.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert conn.resp_body =~ "Welcome to Phoenix!"
  end
end
