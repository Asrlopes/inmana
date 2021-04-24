defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "Siri cascudo",
                 email: "siri@cascudo.com"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "", email: "gmail.com"}
      expected_response = %{email: ["has invalid format"], name: ["can't be blank"]}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
