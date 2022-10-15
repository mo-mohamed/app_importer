defmodule AppImporter.Datastore.Cache.Store do
  #   @moduledoc """
  #   Caching mechanism for storing data
  #   """

  @behaviour AppImporter.Datastore.Interface

  @cache_name Application.get_env(:app_importer, :data_store_cache)[:key]
  @products_key "products"

  def store(data) do
    ConCache.put(@cache_name, @products_key, exisitng_data() ++ [data])
  end

  def get() do
    ConCache.get(@cache_name, @products_key)
  end

  defp exisitng_data do
    case get() do
      nil -> []
      data -> data
    end
  end
end
