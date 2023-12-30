Algoritmo sin_titulo
	
	//definir variables//
    Definir n, m,i, acumulador,valorAlea,opcionMenu Como Entero;
	Definir opcionUno Como Logico;
	Definir sumaFilas,sumaColumnas,totalFinal Como Entero;
	Definir minimo,maximo,Mas,Menos,Mas2,Menos2 Como Entero;
	Definir CC,CD,VD,MN,MMV Como Entero;
	Definir Matriz_Ventas,Ventas_Diarias Como Entero;
	Definir promedioVentas Como Real;
	
	// Inicializacion de Variables
	n <- 0;
	m <- 0;
	i <- 0;
	acumulador=0;
	valorAlea=0;
	opcionMenu=0;
	opcionUno=Falso;
	totalFinal=0;
	minimo=1000000;
	maximo=0;
	Mas=0;
	Menos=0;
	Mas2=0;
	Menos2=0;
	promedioVentas=0.00;

	Escribir "           Pulperia El BONACHON " ;
	Escribir "       Modulo Estadistico de ventas" ;
	Escribir "       Inicializacion de Parametros" ;
	Escribir "----------------------------------------------- " ;
	
	//Toma los valores del usuario//
	Repetir
		Escribir "Digite la cantidad de clientes: "Sin Saltar; // Va de segundo en la matriz//
		Leer CC;
	Hasta Que CC>0
	
	Repetir
		Escribir "Digitar cantidad de dias:"Sin Saltar; //Se pone primero para la matriz//
		Leer CD;
	Hasta Que CD>0
	
	Repetir
		Escribir "Digitar cantidad de ventas por dia:"Sin Saltar;
		Leer VD;
	Hasta Que VD>0
	
	Repetir
		Escribir "Digitar Minimo de una venta:"Sin Saltar;
		Leer MN;
	Hasta Que MN>0
	
	Repetir
		Escribir "Digitar Maximo de una venta "Sin Saltar;
		Leer MMV;
	Hasta Que MMV>0 Y MMV<21
	
	//Se dimensiona el vector y la matriz
	Dimension Matriz_Ventas[CD,CC];
	Dimension Ventas_Diarias[VD];
	Dimension sumaFilas[CD];
	Dimension sumaColumnas[CC];
	
	
	
	// iniciacion de matriz, con valores en cero
	Para n=0 Hasta CD-1 Con Paso 1 Hacer
			sumaFilas[n]=0;
		Para m=0 Hasta CC-1 Con Paso 1 Hacer
			Matriz_Ventas[n,m]=0;
			sumaColumnas[m]=0;
		FinPara
	FinPara
		
	
	Repetir
		Escribir "---------------------------------" ;
		Escribir "      Pulperia El BONACHON " ;
		Escribir "  Modulo Estadistico de ventas" ;
		Escribir "---------------------------------" ;
		Escribir "1. Llenado de datos estadisticos" ;
		Escribir "2. Presentacion de matriz" ;
		Escribir "3. Reporte de ventas totales y promedio" ;
		Escribir "4. Reporte de indicadores por cliente";
		Escribir "5. Salir del Menu ";
		Escribir "---------------------------------" ;
		Repetir
			Escribir "Opción: ";sin saltar;
			Leer opcionMenu;
		Hasta Que opcionMenu>0 Y opcionMenu<6
		Escribir  "---------------------------------" ;
		
		Segun opcionMenu Hacer 
			1:
				Si opcionUno==Falso Entonces
					Para n<-0 Hasta CD-1 Con Paso 1 Hacer
						Para m<-0 Hasta CC-1 Con Paso 1 Hacer
							Escribir "Ventas del día [",n+1,"] para el cliente [",m+1,"] ---> ";Sin saltar
							Para i<-0 Hasta VD-1 Con Paso 1 Hacer
								valorAlea=Aleatorio(0,1);
								Si valorAlea==1 Entonces
									Ventas_Diarias[i]=Aleatorio(MN,MMV);//si hubo ventas y se le asignara el valor aleatorio
								SiNo
									Ventas_Diarias[i]=0; //no hubo ventas
								FinSi
								Si Longitud(ConvertirATexto(Ventas_Diarias[i]))==1 Entonces
									Escribir " ",Ventas_Diarias[i]," ",Sin Saltar;
								SiNo
									Escribir Ventas_Diarias[i]," ",Sin Saltar;
								FinSi
								acumulador=acumulador+Ventas_Diarias[i]; //suma toda las ventas diarias
							FinPara
							Escribir "= ",acumulador;
							Matriz_Ventas[n,m]=acumulador;
							acumulador=0;
						FinPara
					FinPara
					Escribir "";
					Escribir "Presione una tecla para regresar al menú";
					Esperar Tecla;
					opcionUno=Verdadero;
				SiNo
					Escribir "Esta opción ya fue ejecutada, presione una tecla para regresar al menu";
					Esperar Tecla;
				FinSi
			2:  
				Si opcionUno==Verdadero Entonces
					//Se borran valores
					totalFinal=0;
					Para n=0 Hasta CD-1 Con Paso 1 Hacer
						sumaFilas[n]=0;
						Para m=0 Hasta CC-1 Con Paso 1 Hacer
							sumaColumnas[m]=0;
						FinPara
					FinPara
					//mostrar matriz en pantalla
					Escribir "         Matriz de ventas";
					Escribir "             Clientes";
					Escribir "          ";Sin Saltar
					Para m<-0 Hasta CC-1 Con Paso 1 Hacer
						Escribir m+1,"   ";Sin Saltar
					FinPara
					Escribir "    Total:";
					Para n<-0 Hasta CD-1 Con Paso 1 Hacer
						Escribir "Día ",n+1,"    ";Sin Saltar
						Para m<-0 Hasta CC-1 Con Paso 1 Hacer
							sumaFilas[n]=sumaFilas[n]+Matriz_Ventas[n,m];//suma fila y columnas
							sumaColumnas[m]=sumaColumnas[m]+Matriz_Ventas[n,m];
							Si Longitud(ConvertirATexto(Matriz_Ventas[n,m]))==1 Entonces
								Escribir " ",Matriz_Ventas[n,m], "  "; Sin Saltar;
							SiNo
								Escribir Matriz_Ventas[n,m], "  "; Sin Saltar;
							FinSi
						FinPara
						Escribir "--->  ",sumaFilas[n];
					FinPara
					Escribir "------------------------------";
					Escribir " Total:  ";Sin Saltar
					Para m<-0 Hasta CC-1 Con Paso 1 Hacer
						totalFinal=totalFinal+sumaColumnas[m];
						Escribir sumaColumnas[m],"  ";Sin Saltar
					FinPara
					Escribir "     ",totalFinal;
					Escribir "";
					Escribir "Presione una tecla para continuar";
					Esperar Tecla;
				SiNo
					Escribir "La opción 1 no fue ejecutada aún, presione una tecla para regresar al menu";
					Esperar Tecla;
				FinSi
				
			3: 
				promedioVentas=totalFinal/(CC*CD);
				Escribir "------------------------------------------------";
				Escribir "          Pulperia El BONACHON ";
				Escribir "       Modulo Estadistico de ventas";
				Escribir "    Reporte de ventas totales y promedio";
				Escribir "------------------------------------------------";
				Escribir "Monto total de ventas             : ", totalFinal;	 					
				Escribir "Cantidad de clientes procesados   : ", CC;            	
				Escribir "Cantidad de días procesados       : ", CD;
				Escribir "Promedio de ventas                : ", promedioVentas;
				Escribir "------------------------------------------------";
				Escribir "";
				Escribir "Presione una tecla para continuar";
				Esperar Tecla;
			4: 
				Escribir "------------------------------------------------";
				Escribir "          Pulperia El BONACHON " ;
				Escribir "       Modulo Estadistico de ventas" ;
				Escribir "       Reporte de mínimos y máximos";
				Escribir "------------------------------------------------";
				minimo=100000;
				maximo=0;
				Para m<-0 Hasta CC-1 Con Paso 1 Hacer
					Si sumaColumnas[m]<minimo Entonces
						minimo=sumaColumnas[m];
						Menos=m+1;
					FinSi
					Si sumaColumnas[m]>maximo Entonces
						maximo=sumaColumnas[m];
						Mas=m+1;
					FinSi
				FinPara
				Escribir "------------- Reporte de clientes -------------";
				Escribir "--> Cliente [",Mas,"] tuvo mayor monto de compras [",maximo,"]";
				Escribir "--> Cliente [",Menos,"] tuvo menor monto de compras [",minimo,"]";
				Escribir "";
				
				minimo=100000;
				maximo=0;
				Para n<-0 Hasta CD-1 Con Paso 1 Hacer
					Si sumaFilas[n]<minimo Entonces
						minimo=sumaFilas[n];
						Menos=n+1;
					FinSi
					Si sumaFilas[n]>maximo Entonces
						maximo=sumaFilas[n];
						Mas=n+1;
					FinSi
				FinPara
				Escribir "-------------- Reporte de ventas --------------";
				Escribir "--> Día [",Mas,"] tuvo mayor monto de ventas [",maximo,"]";
				Escribir "--> Día [",Menos,"] tuvo mayor monto de ventas [",minimo,"]";
				Escribir "";
				
				minimo=100000;
				maximo=0;
				Para n<-0 Hasta CD-1 Con Paso 1 Hacer
					Para m<-0 Hasta CC-1 Con Paso 1 Hacer
						Si Matriz_Ventas[n,m]<minimo Entonces
							minimo=Matriz_Ventas[n,m];
							Menos=n+1;
							Menos2=m+1;
						FinSi
						Si Matriz_Ventas[n,m]>maximo Entonces
							maximo=Matriz_Ventas[n,m];
							Mas=n+1;
							Mas2=m+1;
						FinSi
					FinPara
				FinPara
				
				
				
				Escribir "-------------- Rendimiento diario ---------------";
				Escribir "Cliente [",Mas2,"] y día [",Mas,"] con la mejor compra [",maximo,"]";
				Escribir "Cliente [",Menos2,"] y día [",Menos,"] con la peor compra [",minimo,"]";
				Escribir "------------------------------------";
				Escribir "";
				Escribir "Presione una tecla para continuar";
				Esperar Tecla;
				
			5: 
				Escribir "Proceso de estadísticas finalizado";
		FinSegun
	Hasta Que opcionMenu==5;
	
		
		
		
		


FinAlgoritmo
