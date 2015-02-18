defmodule FNV do
  @moduledoc """
  Fowler–Noll–Vo hash functions collection.

  Please refer to the module of the variant you want to use for more details:

  - `FNV.FNV1`
  - `FNV.FNV1a`

  ## Difference between both variants

      The only difference between the FNV-1a hash and the FNV-1 hash is the
      order of the xor and multiply. The FNV-1a hash uses the same FNV_prime
      and offset_basis as the FNV-1 hash of the same n-bit size.

  Source: <http://www.isthe.com/chongo/tech/comp/fnv/index.html#FNV-1a>

  It is recommended to prefer `FNV-1a`, as people state that this variant
  produces slightly better results than `FNV-1`.

  ## Further reading

  - <http://www.isthe.com/chongo/tech/comp/fnv/index.html>
  - [http://en.wikipedia.org/wiki/Fowler–Noll–Vo_hash_function](http://en.wikipedia.org/wiki/Fowler%E2%80%93Noll%E2%80%93Vo_hash_function)
  """
end
