defmodule FNV.FNV1 do
  use FNV.Algo
  @compile { :inline }

  @moduledoc """
  ## Fowler–Noll–Vo hash functions, variant 1 (FNV-1)

  Collection of functions to calculate a FNV-1 hash for different bit lengths.
  """

  def calculate_hash(_, _, current_hash, <<>>), do: current_hash
  def calculate_hash(bits, prime, current_hash, << octet :: 8, rest :: binary >>) do
    new_hash = current_hash |> :erlang.*(prime) |> bxor(octet) |> rem(2 <<< (bits - 1))
    calculate_hash(bits, prime, new_hash, rest)
  end
end
