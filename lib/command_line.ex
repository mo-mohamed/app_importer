defmodule AppImporter.CommandLine do
  alias AppImporter.Parsers.Parser
  alias AppImporter.ArgsValidator

  def main(args) do
    initial_start()

    with true <- ArgsValidator.valid_args?(args),
         :ok <- Parser.parse(Enum.at(args, 0), Enum.at(args, 1)) do
      IO.puts("Importing completed")
    else
      false -> IO.puts("Invalid args, please provide valid add name and file path")
      error -> IO.puts("Error occure: #{inspect(error)}")
    end
  end

  defp initial_start do
    Supervisor.start_link(children(), strategy: :one_for_one)
  end

  defp children do
    [
      AppImporter.Datastore.Storage.worker_spec()
    ]
  end
end
