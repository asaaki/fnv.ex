defmodule FNV.FNV1a do
  use FNV.Algo
  @compile { :inline }

  @moduledoc """
  ## Fowler–Noll–Vo hash functions, variant 1a (FNV-1a)

  Collection of functions to calculate a FNV-1 hash for different bit lengths.
  """

  def calculate_hash(_, _, current_hash, <<>>), do: current_hash
  def calculate_hash(bits, prime, current_hash, << octet :: 8, rest :: binary >>) do
    new_hash = current_hash |> bxor(octet) |> :erlang.*(prime) |> rem(2 <<< (bits - 1))
    calculate_hash(bits, prime, new_hash, rest)
  end
end
