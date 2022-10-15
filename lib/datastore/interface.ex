defmodule AppImporter.Datastore.Interface do
  #   @moduledoc """
  #   This module holds common Data store interface functions, it has to be implemented in all data stores.
  #   """

  @callback store(data :: map()) :: :ok
  @callback get() :: {:ok, [map()]} | {:error, any()}
end
