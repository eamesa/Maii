json.extract! portfolio, :id, :user_id, :nombre_portafolio, :investments_count, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
