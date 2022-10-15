defmodule AppImporter.Parsers.Capterra.Yaml do
  #   @moduledoc """
  #   Capterra Yaml parser
  #   """
  @behaviour AppImporter.Parsers.Interface

  @rejected_lines [["---\n"], ["-\n"]]
  @chunk_by "-\n"

  def parse(path) do
    path
    |> File.stream!()
    |> Stream.chunk_by(fn line -> line == @chunk_by end)
    |> Stream.reject(fn line -> line in @rejected_lines end)
    |> Stream.map(&prepare_entry(&1))
    |> Stream.each(fn p -> IO.inspect(p, label: "To Data Store") end)
    |> Stream.run()
  end

  defp prepare_entry(entry) do
    entry
    |> Enum.join("")
    |> YamlElixir.read_from_string!()
  end
end
