defmodule DbycWeb.CounterLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    Current <%= @temperature %>
    """
  end

  def mount(_params, _, socket) do
    if connected?(socket) do
      Process.send_after(self(), :update, 1000)
    end

    temperature = 100
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 1000)
    last = socket.assigns[:temperature]
    IO.inspect(last)
    {:noreply, assign(socket, :temperature, last + 1)}
  end
end
