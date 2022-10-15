defmodule AppImporter.Datastore.StoreTest do
  use ExUnit.Case
  alias AppImporter.Datastore.Storage

  describe "Datastore with caching" do
    setup do
      Supervisor.start_link(children(), strategy: :one_for_one)
      :ok
    end

    test "persists data" do
      product_1 = %{
        "tags" => "Project Management,Project Collaboration,Development Tools",
        "name" => "JIRA Software",
        "twitter" => "jira"
      }

      product_2 = %{
        "tags" => "Instant Messaging & Chat,Web Collaboration,Productivity",
        "name" => "Slack",
        "twitter" => "slackhq"
      }

      assert :ok == Storage.store(product_1)
      assert :ok == Storage.store(product_2)
      assert Storage.get() |> length() == 2
    end
  end

  defp children do
    [
      Storage.worker_spec()
    ]
  end
end
