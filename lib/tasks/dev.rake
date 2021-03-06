desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :api_pull => :environment }) do

  require "soda/client"

  client = SODA::Client.new({ :domain => "www.datos.gov.co", :app_token => "89JeUmeJ5oQQ1IYZsEdggf3gm" })
  # results_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json", :$limit => 5000)
  #results_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json", {"$where" => "subtipo_negocio != 7", :$limit => 200})
  results_fic_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json?codigo_negocio=58347&tipo_participacion=501", :$limit => 10000)
  results_fvp_raw = client.get("https://www.datos.gov.co/resource/gpzw-wmxd.json?codigo_patrimonio=68", :$limit => 10000)


  results_fic = results_fic_raw.body
  results_fvp = results_fvp_raw.body

  puts "Got #{results_fic.count} FIC results."
  puts "Got #{results_fvp.count} FVP results."
  p results_fic.first.nombre_patrimonio
  p results_fvp.first.nombre_patrimonio
  p results_fic.first.fecha_corte
  p results_fic.last.fecha_corte
  p results_fvp.first.fecha_corte
  p results_fvp.last.fecha_corte


  # results_fic.each do |dato|
  #   puts "Fecha corte: #{dato.fecha_corte} - Valor de unidad #{dato.valor_unidad_operaciones}"
  # end
end
