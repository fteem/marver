require 'spec_helper'

describe Marver::FinderParamFilter do 
  it 'raises an error if one or more provided params are not allowed by the API' do
    allowed_params = [:param1, :param2]
    params = { param1: double, param3: double }
    expect{
      described_class.filter!(params, allowed_params)
    }.to raise_error Marver::UnallowedParamsError
  end 

  it 'shouldnt return true if all params are whiltelisted' do
    allowed_params = [:param1, :param2]
    params = { param1: double, param2: double }
    expect(described_class.filter!(params, allowed_params)).to eq true
  end
end