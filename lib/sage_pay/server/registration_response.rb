module SagePay
  module Server
    class RegistrationResponse < SagePay::Shared::Response

      attr_accessor_if_ok :next_url, :vps_tx_id, :security_key

      self.key_converter = key_converter.merge({
        "NextURL"      => :next_url,
        "VPSTxId"      => :vps_tx_id,
        "SecurityKey"  => :security_key
      })

    end
  end
end
