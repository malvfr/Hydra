defmodule Hydra.Pickings do
  alias Hydra.Pickings.Core.SendProductToKafka

  def create_pickings(products) do
    %{
      products: [
        %{product: "123", stores: ["123", "123123"]},
        %{product: "123", stores: ["123", "123123"]}
      ]
    }

    SendProductToKafka.execute(products)
  end
end
