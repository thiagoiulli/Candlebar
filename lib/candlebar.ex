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
    maior = 0
    menor = 99_999_999_999_999_999_999

    file =
      file
      |> File.stream!()
      |> Stream.map(& &1)
      |> CSV.decode!(headers: true)

    # length = Enum.count(file)

    for part <- file do
      # da erro no 6 caso
      if(part["low"] < menor) do
        menor = String.to_float(part["low"])
        IO.puts(menor)
      end
    end

    # Enum.each(0..5, fn number ->
    # IO.inspect(Enum.at(file, number))
    # if(String.to_float(Enum.at(file, number)["low"]) < menor) do
    # menor = String.to_float(Enum.at(file, number)["low"])
    # end
    # end)

    IO.puts(menor)
  end
end
