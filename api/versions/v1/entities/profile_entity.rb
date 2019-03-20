module Api::Versions::V1::Entities
  class ProfileEntity < Grape::Entity
    expose :address, :hoby
  end
end