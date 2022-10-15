defmodule AppImporter.Parsers.SoftwareAdvice.Json do
  #   @moduledoc """
  #   SoftwareAdvice Json parser
  #   """

  alias AppImporter.Datastore.Storage

  @behaviour AppImporter.Parsers.Interface

  def parse(path) do
    path
    |> File.stream!()
    |> Jaxon.Stream.from_enumerable()
    |> Jaxon.Stream.query([:root, "products", :all])
    |> Stream.map(&prepare_product_entry(&1))
    |> Stream.each(&Storage.store(&1))
    |> Stream.run()
  end

  defp prepare_product_entry(product) do
    categories = Enum.join(product["categories"], ", ")
    Map.put(product, "categories", categories)
  end
end
