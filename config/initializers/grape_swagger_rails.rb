    GrapeSwaggerRails.options.url      = '/school/v1/swagger_doc'
    GrapeSwaggerRails.options.app_name = 'school API'
    GrapeSwaggerRails.options.before_action do
      GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
    end
    GrapeSwaggerRails.options.api_auth     = 'bearer'
    GrapeSwaggerRails.options.api_key_name = 'Authorization'
    GrapeSwaggerRails.options.api_key_type = 'header'
    GrapeSwaggerRails.options.app_name = 'Bia API'