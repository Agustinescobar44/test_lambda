defmodule TestLambdaTest do
  use ExUnit.Case
  doctest TestLambda

  test "greets the world" do
    assert TestLambda.hello() == :world
  end
end
