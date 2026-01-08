class Producto:
  def __init__(self, id, nombre, precio, cantidad):
    self.id = id
    self.nombre = nombre
    self.precio = precio
    self.cantidad = cantidad

  def __str__(self):
    return f"Nombre: {self.nombre}, ID: {self.id}, Precio: ${self.precio}, Stock: {self.cantidad}"

producto1 = Producto(1, "Manzana", 0.5, 100)
print(producto1)