module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end

    def json_response_data
      @json_response_data ||= JSON.parse(response.body, symbolize_names: true)[:data]
    end

    def json_response_errors
      @json_response_errors ||= JSON.parse(response.body, symbolize_names: true)[:errors]
    end
  end

  module HeadersHelpers
    def api_header(version = 1)
      request.headers['Accept'] = "application/y.xrails.v#{version}"
    end

    def api_response_format(format = Mime::JSON)
      request.headers['Accept'] = "#{request.headers['Accept']},#{format}"
      request.headers['Content-Type'] = format.to_s
    end

    def api_authorization_header(token)
      request.headers['Authorization'] = "Token token=#{token}"
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end
  end
end
