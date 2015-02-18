defmodule FNV.FNV1a do
  alias FNV.Params

  @moduledoc """
  ## Fowler–Noll–Vo hash functions, variant 1a (FNV-1a)

  Collection of functions to calculate a FNV-1a hash for different bit lengths.

  ## Available functions:

  ### Integer Hashes

  #{for bit_length <- FNV.Params.supported_bit_lengths, into: "", do: "- FNV.FNV1a.hash_" <> Integer.to_string(bit_length) <> "/1\n"}

  ### Hexadecimal hashes (strings)

  #{for bit_length <- FNV.Params.supported_bit_lengths, into: "", do: "- FNV.FNV1a.hex_" <> Integer.to_string(bit_length) <> "/1\n"}
  """

  use Bitwise, only: [{ :bxor, 2 }, { :<<<, 2}]

  for { bit, prime, offset_base } <- Params.all_params do
    function_name = :"hash_#{bit}"

    @doc """
    Returns a #{bit} bit integer FNV-1a hash of the input data.
    Input must be a binary/string.

    ## Example

        FNV.FNV1a.#{function_name}(data)
        #=> <integer value>
    """
    def unquote(function_name)(data) when is_binary(data) do
      hash(unquote(bit), unquote(prime), unquote(offset_base), data)
    end
  end

  for { bit, _, _ } <- Params.all_params do
    function_name = :"hex_#{bit}"
    hasher        = :"hash_#{bit}"
    hex_digits    = div(bit, 4) # 2 digits = 1 byte ~> 1 digit = 1 "halfbyte" (8 / 2 = 4 bits per digit)

    @doc """
    Returns a hexadecimal representation of #{bit} bit FNV-1a hash of the input data.
    The result will always have #{hex_digits} hex digits (with leading zeros as padding).
    Input must be a binary/string.

    ## Example

        FNV.FNV1a.#{function_name}(data)
        #=> "<hex value as string>"
    """
    def unquote(function_name)(data) when is_binary(data) do
      unquote(hasher)(data) |> Hexate.encode(unquote(hex_digits))
    end
  end

  defp hash(_, _, current_hash, <<>>), do: current_hash
  defp hash(bits, prime, current_hash, << octet :: 8, rest :: binary >>) do
    new_hash = current_hash |> bxor(octet) |> :erlang.*(prime) |> rem(2 <<< (bits - 1))
    hash(bits, prime, new_hash, rest)
  end
end
