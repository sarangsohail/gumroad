# Stripe API mocking for offline testing

WebMock.stub_request(:any, /api\.stripe\.com/).to_return do |request|
  case request.uri.path
  when /\/v1\/balance/
    { status: 200, body: { available: [{ amount: 0, currency: 'usd' }], pending: [] }.to_json }
  when /\/v1\/charges/
    { status: 200, body: { id: 'ch_test', amount: 1000, currency: 'usd', status: 'succeeded' }.to_json }
  when /\/v1\/customers/
    { status: 200, body: { id: 'cus_test', email: 'test@example.com' }.to_json }
  when /\/v1\/payment_intents/
    { status: 200, body: { id: 'pi_test', status: 'succeeded', amount: 1000 }.to_json }
  when /\/v1\/refunds/
    { status: 200, body: { id: 'rf_test', amount: 1000, status: 'succeeded' }.to_json }
  else
    { status: 200, body: { id: 'test_response' }.to_json }
  end
end