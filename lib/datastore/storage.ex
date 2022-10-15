defmodule AppImporter.Datastore.Storage do
  #   @moduledoc """
  #   Abstract module that handles data storing and retrieval.
  #   It determines which data store type being used (Cache, database, etc..) and provides
  #   APIs for storing data
  #   """

  def worker_spec do
    case storage_type() do
      "cache" ->
        {ConCache,
         [
           name: Application.get_env(:app_importer, :data_store_cache)[:key],
           ttl_check_interval: false
         ]}

      "database" ->
        throw("Datastore not implemented")

      _ ->
        throw("Not implemented")
    end
  end

  def store(data) do
    storage = storage_module()
    IO.inspect("Importing entry: #{inspect(data)}")
    storage.store(data)
    IO.puts("Importing completed")
  end

  def get() do
    storage = storage_module()
    storage.get()
  end

  defp storage_type, do: Application.get_env(:app_importer, :data_store)[:type]

  defp storage_module do
    case Application.get_env(:app_importer, :data_store)[:type] do
      "cache" -> AppImporter.Datastore.Cache.Store
      "database" -> AppImporter.Datastore.Database.Store
      _ -> throw("Not supported datastore type")
    end
  end
end
