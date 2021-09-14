defmodule DbycWeb.PageController do
  use DbycWeb, :controller

  def index(conn, _params) do
    env = Mix.env()

    conn
    |> put_layout(false)
    |> render("index.html", env: env)
  end
end
