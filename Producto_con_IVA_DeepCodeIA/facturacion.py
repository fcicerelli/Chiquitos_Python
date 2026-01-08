class Producto:
  def __init__(self, nombre, precio):
    self.nombre = nombre
    self.precio = precio

class Factura:
  def __init__(self):
    self.items = []

  def agregar_producto(self, producto):
    self.items.append(producto)

  
  def total_con_iva(self):
    return sum(p.precio for p in self.items) * 1.21
  
factura = Factura()
factura.agregar_producto(Producto("Teclado", 20))
factura.agregar_producto(Producto("Raton", 15))

for item in factura.items:
    print(f"- {item.nombre}: ${item.precio:.2f}")

print(f"Total con IVA: ${factura.total_con_iva():.2f}")