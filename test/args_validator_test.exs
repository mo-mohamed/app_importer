defmodule AppImporter.ArgsValidatorTest do
  use ExUnit.Case
  alias AppImporter.ArgsValidator

  @files_path Path.join([File.cwd!(), "test/files"])

  describe "Validation" do
    test "returns false if number of arguments are incorrect - expecting two at least" do
      refute ArgsValidator.valid_args?([])
      refute ArgsValidator.valid_args?(["param_1"])
    end

    test "returns false if app is not supported" do
      app_name = "non_supported"
      file_path = Path.join([@files_path, "capterra.yaml"])
      assert File.exists?(file_path)
      refute ArgsValidator.valid_args?([app_name, file_path])
    end

    test "returns false if file cannot be located" do
      app_name = "capterra"
      file_path = Path.join([@files_path, "non_existing.yaml"])
      refute File.exists?(file_path)
      refute ArgsValidator.valid_args?([app_name, file_path])
    end

    test "returns true if paramaters are valid" do
      app_name = "capterra"
      file_path = Path.join([@files_path, "capterra.yaml"])
      assert ArgsValidator.valid_args?([app_name, file_path])
    end
  end
end
