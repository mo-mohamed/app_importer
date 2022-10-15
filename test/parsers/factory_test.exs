defmodule AppImporter.Parsers.FactoryTest do
  use ExUnit.Case
  alias AppImporter.Parsers.Factory

  describe "Parser" do
    test "returns {:ok, parser} the correct parser" do
      assert Factory.parser("capterra", "file.yaml") ==
               {:ok, AppImporter.Parsers.Capterra.Yaml}

      assert Factory.parser("softwareadvice", "file.json") ==
               {:ok, AppImporter.Parsers.SoftwareAdvice.Json}
    end

    test "returns {:error, :not_implemented} if app/parser type extension is not implemented" do
      assert Factory.parser("another_app", "file.json") == {:error, :not_implemented}
      assert Factory.parser("capterra", "file.xml") == {:error, :not_implemented}
      assert Factory.parser("capterra", "file.json") == {:error, :not_implemented}
      assert Factory.parser("softwareadvice", "csv.xml") == {:error, :not_implemented}
      assert Factory.parser("softwareadvice", "file.yaml") == {:error, :not_implemented}
    end
  end
end
