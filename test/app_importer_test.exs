defmodule AppImporterTest do
  use ExUnit.Case
  doctest AppImporter

  test "greets the world" do
    assert AppImporter.hello() == :world
  end
end
