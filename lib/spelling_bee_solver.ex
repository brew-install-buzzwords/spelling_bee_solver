defmodule SpellingBeeSolver do
  def solve(center, edges) do
    WordList.getStream!()
    |> Stream.filter(fn word -> String.length(word) > 3 end)
    |> Stream.filter(fn word -> String.contains?(word, center) end)
    |> Stream.filter(fn word ->
      String.split(word, "", trim: true)
      |> Enum.all?(fn letter -> letter in edges ++ [center] end)
    end)
  end

  def printSolution(center, edges) do
    solve(center, edges)
    |> Enum.each(fn x -> IO.puts(x) end)
  end
end

# SpellingBeeSolver.printSolution("t", ["m","y","r","i","f","o"])
