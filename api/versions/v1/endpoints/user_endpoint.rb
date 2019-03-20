module Api::Versions::V1::Endpoints
  class UserEndpoint < Grape::API 

    resource :users do
    	desc 'Get all users'
      get do
        data = User.all
        present data, with: Api::Versions::V1::Entities::UserEntity
      end


      desc 'Post users'
      params do
        requires :name, type: String
        requires :email, type: String
        optional :company_id, type: Integer
        optional :age, type: String
        requires :address, type: String
        requires :hoby, type: String

      	# requires :user, type: Hash do
       #  	requires :name, type: String
       #  	requires :email, type: String
       #  	optional :company_id, type: Integer
       #  	optional :age, type: String

       #    requires :profile_attributes, type: Hash do
       #      requires :address, type: String
       #      requires :hoby, type: String
       #    end
	      # end
      end

      post do
        user_params = params.slice(:name, :email, :age)
        profile_params = {profile_attributes: params.slice(:address, :hoby)}
        params = user_params.merge(profile_params)
        
        user = User.new params
        
      	# user = User.new declared(params).fetch('user')
        if user.save
          present user, with: Api::Versions::V1::Entities::UserEntity
        else
          error!(user.errors.full_messages, 400)
        end
      end

      desc 'Get user'
      get ':id' do
      	data = User.find params[:id]
      	present data, with: Api::Versions::V1::Entities::UserEntity
      end

      desc 'Delete user'
      delete ':id' do
      	data = User.find params[:id]
      	data.destroy

      	present data, with: Api::Versions::V1::Entities::UserEntity
      end

      desc 'Update user'
      params do
        requires :user, type: Hash do
          requires :name, type: String
          requires :email, type: String
          optional :company_id, type: Integer
          optional :age, type: String
        end
      end

      put do
        user = User.find params[:id]
        user.tap {|u| u.update declared(params).fetch('user')}

        present user, with: Api::Versions::V1::Entities::UserEntity
      end
    end
  end
end