defmodule SpellingBeeSolverTest do
  use ExUnit.Case
  doctest SpellingBeeSolver

  test "finds some valid words" do
    word_stream = SpellingBeeSolver.solve("t", ["m","y","r","i","f","o"])

    assert "mortify" in word_stream
    assert "fifty" in word_stream
  end

  test "all words include center letter" do
    word_stream = SpellingBeeSolver.solve("t", ["m","y","r","i","f","o"])

    assert Enum.all?(word_stream, fn word -> String.contains?(word, "t") end)
  end
end
