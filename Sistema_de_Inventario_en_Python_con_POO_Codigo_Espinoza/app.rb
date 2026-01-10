class Producto
  attr_accessor :id, :nombre, :cantidad, :precio

  def initialize(id, nombre, precio, cantidad)
    @id = id
    @nombre = nombre
    @precio = precio
    @cantidad = cantidad
  end

  def to_s
    "ID: #{@id} | Nombre: #{@nombre} | Precio: #{@precio} | Cantidad: #{@cantidad}"
  end
end

class Inventario
  def initialize
    @productos = []
  end

  # CREATE
  def agregar_producto(producto)
    @productos << producto
    puts "Producto agregado: #{producto.instance_variable_get(:@nombre)}"
  end

  # READ
  def listar_productos
    if @productos.empty?
      puts "No hay productos en el inventario."
    else
      @productos.each { |producto| puts producto }
    end
  end

  # UPDATE
  def actualizar_producto(id, nombre: nil, precio: nil, cantidad: nil)
    producto = @productos.find { |p| p.id == id }
    if producto
      producto.nombre = nombre if nombre
      producto.precio = precio if precio
      producto.cantidad = cantidad if cantidad
      puts "Producto actualizado: #{producto.instance_variable_get(:@nombre)}"
    else
      puts "Producto con ID #{id} no encontrado."
    end
  end

  # DELETE
  def eliminar_producto(id)
    producto = @productos.find { |p| p.id == id }
    if producto
      @productos.delete(producto)
      puts "Producto eliminado: #{producto.instance_variable_get(:@nombre)}"
    else
      puts "Producto con ID #{id} no encontrado."
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
