class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :firstname, :lastname, :info, :authentication_token
end
