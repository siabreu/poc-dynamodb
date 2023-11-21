module Dynamo
  class Access
    include Dynamoid::Document

    table name: :accesses, key: :user_id, capacity_mode: :on_demand

    field :application, :string
    field :email, :string
    field :token, :string
  end
end
