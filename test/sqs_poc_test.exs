defmodule SqsPocTest do
  use ExUnit.Case
  doctest SqsPoc

  test "greets the world" do
    assert SqsPoc.hello() == :world
  end
end
