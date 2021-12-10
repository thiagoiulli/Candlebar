defmodule Candlebar do
  def get do
    System.argv()
    |> List.first()
    |> parse
  end

  def get(file) do
    file
    |> Path.expand(__DIR__)
    |> parse
  end

  def parse(file) do
    file
    |> File.stream!()
    |> Stream.map(& &1)
    |> CSV.decode(headers: true)
    |> Enum.take(3)
  end
end
