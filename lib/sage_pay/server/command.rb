module SagePay
  module Server
    class Command < SagePay::Shared::Command

      def url
        case mode
        when :simulator
          "https://test.sagepay.com/simulator/VSPServerGateway.asp?Service=#{simulator_service}"
        when :test
          "https://test.sagepay.com/gateway/service/#{live_service}.vsp"
        when :live
          "https://live.sagepay.com/gateway/service/#{live_service}.vsp"
        else
          raise ArgumentError, "Invalid transaction mode"
        end
      end

    end
  end
end
