defmodule AppImporter.Parsers.Parser do
  alias AppImporter.Parsers.Factory

  def parse(app_name, file_path) do
    case Factory.parser(app_name, file_path) do
      {:ok, parser} -> parser.parse(file_path)
      {:error, err} -> {:error, err}
    end
  end
end
