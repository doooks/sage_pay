module SagePay
  module Direct
    class Registration < SagePay::Shared::Registration

      attr_accessor :card_holder, :card_number, :start_date, :expiry_date, :issue_number, :cvv, :card_type, :client_ip_address
      
      validates_length_of :card_holder, :maximum => 50
      validates_length_of :card_number, :within => 12..20
      validates_length_of :start_date, :is => 4, :allow_nil => true
      validates_length_of :expiry_date, :is => 4
      validates_length_of :cvv, :maximum => 4
      validates_length_of :client_ip_address, :maximum => 15
      
      validates_presence_of :card_holder, :card_number, :expiry_date, :cvv, :card_type
      
      validates_format_of :start_date, :expiry_date, :with => /^[0-1]\d{3}$/, :if => Proc.new{ |r| r.start_date && !r.start_date.empty? }
      validates_format_of :issue_number, :with => /^\d{2}$/, :if => Proc.new{ |r| r.issue_number && !r.issue_number.empty? }
      validates_format_of :client_ip_address, :with => /^[0-9\.]+$/, :if => Proc.new { |r| r.client_ip_address && !r.client_ip_address.empty?}
      

      validates_inclusion_of :card_type, :in => %w(VISA MC DELTA SOLO MAESTRO UKE AMEX DC JCB LASER PAYPAL)
      
      def url
        case mode
        when :simulator
          "https://test.sagepay.com/Simulator/VSPDirectGateway.asp"
        when :test
          "https://test.sagepay.com/gateway/service/vspdirect-register.vsp"
        when :live
          "https://live.sagepay.com/gateway/service/vspdirect-register.vsp"
        else
          raise ArgumentError, "Invalid transaction mode"
        end
      end

      def post_params
        
        params = super.merge(shared_registration_params)
        params["CardHolder"] = card_holder
        params["CardNumber"] = card_number
        params["StartDate"] = start_date
        params["ExpiryDate"] = expiry_date
        params["IssueNumber"] = issue_number
        params["CV2"] = cvv
        params["CardType"] = card_type

        params
      end
      
    end
  end
end

    
