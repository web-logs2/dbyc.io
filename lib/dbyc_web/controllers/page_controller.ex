defmodule DbycWeb.PageController do
  use DbycWeb, :controller

  def index(conn, _params) do
    env = System.get_env("MIX_ENV", "dev")

    conn
    |> put_layout(false)
    |> render("index.html", env: env)
  end
end
