defmodule AppImporter.CommandLine do
  def main(args) do
    initial_start()
    IO.inspect(args, label: "ARGS")
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
