defmodule Hydra.PickingsTest do
  use Hydra.DataCase
  import Mock
  alias Hydra.Pickings
  alias Hydra.Pickings.Core.SendProductToKafka

  describe "create_pickings/1" do
    test "Should create pickings" do
      products = %{
        products: [
          %{product: "123", stores: ["123", "123123"]},
          %{product: "123", stores: ["123", "123123"]}
        ]
      }

      with_mock(SendProductToKafka,
        execute: fn _products -> {:ok, {:brod_call_ref, 123, 123, "abc"}} end
      ) do
        assert Pickings.create_pickings(products) == {:ok, {:brod_call_ref, 123, 123, "abc"}}
      end
    end
  end
end
