module SagePay
  module Direct
    class << self
      attr_accessor :default_registration_options
    end

    # NOTE: Expected to be something along the lines of:
    #
    #     SagePay::Direct.default_registration_options = {
    #       :mode => :live,
    #       :vendor => "rubaidh"
    #     }
    #
    # ... which you'll want to stick in config/initializers/sage_pay.rb or one
    # of your environment files, if you're doing this with a Rails app.
    self.default_registration_options = {}

    # The notification URL is only relevant to registration options, but the
    # rest are relevant to all requests.
    # FIXME: This should be Hash#only instead of Hash#except!

    def self.default_options
      default_registration_options
    end

    def self.registration(attributes)
      defaults = {
        # should probably move Transaction code up to shared?
        :vendor_tx_code   => SagePay::Server::TransactionCode.random,
        :delivery_address => attributes[:billing_address]
      }.merge(default_registration_options)

      SagePay::Direct::Registration.new(defaults.merge(attributes))
    end

  end
end
