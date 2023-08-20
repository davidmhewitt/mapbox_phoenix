defmodule MapboxPhoenixWeb.MapLive do
  use MapboxPhoenixWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
