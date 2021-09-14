defmodule DbycWeb.PageView do
  use DbycWeb, :view

  def assets_path(name, field) do
    manifest = DbycWeb.AssetsAgent.get_manifest()
    manifest[name][field]
  end
end
