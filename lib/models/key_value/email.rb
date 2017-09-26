module Models
  module KeyValue
    class Email < Base
      validates :value, format: {with: /@/, message: 'Invalid email format.'}, allow_blank: true
      validates :value, presence: {message: 'Email must be present.'}
    end
  end
end