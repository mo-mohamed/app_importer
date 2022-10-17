defmodule AppImporter.Parsers.ParserTest do
  use ExUnit.Case
  alias AppImporter.Parsers.Parser
  alias AppImporter.Datastore.Storage

  @files_path Path.join([File.cwd!(), "test/files"])
  setup_all do
    {:ok, pid} = Supervisor.start_link(children(), strategy: :one_for_one)
    :ok
  end

  test "correctly parses json files" do
    app_name = "capterra"
    file_path = Path.join([@files_path, "capterra.yaml"])
    assert :ok = Parser.parse(app_name, file_path)
    Storage.flush()
  end

  test "correctly parses yaml files" do
    app_name = "softwareadvice"
    file_path = Path.join([@files_path, "softwareadvice.json"])
    assert :ok = Parser.parse(app_name, file_path)
    Storage.flush()
  end

  test "returns error when parser is not implemented" do
    app_name = "softwareadvice"
    file_path = Path.join([@files_path, "softwareadvice.xml"])
    assert {:error, :not_implemented} = Parser.parse(app_name, file_path)
  end

  defp children do
    [
      Storage.worker_spec()
    ]
  end
end
