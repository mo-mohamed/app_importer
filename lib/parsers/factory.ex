defmodule AppImporter.Parsers.Factory do
  #   @moduledoc """
  #   This module selects the parser to be used based on app name and file extension
  #   """
  alias AppImporter.Parsers

  def parser(app, file_path) do
    file_extension = Path.extname(file_path)
    get_parser(String.downcase(app), String.downcase(file_extension))
  end

  defp get_parser("capterra", ".yaml"), do: {:ok, Parsers.Capterra.Yaml}
  defp get_parser("softwareadvice", ".json"), do: {:ok, Parsers.SoftwareAdvice.Json}
  defp get_parser(_, _), do: {:error, :not_implemented}
end
