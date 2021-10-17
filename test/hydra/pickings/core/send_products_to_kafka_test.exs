defmodule Hydra.Pickings.Core.SendProductToKafkaTest do
  alias Hydra.Pickings.Core.SendProductToKafka
  use Hydra.DataCase
  import Mock

  test "Should send products to kafka" do
    with_mock(:brod,
      start_client: fn _hosts, _client_id -> :ok end,
      start_producer: fn _client_id, _topic, _opts -> :ok end,
      produce: fn _client_id, _topic, _partition, _key, _payload ->
        {:ok, {:brod_call_ref, 123, 123, "abc"}}
      end
    ) do
      products = %{
        products: [
          %{product: "123", stores: ["123", "123123"]},
          %{product: "123", stores: ["123", "123123"]}
        ]
      }

      assert SendProductToKafka.execute(products) == {:ok, {:brod_call_ref, 123, 123, "abc"}}
    end
  end
end
