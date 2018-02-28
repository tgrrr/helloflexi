module MbApi

  class MbCore
    class << self
      protected

      def call site_id, method, request = {}
        site_ids = { 'int' => site_id }
        source_credentials = { 'SourceName' => ENV['MB_SOURCE_NAME'], 'Password' => ENV['MB_SOURCE_KEY'], 'SiteIDs' => site_ids }
        user_credentials = { 'Username' => ENV['USER_NAME'], 'Password' => ENV['USER_PASSWORD'], 'SiteIDs' => site_ids }

        http_client = Savon.client(wsdl: "https://api.mindbodyonline.com/0_5/#{self.name.demodulize}.asmx?WSDL")

        #Create request and package it for the call
        http_request = { 'SourceCredentials' => source_credentials,
                         'UserCredentials' => user_credentials,
        }
        http_request.merge!(request)

        params = { 'Request' => http_request }

        #Run the call and store the results

        begin
          response = http_client.call(method, message: params)
          response.body
        rescue Savon::Error => error
          p "MINDBODY ERROR: " + error.to_s
          false
        end
      end
    end
  end

  class ClientService < MbCore
    class << self
      def create_user site_id, user
        params = {
          "UpdateAction" => 'AddNew',
          "Clients" => {
            "Client" => {
               'FirstName' => user.first_name,
               'LastName' => user.last_name,
               'Email' => user.email,
               'AddressLine1' => user.address_one,
               'PostalCode' => user.postal_code,
               'Country' => user.country,
               'MobilePhone' => user.mobile,
               'City' => user.city,
               'State' => user.state
            }
          }
        }
        result = self.call site_id, :add_or_update_clients, params
        result ? result[:add_or_update_clients_response][:add_or_update_clients_result][:clients][:client][:id] : result
      end
    end
  end

  class ClassService < MbCore
    class << self

      def fetch_studio_schedule(*opts)
        options = opts.extract_options!

        params = { 
          'StartDateTime' => options[:start_date].nil? ? Date.today.beginning_of_week.strftime : options[:start_date],
          'EndDateTime' => options[:end_date].nil? ? Date.today.end_of_week.strftime : options[:end_date]
        }
        result = self.call options[:site_id].to_i, :get_classes, params

        if result.present? && result[:get_classes_response][:get_classes_result][:status] == 'Success' && !result[:get_classes_response][:get_classes_result][:classes].nil?
          result[:get_classes_response][:get_classes_result][:classes][:class]
        else
          false
        end
      end

      def sing_up site_id, user_id, klass_id
        params = {
          'ClientIDs' => { "string" => [user_id] },
          'ClassIDs' => { "int" => [klass_id] },
        }
        result = self.call site_id, :add_clients_to_classes, params
        result.present? && result[:add_clients_to_classes_response][:add_clients_to_classes_result][:status] == 'Success'
      end

      def cancel site_id, user_id, klass_id
        params = {
          'ClientIDs' => { "string" => [user_id] },
          'ClassIDs' => { "int" => [klass_id] },
        }
        result = self.call site_id, :remove_clients_from_classes, params
        result.present? && result[:remove_clients_from_classes_response][:remove_clients_from_classes_result][:status] == 'Success'
      end
    end
  end
end


