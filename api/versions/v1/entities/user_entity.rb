module Api::Versions::V1::Entities
  class UserEntity < Grape::Entity
    expose :id, :name, :email, :age, :company_id
    expose :profile, using: Api::Versions::V1::Entities::ProfileEntity
  end
end