class Producto
  attr_accessor :id, :nombre, :cantidad, :precio

  def initialize(id, nombre, cantidad, precio)
    @id = id
    @nombre = nombre
    @cantidad = cantidad
    @precio = precio
  end

  def to_s
    "ID: #{@id} | Nombre: #{@nombre} | Stock: #{@cantidad} | Precio: $#{@precio}"
  end
end

class Inventario
  def initialize
    @productos = []
  end

  # CREATE
  def agregar_producto(producto)
    @productos << producto
    puts "Producto agregado con éxito."
  end

  # READ
  def listar_productos
    if @productos.empty?
      puts "El inventario está vacío."
    else
      @productos.each { |p| puts p }
    end
  end

  # UPDATE
  def actualizar_producto(id, nuevo_nombre, nueva_cant, nuevo_precio)
    producto = buscar_por_id(id)
    if producto
      producto.nombre = nuevo_nombre
      producto.cantidad = nueva_cant
      producto.precio = nuevo_precio
      puts "Producto actualizado."
    else
      puts "Producto no encontrado."
    end
  end

  # DELETE
  def eliminar_producto(id)
    producto = buscar_por_id(id)
    if producto
      @productos.delete(producto)
      puts "Producto eliminado."
    else
      puts "Producto no encontrado."
    end
  end

  private

  def buscar_por_id(id)
    @productos.find { |p| p.id == id }
  end
end

mi_inventario = Inventario.new

loop do
  puts "\n--- MENÚ DE INVENTARIO ---"
  puts "1. Agregar producto"
  puts "2. Ver productos"
  puts "3. Actualizar producto"
  puts "4. Eliminar producto"
  puts "5. Salir"
  print "Seleccione una opción: "
  opcion = gets.chomp.to_i

  case opcion
  when 1
    print "ID: "; id = gets.chomp.to_i
    print "Nombre: "; nombre = gets.chomp
    print "Cantidad: "; cant = gets.chomp.to_i
    print "Precio: "; precio = gets.chomp.to_f
    mi_inventario.agregar_producto(Producto.new(id, nombre, cant, precio))
  when 2
    mi_inventario.listar_productos
  when 3
    print "ID del producto a editar: "; id = gets.chomp.to_i
    print "Nuevo nombre: "; nombre = gets.chomp
    print "Nueva cantidad: "; cant = gets.chomp.to_i
    print "Nuevo precio: "; precio = gets.chomp.to_f
    mi_inventario.actualizar_producto(id, nombre, cant, precio)
  when 4
    print "ID del producto a eliminar: "; id = gets.chomp.to_i
    mi_inventario.eliminar_producto(id)
  when 5
    break
  else
    puts "Opción inválida."
  end
end
