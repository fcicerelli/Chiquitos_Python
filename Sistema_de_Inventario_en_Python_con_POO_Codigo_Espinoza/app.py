class Producto:
  def __init__(self, id, nombre, precio, cantidad):
    self.id = id
    self.nombre = nombre
    self.precio = precio
    self.cantidad = cantidad

  def __str__(self):
    return f"Nombre: {self.nombre}, ID: {self.id}, Precio: ${self.precio}, Stock: {self.cantidad}"

class Inventario:
  def __init__(self):
    self.productos = {}

  def agregar_producto(self, producto):
    if producto.id in self.productos:
      self.productos[producto.id].cantidad += producto.cantidad
      print(f"Se ha actualizado el stock del producto {producto.nombre}.")
    else:
      self.productos[producto.id] = producto
      print(f"Se ha agregado el producto {producto.nombre} al inventario.")

  def eliminar_producto(self, id):
    if id in self.productos:
      del self.productos[id]
      print(f"Producto con ID {id} eliminado del inventario.")
    else:
      print(f"No se encontró el producto con ID {id}.")

  def listar_productos(self):
    for producto in self.productos.values():
      print(producto)

  def actualizar_producto(self, id, precio=None, cantidad=None):
    if id in self.productos:
      if precio is not None:
        self.productos[id].precio = precio
      if cantidad is not None:
        self.productos[id].cantidad = cantidad
      print(f"Producto con ID {id} actualizado.")
    else:
      print(f"No se encontró el producto con ID {id}.")

inventario = Inventario()
producto1 = Producto(1, "Manzana", 0.50, 100)
producto2 = Producto(2, "Naranja", 0.30, 150)

inventario.agregar_producto(producto1)
inventario.agregar_producto(producto2)
inventario.agregar_producto(producto1)
print(" ")

inventario.listar_productos()
print(" ")

inventario.actualizar_producto(1, precio=0.55, cantidad=120)
inventario.listar_productos()
print(" ")

inventario.eliminar_producto(2)
inventario.listar_productos()