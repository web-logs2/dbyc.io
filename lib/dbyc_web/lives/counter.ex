defmodule DbycWeb.CounterLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <div><%= @time %></div>
    """
  end

  def mount(_params, _, socket) do
    if connected?(socket) do
      Process.send_after(self(), :update, 1000)
    end

    {:ok, assign(socket, time: now())}
  end

  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 1000)
    time = now()
    {:noreply, assign(socket, time: time, page_title: "current time: #{time}")}
  end

  defp now() do
    %{hour: hour, minute: minute, second: second} = DateTime.now!("Asia/Shanghai")
    "#{hour}:#{minute}:#{second}"
  end
end
