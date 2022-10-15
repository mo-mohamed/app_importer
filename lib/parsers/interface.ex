defmodule AppImporter.Parsers.Interface do
  #   @moduledoc """
  #   This module holds common Parser interface, it has to be implemented in all parsers.
  #   """

  @callback parse(file_path :: String.t()) :: :ok
end
