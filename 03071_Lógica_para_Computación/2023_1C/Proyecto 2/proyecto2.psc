Algoritmo Proyecto2_KatherineChacon
	
	//Definicion de variables
	Definir desea, cont,  procesardia, dia como caracter;
	Definir codidovendedor, numdia, cant Como Entero;
	definir producto Como Entero;
	definir producto1, producto2, producto3, producto4, producto5 Como Cadena; 
	Definir producto6, producto7, producto8, producto9 Como cadena;
	definir montodiario, monto1, monto2, monto3, monto4, monto5, monto6, monto7, monto8, monto9 Como Entero;
	Definir cantidad1,cantidad2,cantidad3,cantidad4,cantidad5,cantidad6,cantidad7,cantidad8,cantidad9 Como Entero;
	Definir montosemanal,montogeneral,diabajo,dialto,montobajo,montoalto Como Entero;
	Definir comisionventas,comisiongeneral,promediovendedor,promediocomision Como Real;
	Definir cantvendedores Como Entero;
	
	
	//Inicializar
	desea="";
	codidovendedor=0;
	producto1 = "1. Internet Higar 15M               ";
	producto2 = "2. Internet Higar 30M               ";
	producto3 = "3. Internet Higar 50M               ";
	producto4 = "4. Internet Empresarial Syncrónico  ";
	producto5 = "5. Internet Empresarial Asyncrónico ";
	producto6 = "6. Telefonía Fija                   ";
	producto7 = "7. Telefonía Movil                  ";
	producto8 = "8. Paquete DoblePlay                ";
	producto9 = "9. Paquete TriplePlay               ";
	
	montobajo=100000000;
	montoalto=0;
	diabajo=0;
	dialto=0;
	//si es necesario inicializarlos
	montosemanal=0;
	montogeneral=0;
	cantvendedores=0;
	comisiongeneral=0;
	Repetir
		numdia = 1;
		
		//codigo de vendedor
		Escribir ' COLVI Telecomunicaciones ';
		Escribir ' ******* Sistema de Control de las ventas ******* ';
		Escribir "";
		Repetir
			Escribir Sin Saltar ' Dígite el código del Vendedor ';
			Leer codidovendedor;
			Limpiar Pantalla;
		Hasta Que codidovendedor > 0
		
		// ciclo para los dia
		Repetir
			Si numdia = 1 Entonces
				dia = " LUNES ";
			FinSi
			Si numdia = 2 Entonces
				dia = " MARTES ";
			FinSi
			Si numdia = 3 Entonces
				dia = " MIÉRCOLES ";
			FinSi
			Si numdia = 4 Entonces
				dia = " JUEVES ";
			FinSi
			Si numdia = 5 Entonces
				dia = " VIERNES ";
			FinSi
			Si numdia = 6 Entonces
				dia = " SÁBADO ";
			FinSi
			Repetir
				Escribir Sin Saltar " Desea ingresar datos del día ", numdia,  dia,  " S/N ";
				Leer procesardia;
			Hasta Que Minusculas(procesardia)=="n" o Minusculas(procesardia)=="s"
			
			monto1=0;
			monto2=0;
			monto3=0;
			monto4=0;
			monto5=0;
			monto6=0;
			monto7=0;
			monto8=0;
			monto9=0;
			
			cantidad1=0;
			cantidad2=0;
			cantidad3=0;
			cantidad4=0;
			cantidad5=0;
			cantidad6=0;
			cantidad7=0;
			cantidad8=0;
			cantidad9=0;
			
			Si Minusculas(procesardia)=="s" Entonces
				
				Repetir
					Limpiar Pantalla;
					
					//DATOS DEL MENU
					Escribir " Día ", dia ;
					Escribir "";
					Escribir "                Menú de Servicios y Costos Fijos           ";
					Escribir "              ************************************";
					escribir "";
					Escribir " 1. Internet Higar 15M";
					Escribir " 2. Internet Higar 30M ";
					Escribir " 3. Internet Higar 50M";
					Escribir " 4. Internet Empresarial Syncrónico ";
					Escribir " 5. Internet Empresarial Asyncrónico ";
					Escribir " 6. Telefonía Fija ";
					Escribir " 7. Telefonía Movil ";
					Escribir " 8. Paquete DoblePlay";
					Escribir " 9. Paquete TriplePlay";
					Escribir " 10.Finalizar Registro de Ventas ";
					Escribir "";
					
					//ciclo menu
					Repetir
						Escribir Sin Saltar " Ingrese un servicio del menú " ;
						Leer producto;
						Si producto < 0 o producto > 10  Entonces
							Escribir "Opción no válida, intente de nuevo";
						FinSi
						
					Hasta Que producto > 0 Y producto < 11; 
					
					
					Si producto<=9 Entonces
						//ciclo cantidad 
						Repetir
							Escribir Sin Saltar " Digite la cantidad de productos vendidos ";
							leer cant;
							Si cant< 0 Entonces
								Escribir " La cantidad no puede ser cero, intente de nuevo "; 
							FinSi
						Hasta Que cant > 0 
						//aqui puedes hacer los calculos de cuantos producto por el monto que vale
						Segun producto Hacer
							1:
								monto1=cant*16000;
								cantidad1=cant;
							2:
								monto2=cant*20000;
								cantidad2=cant;
							3:
								monto3=cant*25000;
								cantidad3=cant;
							4:
								monto4=cant*150000;
								cantidad4=cant;
							5:
								monto5=cant*100000;
								cantidad5=cant;
							6:
								Escribir " Requiere ", cant, "  unidades del producto 6 ",  producto6;
							7:
								Escribir " Requiere ", cant, "  unidades del producto 7 ",  producto7;
							8:
								Escribir " Requiere ", cant, "  unidades del producto 8 ",  producto8;
							9:
								Escribir " Requiere ", cant, "  unidades del producto 9 ",  producto9;
						FinSegun
						
					FinSi
					
					
				Hasta Que producto==10
				montodiario=monto1+monto2+monto3+monto4+monto5+monto6+monto7+monto8+monto9;
				montosemanal=montosemanal+montodiario;
				
				Si montobajo>montodiario Entonces
					montobajo=montodiario;
					diabajo=numdia;
				FinSi
				Si montoalto<montodiario Entonces
					montoalto=montodiario;
					dialto=numdia;
				FinSi
				
				
				Limpiar Pantalla;
				Escribir "                    Reporte de ventas ";
				Escribir "                  Día procesado: ", dia;
				escribir "             Código de Agente de Ventas: ", codidovendedor;
				escribir "************************************************************";
				escribir " Producto                              Cantidad      Monto";
				Si cantidad1>0 Entonces
					Escribir producto1,"         ", cantidad1, "        ",monto1;
				FinSi
				Si cantidad2>0 Entonces
					Escribir producto2,"         ", cantidad2, "        ",monto2;
				FinSi
				Escribir producto3,"         ", cantidad3, "        ",monto3;
				Escribir producto4,"         ", cantidad4, "        ",monto4;
				Escribir producto5,"         ", cantidad5, "        ",monto5;
				Escribir producto6,"         ", cantidad6, "        ",monto6;
				Escribir producto7,"         ", cantidad7, "        ",monto7;
				Escribir producto8,"         ", cantidad8, "        ",monto8;
				Escribir producto9,"         ", cantidad9, "        ",monto9;
				escribir "************************************************************";
				Escribir "Monto diario de ventas:                               ",montodiario;
				Escribir ""; //saltar linea
				Escribir "Presione ENTER para continuar";
				Esperar Tecla;
				
			SiNo
				Escribir " Este día no hubo ventas ";
			FinSi
			Limpiar Pantalla;
			numdia = numdia + 1;
			
		Hasta Que numdia > 6
		Si montosemanal>1 Y montosemanal<=500000 Entonces
			comisionventas=montosemanal*0.01;
		FinSi
		Si montosemanal>500000 Y montosemanal<=1000000 Entonces
			comisionventas=montosemanal*0.02;
		FinSi
		Si montosemanal>1000000 Y montosemanal<=10000000 Entonces
			comisionventas=montosemanal*0.03;
		FinSi
		Si montosemanal>10000000 Entonces
			comisionventas=montosemanal*0.05;
		FinSi
		
		Escribir "                    Reporte semanal ";
		escribir "************************************************************";
		Escribir "Código vendedor:               ",codidovendedor;
		Escribir "Monto total de ventas semanal: ",montosemanal;
		Escribir "Comisión por ventas:           ",comisionventas;
		escribir "************************************************************";
		Escribir "Día con la menor cantidad de ventas: ",diabajo;
		Escribir "Día con la mayor cantidad de ventas: ",dialto;
		
		cantvendedores=cantvendedores+1;
		
		
		
		// otro vendedor
		Repetir
			escribir "Desea procesar otro vendedor? (S/N)";
			leer desea;
		Hasta Que Minusculas(desea)=="n" o Minusculas(desea)=="s"
		
		montogeneral=montogeneral+montosemanal;
		comisiongeneral=comisiongeneral+comisionventas;
		montosemanal=0;
		montobajo=100000000;
		montoalto=0;
		diabajo=0;
		dialto=0;
		Limpiar Pantalla;
	Hasta Que Minusculas(desea) == "n"
	promediovendedor=montogeneral/cantvendedores;
	promediocomision=comisiongeneral/cantvendedores;
	
	
	Escribir "                    Reporte general ";
	escribir "************************************************************";
	Escribir "Cantidad vendedores:               ",cantvendedores;
	Escribir "Total de ventas:                   ",montogeneral;
	Escribir "Total de comisiones:               ",comisiongeneral;
	Escribir "Promedio de ventas:                ",promediovendedor;
	Escribir "Promedio de comisiones:            ",promediocomision;
	
	
FinAlgoritmo
