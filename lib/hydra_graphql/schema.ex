defmodule HydraGraphql.Schema do
  use Absinthe.Schema
  alias HydraGraphql.Resolvers
  import_types(HydraGraphql.Types)

  query do
  end

  mutation do
    @desc "Create picking"
    field :create_picking, type: :string do
      arg(:products, list_of(non_null(:products_input)))
      resolve(&Resolvers.PickingResolver.create_picking/3)
    end
  end
end
