defmodule DbycWeb.PageView do
  use DbycWeb, :view
  alias DbycWeb.AssetsAgent

  def assets_path(name, field) do
    manifest = AssetsAgent.get_manifest()
    manifest[name][field]
  end

  def assets_imports(name, field) do
    manifest = AssetsAgent.get_manifest()
    list = manifest[name]["imports"] || []
    list |> Enum.map(&manifest[&1][field]) |> Enum.filter(& &1)
  end
end
