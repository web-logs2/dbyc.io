defmodule DbycWeb.PageController do
  use DbycWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
