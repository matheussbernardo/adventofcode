defmodule Part1 do
  def calc_measurements_increase(list) do
    first_item = List.first(list)

    result =
      list
      |> Enum.reduce(%{value: 0, previous: first_item}, &Part1.new_value/2)

    result[:value]
  end

  def new_value(line, acc) do
    if line > acc[:previous] do
      %{value: acc[:value] + 1, previous: line}
    else
      %{value: acc[:value], previous: line}
    end
  end
end

defmodule Part2 do
  def generate_windows(list) do
    Enum.chunk_every(list, 3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
  end
end

list =
  File.read!("day1_input1.txt")
  |> String.split()
  |> Enum.map(&String.to_integer/1)

list |> Part1.calc_measurements_increase() |> IO.puts()

list |> Part2.generate_windows() |> Part1.calc_measurements_increase() |> IO.puts()
