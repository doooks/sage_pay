module SagePay
  module Server
    class Registration < SagePay::Shared::Registration
      
      attr_accessor :notification_url, :profile

      validates_presence_of :notification_url
      
      validates_length_of :notification_url, :maximum => 255

      def live_service
        "vspserver-register"
      end

      def simulator_service
        "VendorRegisterTx"
      end

      def post_params
        
        params = super.merge(shared_registration_params)
        params["NotificationURL"]  = notification_url
        params
      end

      def response_from_response_body(response_body)
        RegistrationResponse.from_response_body(response_body)
      end

    end
  end
end
