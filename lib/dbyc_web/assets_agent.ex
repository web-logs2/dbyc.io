defmodule DbycWeb.AssetsAgent do
  use Agent
  require Logger

  def start_link(_opts) do
    manifest = load_assets_manifest()
    Logger.debug(fn -> "manifest loaded\n #{inspect(manifest)}" end)
    Agent.start_link(fn -> manifest end, name: __MODULE__)
  end

  def get_manifest() do
    Agent.get(__MODULE__, & &1)
  end

  defp load_assets_manifest() do
    dir = Application.app_dir(:dbyc, "priv/static")
    path = Path.join(dir, "manifest.json")

    if File.exists?(path) do
      path |> File.read!() |> Jason.decode!()
    else
      %{}
    end
  end
end
