defmodule HydraGraphql.Resolvers.PickingResolver do
  require Logger

  def create_picking(_parent, params, _resolution) do
    Logger.debug("Create picking params: #{inspect(params)}")
    {:ok, "We received the payload and we are going to create all orders"}
  end
end
