# Escribe un programa para gestionar un inventario
# de produtos con sus cantidades.

inventario = {}

def agregar(inventario, nombre, cantidad):
  if nombre in inventario:
    inventario[nombre] += cantidad
  else:
    inventario[nombre] = cantidad

def consultar(inventario, nombre): # nombre -> cantidad
  return inventario.get(nombre, "no encontrado")

while True: # bucle principal
  opcion = input("\na) agregar producto\nb) consultar cantidad\nc) listar productos\nd) actualizar producto\ne) salir\nSeleccione una opcion: ")

  if opcion == 'a': # agregar
    nombre = input("\nIngrese el nombre del producto: ")
    cantidad = int(input("Ingrese la cantidad del producto: "))
    agregar(inventario, nombre, cantidad)
    print("producto añadido correctamente")

  elif opcion == 'b': # consultar (nombre -> cantidad)
    nombre = input("\nnombre producto: ")
    print("cantidad: ",consultar(inventario, nombre))

  elif opcion == 'c': # listar productos
    print("\nInventario:")
    for nombre, cantidad in inventario.items():
      print(f"{nombre}: {cantidad}")

  elif opcion == 'd': # actualizar producto
    nombre = input("\nIngrese el nombre del producto a actualizar: ")
    if nombre in inventario:
      cantidad = int(input("Ingrese la nueva cantidad del producto: "))
      inventario[nombre] = cantidad
      print("producto actualizado correctamente")
    else:
      print("Producto no encontrado en el inventario.")

  elif opcion == 'e': # salir
    print("\nSaliendo del programa.")
    break