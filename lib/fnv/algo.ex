defmodule FNV.Algo do
  use Behaviour

  @moduledoc "Implemenation of generic functions for hash calculations."

  defcallback calculate_hash(bits :: integer, prime :: integer, current_hash :: integer, binary_data :: binary) :: integer

  defmacro __using__(_) do
    quote location: :keep do
      @behaviour unquote(__MODULE__)
      @compile { :inline }
      use Bitwise

      @doc """
      Returns an integer hash of provided bit length.
      Input must be a binary/string.

      ## Examples

          FNV.FNV1.hash("fnv", 32)
          #=> 1099915385

          FNV.FNV1a.hash("fnv", 32)
          #=> 3002452889
      """
      def hash(data, bit_length) when is_binary(data) and bit_length in unquote(FNV.Params.supported_bit_lengths) do
        apply(unquote(__MODULE__), :hash, [__MODULE__, data, bit_length])
      end

      @doc "Shortcut for `hash(data, 32)`"
      def hash32(data)   when is_binary(data), do: apply(unquote(__MODULE__), :hash, [__MODULE__, data, 32])
      @doc "Shortcut for `hash(data, 64)`"
      def hash64(data)   when is_binary(data), do: apply(unquote(__MODULE__), :hash, [__MODULE__, data, 64])
      @doc "Shortcut for `hash(data, 128)`"
      def hash128(data)  when is_binary(data), do: apply(unquote(__MODULE__), :hash, [__MODULE__, data, 128])
      @doc "Shortcut for `hash(data, 256)`"
      def hash256(data)  when is_binary(data), do: apply(unquote(__MODULE__), :hash, [__MODULE__, data, 256])
      @doc "Shortcut for `hash(data, 512)`"
      def hash512(data)  when is_binary(data), do: apply(unquote(__MODULE__), :hash, [__MODULE__, data, 512])
      @doc "Shortcut for `hash(data, 1024)`"
      def hash1024(data) when is_binary(data), do: apply(unquote(__MODULE__), :hash, [__MODULE__, data, 1024])

      @doc """
      Returns a hexadecimal hash of provided bit length.
      Input must be a binary/string.

      ## Examples

          FNV.FNV1.hex("fnv", 32)
          #=> "418f6079"

          FNV.FNV1a.hex("fnv", 32)
          #=> "b2f5cb99"
      """
      def hex(data, bit_length) when is_binary(data) and bit_length in unquote(FNV.Params.supported_bit_lengths) do
        apply(unquote(__MODULE__), :hex, [__MODULE__, data, bit_length])
      end

      @doc "Shortcut for `hex(data, 32)`"
      def hex32(data)   when is_binary(data), do: apply(unquote(__MODULE__), :hex, [__MODULE__, data, 32])
      @doc "Shortcut for `hex(data, 64)`"
      def hex64(data)   when is_binary(data), do: apply(unquote(__MODULE__), :hex, [__MODULE__, data, 64])
      @doc "Shortcut for `hex(data, 128)`"
      def hex128(data)  when is_binary(data), do: apply(unquote(__MODULE__), :hex, [__MODULE__, data, 128])
      @doc "Shortcut for `hex(data, 256)`"
      def hex256(data)  when is_binary(data), do: apply(unquote(__MODULE__), :hex, [__MODULE__, data, 256])
      @doc "Shortcut for `hex(data, 512)`"
      def hex512(data)  when is_binary(data), do: apply(unquote(__MODULE__), :hex, [__MODULE__, data, 512])
      @doc "Shortcut for `hex(data, 1024)`"
      def hex1024(data) when is_binary(data), do: apply(unquote(__MODULE__), :hex, [__MODULE__, data, 1024])
    end
  end

  ### Shared functions

  @compile { :inline }

  @doc false
  for { bit, prime, offset_basis} <- FNV.Params.all_params do
    def hash(callback_module, data, unquote(bit)) do
      apply(callback_module, :calculate_hash, [unquote(bit), unquote(prime), unquote(offset_basis), data])
    end
  end

  @doc false
  for { bit, _, _ } <- FNV.Params.all_params do
    def hex(callback_module, data, unquote(bit)) do
      <<hash(callback_module, data, unquote(bit))::unquote(bit)>> |> Base.encode16(case: :lower)
    end
  end
end
