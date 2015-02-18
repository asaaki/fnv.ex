defmodule FNVTestSetup do
  defmacro input_data do
    quote do
      [
        "",
        "fnv",
        "23569",
        "Shôúld wörk with ŨTF-8, too. 🌈🌠💋👍✓",
        """
        Some longer text

        Cupcake ipsum dolor sit amet pastry cake jelly. I love jujubes powder. Jelly lollipop oat cake cupcake bear claw lemon drops. Wafer sweet roll gingerbread. Chocolate cake donut sesame snaps sweet roll. Sweet roll sweet roll marzipan. Lollipop I love jelly-o oat cake lollipop jelly candy canes chocolate. Tootsie roll gummies sesame snaps cake. Marshmallow I love brownie I love powder lollipop lemon drops lollipop. Powder jelly jelly cotton candy I love apple pie. Pie cheesecake apple pie candy canes sweet roll. Chocolate bar dragée chupa chups donut chocolate cake brownie. Icing apple pie donut gummies macaroon halvah dessert I love brownie. Sweet pudding dragée fruitcake.
        Muffin chocolate bar chupa chups dessert. Tootsie roll cake caramels bear claw sugar plum pie. Bear claw tart sesame snaps croissant I love biscuit sesame snaps muffin I love. Muffin macaroon pie candy dragée sesame snaps halvah sugar plum caramels. Candy canes sugar plum pudding icing gummies pastry. Cotton candy bonbon pie I love chocolate. Cake I love marzipan tart tiramisu. I love dragée dessert cupcake sweet roll pudding candy. Candy canes toffee jujubes macaroon. Apple pie gingerbread cotton candy macaroon chocolate cake gummi bears cake danish. Chocolate cake sugar plum cake I love cake wafer lollipop brownie powder. Bonbon tiramisu cotton candy jujubes bonbon brownie biscuit.
        """
      ]
    end
  end

  defmacro outputs_bits, do: [32, 64, 128, 256, 512, 1024]
end

ExUnit.start
