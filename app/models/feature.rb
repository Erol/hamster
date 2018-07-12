class Feature
  def initialize(flag:, entity:)
    @flag = Integer(flag)
    @entity = String(entity)
  end

  def variant
    response['variantKey']
  end

  def attachment
    @attachment ||= Hashie::Mash.new(response['variantAttachment'])
  end

  private

  def response
    @response ||= JSON.parse(
      RestClient.post(
        'http://localhost:18000/api/v1/evaluation',
        { entityID: @entity, entityType: 'user', flagID: @flag }.to_json,
        content_type: :json, accept: :json
      )
    )

    puts({ entityID: @entity, entityType: 'user', flagID: @flag }.to_json)
    puts @response

    @response
  end
end
