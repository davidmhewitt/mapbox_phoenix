defmodule MapboxPhoenixWeb.MapLive do
  use MapboxPhoenixWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("marker-moved", %{"coord" => [lng, lat]}, socket) do
    IO.puts("Marker moved! Location: #{lng}, #{lat}")

    {:noreply, socket}
  end
end
