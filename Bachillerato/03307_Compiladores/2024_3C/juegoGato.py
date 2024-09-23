import random

def imprimir_tablero(tablero):
    """ Función para imprimir el tablero actual """
    for i in range(3):
        for j in range(3):
            print(f" {tablero[i][j]} ", end="")
            if j < 2:
                print("|", end="")
        print()  # Salto de línea después de cada fila
        if i < 2:
            print("-----------")  # Línea horizontal entre filas

def verificar_ganador(tablero, jugador):
    """ Función para verificar si hay un ganador """
    # Verificar filas, columnas y diagonales
    for i in range(3):
        if (all(tablero[i][j] == jugador for j in range(3)) or  # Filas
            all(tablero[j][i] == jugador for j in range(3)) or  # Columnas
            all(tablero[i][i] == jugador for i in range(3)) or  # Diagonal principal
            all(tablero[i][2 - i] == jugador for i in range(3))):  # Diagonal secundaria
            return True
    return False

def movimiento_cpu(tablero, jugador):
    """ Función para que la CPU realice un movimiento """
    # Estrategia sencilla: mover aleatoriamente en una casilla vacía
    movimientos_posibles = [(i, j) for i in range(3) for j in range(3) if tablero[i][j] == " "]
    fila, columna = random.choice(movimientos_posibles)
    tablero[fila][columna] = jugador

def juego_gato():
    """ Función principal para ejecutar el juego """
    tablero = [[" " for _ in range(3)] for _ in range(3)]

    # Solicitar nombre y edad del jugador
    nombre = input("Ingrese su nombre: ")
    
    while True:
        edad_str = input("Ingrese su edad: ")
        try:
            edad = int(edad_str)
            break  # Si la conversión es exitosa, salir del bucle
        except ValueError:
            print("Error: La edad debe ser un número entero.")
    
    jugador_usuario = nombre
    jugador_cpu = "CPU"
    jugador_actual = "X"  # Empieza el usuario
    
    resultado = None
    
    while True:
        # Verificar si ya hay un resultado antes de imprimir el tablero
        if resultado:
            break
    
        imprimir_tablero(tablero)
        print(f"\nTurno del jugador {jugador_usuario if jugador_actual == 'X' else jugador_cpu} ({jugador_actual})")
    
        if jugador_actual == "X":  # Turno del usuario
            try:
                fila, columna = map(int, input("Ingrese fila y columna (ej. '0 0'): ").split())
            except ValueError:
                print("Error: Por favor ingrese dos números separados por espacio.")
                continue
    
            if not (0 <= fila < 3 and 0 <= columna < 3):
                print("Error: Coordenadas fuera de rango. Debe ser entre 0 y 2.")
                continue
    
            if tablero[fila][columna] != " ":
                print("Casilla ocupada. Intente de nuevo.")
                continue
    
            tablero[fila][columna] = jugador_actual
        else:  # Turno de la CPU
            movimiento_cpu(tablero, jugador_actual)
    
        if verificar_ganador(tablero, jugador_actual):
            resultado = f"\n¡El jugador {jugador_usuario if jugador_actual == 'X' else jugador_cpu} ha ganado!"
            break
    
        if all(tablero[i][j] != " " for i in range(3) for j in range(3)):
            resultado = "\n¡Empate!"
            break
    
        jugador_actual = "O" if jugador_actual == "X" else "X"
    
    # Mostrar el tablero final y el resultado
    imprimir_tablero(tablero)
    print(resultado)

juego_gato()