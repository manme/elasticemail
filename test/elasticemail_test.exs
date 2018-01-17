defmodule ElasticEmailTest do
  use ExUnit.Case
  doctest ElasticEmail

  test "greets the world" do
    assert ElasticEmail.hello() == :world
  end
end
