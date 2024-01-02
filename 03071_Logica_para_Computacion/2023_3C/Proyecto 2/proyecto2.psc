Algoritmo proyecto2
	Definir edad Como Entero;
	Definir montoTotal Como Entero;
	Definir opcionPelicula Como Entero;
	Definir continuar Como Caracter;
	Definir boletosAdulto,boletosNinos,boletosAdultosMayores,boletosRechazados Como Entero;
	
	Definir limiteEdad Como Entero;
	Definir salaValida Como Logico;
	//Se inicializa porque acumulará el monto de todas las entradas
	montoTotal = 0;
	//Se inicializan porque contarán los boletos que se van vendiendo
	boletosAdulto = 0;
	boletosNinos = 0;
	boletosAdultosMayores = 0;
	boletosRechazados = 0;
	
	
	continuar = "n";
	
	
	Repetir
		
		Escribir "-- Bienvenido al cine --";
		Escribir "";
		Escribir "Por favor, ingrese su edad: ",Sin Saltar;
		Leer edad;
		Escribir "";
		Escribir "===============================";
		Escribir "--- Cartelera de cine ---";
		Escribir "1. El conjuro (+18)";
		Escribir "2. Bajo la misma estrella (+15)";
		Escribir "3. Micky Mouse (TP)";
		Escribir "===============================";
		Escribir "";
		Escribir "Ingrese la sala deseada: " Sin Saltar;
		Leer opcionPelicula;
		
		salaValida = Verdadero;
		Segun opcionPelicula Hacer
			1:
				limiteEdad = 18;
			2:
				limiteEdad = 15;
			3:
				limiteEdad = 12;
			De Otro Modo:
				Escribir "Película inválida, digite un número correcto";
				salaValida = Falso;
		FinSegun
		
		Si salaValida Entonces
			Si edad >= limiteEdad Entonces
				Escribir "Venta concretada";
				Escribir "Factura";
				Si edad < 65 Entonces
					Escribir "Boleto de adulto, el monto a pagar es de 3500 colones";
					montoTotal = montoTotal + 3500;
					boletosAdulto = boletosAdulto + 1;
				SiNo
					Escribir "Boleto de adulto mayor el monto a pagar es de 2800 colones";
					montoTotal = montoTotal + 2800;
					boletosAdultosMayores = boletosAdultosMayores + 1;
				FinSi
			SiNo
				Si limiteEdad = 12 Entonces
					Escribir "Boleto de niño el monto a pagar es de 2800 colones";
					montoTotal = montoTotal + 2800;
					boletosNinos = boletosNinos + 1;
				SiNo
					Escribir "No puede comprar la entrada por restricción de edad";
					boletosRechazados = boletosRechazados + 1;
				FinSi
				
			FinSi
		FinSi
		
		//Esta es otra forma siendo más entensa de código, se optó por la parte de arriba puesto que se repite mucho codigo
		
//		Segun opcionPelicula Hacer
//			1:
//				Si edad >= 18 Entonces
//					Escribir "Venta concretada";
//					Escribir "Factura";
//					Si edad < 65 Entonces
//						Escribir "Boleto de adulto, el monto a pagar es de 3500 colones";
//						montoTotal = montoTotal + 3500;
//						boletosAdulto = boletosAdulto + 1;
//					SiNo
//						Escribir "Boleto de adulto mayor el monto a pagar es de 2800 colones";
//						montoTotal = montoTotal + 2800;
//						boletosAdultosMayores = boletosAdultosMayores + 1;
//					FinSi
//				SiNo
//					Escribir "No puede comprar la entrada por restricción de edad";
//					boletosRechazados = boletosRechazados + 1;
//				FinSi
//			2:
//				Si edad >= 15 Entonces
//					Escribir "Venta concretada";
//					Escribir "Factura";
//					Si edad < 65 Entonces
//						Escribir "Boleto de adulto, el monto a pagar es de 3500 colones";
//						montoTotal = montoTotal + 3500;
//						boletosAdulto = boletosAdulto + 1;
//					SiNo
//						Escribir "Boleto de adulto mayor el monto a pagar es de 2800 colones";
//						montoTotal = montoTotal + 2800;
//						boletosAdultosMayores = boletosAdultosMayores + 1;
//					FinSi
//				SiNo
//					Escribir "No puede comprar la entrada por restricción de edad";
//					boletosRechazados = boletosRechazados + 1;
//				FinSi
//			3:
//				Escribir "Venta concretada";
//				Escribir "Factura";
//				Si edad >= 12 Entonces
//					Si edad < 65 Entonces
//						Escribir "Boleto de adulto, el monto a pagar es de 3500 colones";
//						montoTotal = montoTotal + 3500;
//						boletosAdulto = boletosAdulto + 1;
//					SiNo
//						Escribir "Boleto de adulto mayor el monto a pagar es de 2800 colones";
//						montoTotal = montoTotal + 2800;
//						boletosAdultosMayores = boletosAdultosMayores + 1;
//					FinSi
//				SiNo
//					Escribir "Boleto de niño el monto a pagar es de 2800 colones";
//					montoTotal = montoTotal + 2800;
//					boletosNinos = boletosNinos + 1;
//				FinSi
//			De Otro Modo:
//				Escribir "Película inválida, digite un número correcto";
//		FinSegun
		
		Repetir
			Escribir "";
			Escribir "¿Desea vender otra entrada? (S/N): "Sin Saltar;
			Leer continuar;
			continuar = Mayusculas(continuar);
			Si continuar<>"S" Y continuar<>"N" Entonces
				Escribir "Por favor escriba S para sí o N para no";
			FinSi
		Hasta Que continuar="S" O continuar="N"
		Limpiar Pantalla;
	Hasta Que continuar = "N";
	
	Escribir "--- Reporte final de ventas ---";
	Escribir "";
	Escribir "Boletos rechazados       : ",boletosRechazados;
	Escribir "Boletos de niño          : ",boletosNinos;
	Escribir "Boletos de adulto        : ",boletosAdulto;
	Escribir "Boletos de adulto mayor  : ",boletosAdultosMayores;
	Escribir "Total de boletos vendidos: ",boletosAdulto+boletosAdultosMayores+boletosNinos;
	Escribir "Monto total recaudado    = ",montoTotal;
	Escribir "";
	
	
FinAlgoritmo
