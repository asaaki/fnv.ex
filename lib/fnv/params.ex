defmodule FNV.Params do
  use Bitwise, only: [{:<<<, 2}]
  @compile { :inline }

  @moduledoc "Support module, not intended to be used directly"

  # Supported output lengths
  @bits [32, 64, 128, 256, 512, 1024]

  # The FNV primes for the bit lengths
  @primes [
    (2 <<< 23)  + (2 <<< 7) + 0x93,
    (2 <<< 39)  + (2 <<< 7) + 0xb3,
    (2 <<< 87)  + (2 <<< 7) + 0x3b,
    (2 <<< 167) + (2 <<< 7) + 0x63,
    (2 <<< 343) + (2 <<< 7) + 0x57,
    (2 <<< 679) + (2 <<< 7) + 0x8d
  ]

  # The FNV offset bases for the bit lengths
  @offset_bases [
    2166136261,
    14695981039346656037,
    144066263297769815596495629667062367629,
    100029257958052580907070968620625704837092796014241193945225284501741471925557,
    9659303129496669498009435400716310466090418745672637896108374329434462657994582932197716438449813051892206539805784495328239340083876191928701583869517785,
    14197795064947621068722070641403218320880622795441933960878474914617582723252296732303717722150864096521202355549365628174669108571814760471015076148029755969804077320157692458563003215304957150157403644460363550505412711285966361610267868082893823963790439336411086884584107735010676915
  ]

  # Merged set of bit lengths, primes and offset bases
  @params List.zip([@bits, @primes, @offset_bases])

  @doc """
  Returns the prime and offset basisfor the given bit length (must be one of #{inspect @bits}).
  For invalid values it returns an empty dict/list.

  ## Examples

      FNV.Params.params_for(64)
      #=> [prime: 1099511628211, offset_basis: 14695981039346656037]

      FNV.Params.params_for(99)
      #=> []
  """
  def params_for(desired_bit_length)
  for { bit, prime, offset_basis} <- @params do
    def params_for(unquote(bit)) do
      [prime: unquote(prime), offset_basis: unquote(offset_basis)]
    end
  end
  def params_for(_), do: []

  @doc "Returns a list of all supported bit lengths"
  def supported_bit_lengths, do: @bits

  @doc "Returns a list of all necessary data for calculating the hashes (bit length, prime and offset basis)"
  def all_params, do: @params
end
