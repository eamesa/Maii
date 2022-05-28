desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :api_pull => :environment }) do

  require "soda/client"

  client = SODA::Client.new({ :domain => "www.datos.gov.co", :app_token => "89JeUmeJ5oQQ1IYZsEdggf3gm" })
  # results_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json", :$limit => 5000)
  #results_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json", {"$where" => "subtipo_negocio != 7", :$limit => 200})
  results_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json?codigo_negocio=58347&tipo_participacion=501", :$limit => 10000)

  results = results_raw.body
  puts "Got #{results.count} results."
  p results.first.nombre_patrimonio
  results.each do |dato|
    puts "Fecha corte: #{dato.fecha_corte} - Valor de unidad #{dato.valor_unidad_operaciones}"
  end
end
