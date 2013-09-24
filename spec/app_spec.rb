require_relative 'spec_helper'

describe 'App' do

  it 'should say Donate' do
    get '/'
    last_response.must_be :ok?
    last_response.body.must_include 'Donate'
  end

end
