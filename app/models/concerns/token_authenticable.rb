module TokenAuthenticable
  extend ActiveSupport::Concern

  included do
    before_save :ensure_authentication_token
  end

  module ClassMethods
    def find_by_token(token)
      find_by(authentication_token: token)
    end
  end

  def generate_authentication_token!
    begin
      self.authentication_token = auth_token
    end while self.class.exists?(authentication_token: authentication_token)
  end

  private
    def auth_token
      SecureRandom.uuid.tr('-', '')
    end

    def ensure_authentication_token
      generate_authentication_token! if authentication_token.blank?
    end

end
