module Models
  module KeyValue
    class UserId < Base
      validates :value, presence: {message: "User ID can't be blank."}
    end
  end
end