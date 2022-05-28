desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :api_pull => :environment }) do

  require "soda/client"

  client = SODA::Client.new({ :domain => "www.datos.gov.co", :app_token => "89JeUmeJ5oQQ1IYZsEdggf3gm" })
  # results_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json", :$limit => 5000)
  #results_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json", {"$where" => "subtipo_negocio != 7", :$limit => 200})
  # results_fic_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json?codigo_negocio=58347&tipo_participacion=501", :$limit => 10000)
  results_fic_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json?codigo_negocio=58347", :$limit => 10000)
  results_fvp_raw = client.get("https://www.datos.gov.co/resource/gpzw-wmxd.json?codigo_patrimonio=68", :$limit => 10000)

  results_fic = results_fic_raw.body
  results_fvp = results_fvp_raw.body

  # puts "Got #{results_fic.count} FIC results."
  # puts "Got #{results_fvp.count} FVP results."
  # p results_fic.first.nombre_patrimonio
  # p results_fvp.first.nombre_patrimonio
  # p results_fic.first.fecha_corte
  # p results_fic.last.fecha_corte
  # p results_fvp.first.fecha_corte
  # p results_fvp.last.fecha_corte

  Admin.destroy_all
  Fondo.destroy_all
  # Part.destroy_all
  # Value.destroy

# Admins

  results_fic.each do |dato|
    admin = Admin.new
    admin.nombre_admin = dato.nombre_entidad
    admin.codigo_admin = dato.codigo_entidad
    admin.tipo_admin = dato.tipo_entidad
    admin.save
  end

  results_fvp.each do |dato|
    admin = Admin.new
    admin.nombre_admin = dato.nombre_entidad
    admin.codigo_admin = dato.codigo_entidad
    admin.tipo_admin = dato.tipo_entidad
    admin.save
  end

admins = Admin.all
  
  # Fondos
  
results_fic.each do |dato|
  found_admin = admins.where(:codigo_admin => dato.codigo_entidad).at(0)
  fondo = Fondo.new
  fondo.codigo_fondo = dato.codigo_negocio
  fondo.codigo_tipo_fondo = dato.subtipo_negocio
  fondo.nombre_fondo = dato.nombre_patrimonio
  fondo.tipo_fondo = dato.nombre_subtipo_patrimonio
  fondo.admin_id

#  codigo_fondo               :string
#  codigo_tipo_fondo          :string
#  nombre_fondo               :string
#  tipo_fondo                 :string


end
