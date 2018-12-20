require 'rails_helper'

describe '/api/v1/vets' do
  it 'returns all vet info' do
    vet_1, vet_2, vet_3, vet_4, vet_5 = create_list(:vet, 5)
    get '/api/v1/vets'

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data][0]).to have_key(:id)
    expect(result[:data][0]).to have_key(:type)
    expect(result[:data][0]).to have_key(:attributes)
    expect(result[:data][0][:attributes]).to have_key(:practice_name)
    expect(result[:data][0][:attributes]).to have_key(:vet_name)
    expect(result[:data][0][:attributes]).to have_key(:address)
    expect(result[:data][0][:attributes]).to have_key(:email)
    expect(result[:data][0][:attributes]).to have_key(:phone)
    expect(result[:data].count).to eq 5
  end
end