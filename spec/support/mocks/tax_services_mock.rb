# Tax services mocking for offline testing

# TaxJar
WebMock.stub_request(:any, /api\.taxjar\.com/).to_return(
  status: 200,
  body: { tax: { amount_to_collect: 0.0, rate: 0.0 } }.to_json
)

# Avalara
WebMock.stub_request(:any, /avatax\.api\.avalara\.com/).to_return(
  status: 200,
  body: { totalTax: 0.0 }.to_json
)

# Vatstack
WebMock.stub_request(:any, /api\.vatstack\.com/).to_return(
  status: 200,
  body: { valid: true }.to_json
)