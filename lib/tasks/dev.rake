desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :api_pull => :environment }) do
  require "soda/client"

  client = SODA::Client.new({ :domain => "www.datos.gov.co", :app_token => "89JeUmeJ5oQQ1IYZsEdggf3gm" })
  # results_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json", :$limit => 5000)
  # results_fic_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json", {"$where" => "subtipo_negocio != 7", :$limit => 2000000})
  #results_fic_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json?codigo_entidad=22&fecha_corte<2021-01-01T00:00:00.000", :$limit => 10000)
  # results_fic_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json?codigo_negocio=58347", :$limit => 10000)
  #results_fvp_raw = client.get("https://www.datos.gov.co/resource/gpzw-wmxd.json?codigo_entidad=2&fecha_corte<2021-01-01T00:00:00.000", :$limit => 10000)
  results_fic_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json?$where=fecha_corte > '2021-01-01T00:00:00.000' AND codigo_entidad = '22'", :$limit => 100000)
  results_fvp_raw = client.get("https://www.datos.gov.co/resource/gpzw-wmxd.json?$where=fecha_corte > '2021-01-01T00:00:00.000' AND codigo_entidad = '2'", :$limit => 100000)
  # results_fic_raw = client.get("https://www.datos.gov.co/resource/qhpu-8ixx.json", :$limit => 10000000)
  # results_fvp_raw = client.get("https://www.datos.gov.co/resource/gpzw-wmxd.json", :$limit => 2000000)

  results_fic = results_fic_raw.body
  results_fvp = results_fvp_raw.body

  puts "Got #{results_fic.count} FIC results."
  puts "Got #{results_fvp.count} FVP results."
  # p results_fic.first.nombre_patrimonio
  # p results_fvp.first.nombre_patrimonio
  # p results_fic.first.fecha_corte
  # p results_fic.last.fecha_corte
  # p results_fvp.first.fecha_corte
  # p results_fvp.last.fecha_corte

  Value.destroy_all
  Part.destroy_all
  Fondo.destroy_all
  Admin.destroy_all

  # Admins

  results_fic.each do |dato|
    admin = Admin.new
    admin.nombre_admin = dato.nombre_entidad
    admin.codigo_admin = dato.codigo_entidad
    admin.tipo_admin = dato.tipo_entidad
    admin.save
  end

  puts "fics done"


  results_fvp.each do |dato|
    admin = Admin.new
    admin.nombre_admin = dato.nombre_entidad
    admin.codigo_admin = dato.codigo_entidad
    admin.tipo_admin = dato.tipo_entidad
    admin.save
  end

  admins = Admin.all
  puts "Got #{admins.count} admins."

  # Fondos

  results_fic.each do |dato|
    found_admin = admins.where(:codigo_admin => dato.codigo_entidad).at(0)
    fondo = Fondo.new
    fondo.codigo_fondo = dato.codigo_negocio
    fondo.codigo_tipo_fondo = dato.subtipo_negocio
    fondo.nombre_fondo = dato.nombre_patrimonio
    fondo.tipo_fondo = dato.nombre_subtipo_patrimonio
    fondo.admin_id = found_admin.id
    fondo.save
  end

  puts "fics done"

  results_fvp.each do |dato|
    found_admin = admins.where(:codigo_admin => dato.codigo_entidad).at(0)
    fondo = Fondo.new
    fondo.codigo_fondo = dato.codigo_patrimonio
    fondo.codigo_tipo_fondo = 9
    fondo.nombre_fondo = dato.nombre_patrimonio
    fondo.tipo_fondo = "PORTAFOLIO FVP"
    fondo.admin_id = found_admin.id
    fondo.save
  end

  funds = Fondo.all
  puts "Got #{funds.count} funds."

  # Parts

  results_fic.each do |dato|
    found_fund = funds.where(:nombre_fondo => dato.nombre_patrimonio).at(0)
    part = Part.new
    part.codigo_participaciones = dato.tipo_participacion
    part.fondo_id = found_fund.id
    part.save
  end

  puts "fics done"

  results_fvp.each do |dato|
    found_fund = funds.where(:nombre_fondo => dato.nombre_patrimonio).at(0)
    part = Part.new
    part.codigo_participaciones = 1
    part.fondo_id = found_fund.id
    part.save
  end

  parts = Part.all
  puts "Got #{parts.count} parts."

  # Value

  results_fic.each do |dato|
    found_fund_id = funds.where(:nombre_fondo => dato.nombre_patrimonio).at(0).id
    found_part = parts.where(:fondo_id => found_fund_id, :codigo_participaciones => dato.tipo_participacion).at(0)
    valor = Value.new
    valor.fecha_corte = dato.fecha_corte
    valor.precio_cierre = dato.precierre_fondo_dia_t
    valor.valor_fondo = dato.valor_fondo_cierre_dia_t
    valor.valor_unidad = dato.valor_unidad_operaciones
    valor.part_id = found_part.id
    valor.save
  end

  puts "fics done"

  results_fvp.each do |dato|
    found_fund_id = funds.where(:nombre_fondo => dato.nombre_patrimonio).at(0).id
    found_part = parts.where(:fondo_id => found_fund_id).at(0)
    valor = Value.new
    valor.fecha_corte = dato.fecha_corte
    valor.precio_cierre = dato.precio_cierre_fondo_dia_t
    valor.valor_fondo = dato.valor_fondo_cierre_dia_t
    valor.valor_unidad = dato.valor_unidad_operaciones
    valor.part_id = found_part.id
    valor.save
  end

  values = Value.all
  puts "Got #{values.count} values."
end
