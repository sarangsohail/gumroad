# PayPal API mocking for offline testing

# PayPal REST API
WebMock.stub_request(:any, /api\.paypal\.com/).to_return do |request|
  case request.uri.path
  when /\/v1\/oauth2\/token/
    { status: 200, body: { access_token: 'test_token', token_type: 'Bearer' }.to_json }
  when /\/v1\/payments\/payment/
    { status: 200, body: { id: 'PAY-test', state: 'approved' }.to_json }
  when /\/v1\/payments\/sale/
    { status: 200, body: { id: 'SALE-test', state: 'completed' }.to_json }
  else
    { status: 200, body: { success: true }.to_json }
  end
end

# PayPal Classic API
WebMock.stub_request(:any, /api-3t\.paypal\.com/).to_return(
  status: 200,
  body: 'ACK=Success&TRANSACTIONID=test123&AMT=10.00'
)