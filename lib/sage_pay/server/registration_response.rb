module SagePay
  module Server
    class RegistrationResponse < SagePay::Shared::RegistrationResponse

      attr_accessor_if_ok :next_url

      self.key_converter = key_converter.merge({
        "NextURL"      => :next_url
      })

    end
  end
end
