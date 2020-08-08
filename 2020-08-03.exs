# Sort an array of strings based on the number of distinct characters that occur in the word (followed by the length of the word).

words = ["Bananas", "do", "not", "grow", "in", "Mississippi"]

words
|> Enum.map(fn word ->
  nb_graphemes =
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.uniq()
    |> length()

  word_length = String.length(word)

  {word, nb_graphemes, word_length}
end)
|> Enum.sort(fn {_, nb_graphemes1, length1}, {_, nb_graphemes2, length2} ->
  cond do
    nb_graphemes1 < nb_graphemes2 -> true
    nb_graphemes2 < nb_graphemes1 -> false
    true -> length1 >= length2
  end
end)
|> Enum.map(fn {word, _, _} -> word end)
|> Enum.join(" ")
|> IO.puts()
