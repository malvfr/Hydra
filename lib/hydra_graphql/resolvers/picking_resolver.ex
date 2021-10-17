defmodule HydraGraphql.Resolvers.PickingResolver do
  alias Hydra.Pickings
  require Logger

  def create_picking(_parent, params, _resolution) do
    Logger.debug("Create picking params: #{inspect(params)}")
    Task.async(fn -> Pickings.create_pickings(params) end)
    {:ok, "We received the payload and we are going to create all orders"}
  end
end
