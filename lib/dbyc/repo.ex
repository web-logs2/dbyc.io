defmodule Dbyc.Repo do
  use Ecto.Repo,
    otp_app: :dbyc,
    adapter: Ecto.Adapters.Postgres
end
