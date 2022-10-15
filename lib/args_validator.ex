defmodule AppImporter.ArgsValidator do
  #   @moduledoc """
  #   This odule holds arguments validations for the App Importer tool.
  #   """

  @allowed_apps ["capterra", "softwareadvice"]

  #   @doc """
  #   Validates arguments passed from CLI.
  #   """
  def valid_args?(params) when is_list(params) and length(params) >= 2 do
    with true <- params |> Enum.at(0) |> valid_app?(),
         true <- params |> Enum.at(1) |> valid_file_path?() do
      true
    else
      _ -> false
    end
  end

  def valid_args?(_), do: false

  defp valid_app?(app_name)
       when is_binary(app_name),
       do: String.downcase(app_name) in @allowed_apps

  defp valid_app?(_), do: false

  defp valid_file_path?(file_path) when is_binary(file_path), do: File.exists?(file_path)
  defp valid_file_path?(_), do: false
end
