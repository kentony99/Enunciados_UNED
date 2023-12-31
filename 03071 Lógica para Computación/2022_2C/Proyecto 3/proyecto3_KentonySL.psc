Algoritmo proyecto3
	Definir menu,matriz,i,j,provincia Como Entero;
	Definir votosEsperados,votosPartido,votosValidos,votosNulos,votosNoEmitidos Como Entero;
	Definir buscarGanador,partidoGanador,mayorVotos Como Entero;
	Definir abstencionismo,emitidos,nulos,validos Como Real;
	
	Definir opc1,opc2 Como Logico; //Booleanos para saber el estado del menu con las primeras dos opciones
	Dimension matriz[7,6];			 //Matriz de votaciones
	Dimension votosEsperados[7];	// Vectores para guardar los datos de cada provincia o partido
	Dimension votosPartido[4];
	Dimension votosValidos[7];
	Dimension votosNulos[7];
	Dimension votosNoEmitidos[7];
	Dimension abstencionismo[7];	//Estos vectores servirán para almacenar los porcentajes de cada variable
	Dimension emitidos[7];
	Dimension nulos[7];
	Dimension validos[7];
	
	//Inicializamos las variables necesarias, las demás serán hechas por el usuario
	opc1=Falso;
	opc2=Falso;
	votosPartido[0]=0;
	votosPartido[1]=0;
	votosPartido[2]=0;
	votosPartido[3]=0;
	
	partidoGanador=0;
	mayorVotos=0;
	provincia=0;

	
	Para i<-0 Hasta 6 Con Paso 1 Hacer //Inicializamos la matriz en 0 por buena practica
		Para j<-0 Hasta 5 Con Paso 1 Hacer
			Si j=0 Entonces
				provincia=provincia+1;
				matriz[i,j]=provincia;
			SiNo
				matriz[i,j]=0;
			FinSi
		FinPara
	FinPara
	
	Para i<-0 Hasta 6 Con Paso 1 Hacer //Inicializamos el vector en 0 por buena practica
		votosValidos[i]=0;
	FinPara
	
	Para i<-0 Hasta 6 Con Paso 1 Hacer //Inicializamos el vector en 0 por buena practica
		votosNulos[i]=0;
	FinPara
	
	Para i<-0 Hasta 6 Con Paso 1 Hacer //Inicializamos el vector en 0 por buena practica
		votosNoEmitidos[i]=0;
	FinPara
	
	Escribir " __^__                                      __^__";
	Escribir "( ___ )------------------------------------( ___ )";
	Escribir " | / |                                      | \ |";
	Escribir " | / |     Bienvenido al resumen de las     | \ |";
	Escribir " | / |            elecciones 2018           | \ |";
	Escribir " |___|                                      |___|";
	Escribir "(_____)------------------------------------(_____) ";
	Escribir "";
	Escribir "Digite cualquier tecla para iniciar sesión ";
	Esperar Tecla;
	Limpiar Pantalla;
	Repetir
		Escribir "--------------------------------------------------------------------";
		Escribir "                   M E N U   P R I N C I P A L";
		Escribir "--------------------------------------------------------------------";
		Escribir "Digite un número de la siguientes opciones:";
		Escribir " 1. Inicializar la matriz con las votaciones";
		Escribir " 2. Inicializar el vector con los votantes esperados por provincia";
		Escribir " 3. Reporte de votos por partido político";
		Escribir " 4. Reporte de votos válidos y nulos por provincia";
		Escribir " 5. Reporte de partido con mayor número de votos en cierta provincia";
		Escribir " 6. Reporte general de votos";
		Escribir " 7. Salir";
		Escribir "";
		Escribir "Opción: " Sin Saltar;
		Leer menu;
		Escribir "";
		
		Si opc1 Y opc2 Y menu>2 Y menu<7 Entonces
			Escribir "================================================";
			Escribir "        Votaciones para los 4 partidos";
			Escribir "================================================";
			Escribir "Provincia    P1    P2    P3    P4  Nulos";
			Para i<-0 Hasta 6 Con Paso 1 Hacer 
				Para j<-0 Hasta 5 Con Paso 1 Hacer
					Si j=0 Entonces
						provincia=provincia+1;
						matriz[i,j]=provincia;
						Escribir "    ",matriz[i,j],"     " Sin Saltar;
					SiNo
						Segun Longitud(ConvertirATexto(matriz[i,j])) Hacer //Con esto alineamos la matriz
							1:
								Escribir "    ",matriz[i,j]," " Sin Saltar;
							2:
								Escribir "   ",matriz[i,j]," " Sin Saltar;
							3:
								Escribir "  ",matriz[i,j]," " Sin Saltar;
						FinSegun
					FinSi
				FinPara
				Escribir "";
			FinPara
			provincia=0;				//Es necesario resetear este valor en cada "matriz" porque sino seguiría provicia 8,9,10,... que no existen
			Escribir "================================================";
		SiNo
			Si menu>2 Y menu<7 Entonces
				Si opc1==Falso Entonces
					Si opc2==Falso Entonces
						Escribir "Primero, debes digitar las opciones 1 y 2, para disfrutar de las demás funciones";
					SiNo
						Escribir "Primero, debes digitar la opción 1, para disfrutar de las demás funciones";
					FinSi
				SiNo
					Escribir "Primero, debes digitar la opción 2, para disfrutar de las demás funciones";
				FinSi
				menu=menu+10; //Con esto me aseguro vuelva al menu al no existir una opción mayor que 7
			
			SiNo
				
			FinSi
			
		FinSi
		provincia=0;
		Segun menu Hacer
			1:
				Escribir "Llenando e imprimiendo la matriz, espere un momento" Sin Saltar;
				Esperar 500 Milisegundos;
				Escribir "." Sin Saltar;
				Esperar 500 Milisegundos;
				Escribir "." Sin Saltar;
				Esperar 500 Milisegundos;
				Escribir "." Sin Saltar;
				Esperar 500 Milisegundos;
				Escribir "Matriz iniciada exitosamente";
				Escribir "";
				Escribir "================================================";
				Escribir "        Votaciones para los 4 partidos";
				Escribir "================================================";
				Escribir "Provincia    P1    P2    P3    P4  Nulos";
				Para i<-0 Hasta 6 Con Paso 1 Hacer 
					Para j<-0 Hasta 5 Con Paso 1 Hacer
						Si opc1=Falso Entonces //Si la opcion 1 no se ha seleccionado, hago los calculos aleatorios
							Segun j Hacer
								0:
									provincia=provincia+1;
									matriz[i,j]=provincia;
									Escribir "    ",matriz[i,j],"     " Sin Saltar;
								1,2,3,4:
									matriz[i,j]=azar(801);
									Segun Longitud(ConvertirATexto(matriz[i,j])) Hacer //Con esto alineamos la matriz
										1:
											Escribir "    ",matriz[i,j]," " Sin Saltar;
										2:
											Escribir "   ",matriz[i,j]," " Sin Saltar;
										3:
											Escribir "  ",matriz[i,j]," " Sin Saltar;
									FinSegun
								5:
									matriz[i,j]=azar(798)+1;
									Segun Longitud(ConvertirATexto(matriz[i,j])) Hacer //Con esto alineamos la matriz
										1:
											Escribir "    ",matriz[i,j]," " Sin Saltar;
										2:
											Escribir "   ",matriz[i,j]," " Sin Saltar;
										3:
											Escribir "  ",matriz[i,j]," " Sin Saltar;
									FinSegun
							FinSegun
						SiNo //Si la opcion 1 ya se ha seleccionado, solamente muestro la matriz
							Segun j Hacer
								0:
									provincia=provincia+1;
									matriz[i,j]=provincia;
									Escribir "    ",matriz[i,j],"     " Sin Saltar;
								1,2,3,4:
									Segun Longitud(ConvertirATexto(matriz[i,j])) Hacer //Con esto alineamos la matriz
										1:
											Escribir "    ",matriz[i,j]," " Sin Saltar;
										2:
											Escribir "   ",matriz[i,j]," " Sin Saltar;
										3:
											Escribir "  ",matriz[i,j]," " Sin Saltar;
									FinSegun
								5:
									Segun Longitud(ConvertirATexto(matriz[i,j])) Hacer //Con esto alineamos la matriz
										1:
											Escribir "    ",matriz[i,j]," " Sin Saltar;
										2:
											Escribir "   ",matriz[i,j]," " Sin Saltar;
										3:
											Escribir "  ",matriz[i,j]," " Sin Saltar;
									FinSegun
							FinSegun
						FinSi
					FinPara
					Escribir "";
				FinPara
				Escribir "================================================";
				Escribir "Digite cualquier tecla para regresar al menú";
				opc1=Verdadero;
				Esperar Tecla;
			2:
				Escribir "Llenando e imprimiendo el vector, espere un momento" Sin Saltar;
				Esperar 500 Milisegundos;
				Escribir "." Sin Saltar;
				Esperar 500 Milisegundos;
				Escribir "." Sin Saltar;
				Esperar 500 Milisegundos;
				Escribir "." Sin Saltar;
				Esperar 500 Milisegundos;
				Escribir "";
				Escribir "================================================";
				Escribir "        Votos esperados por provincia";
				Escribir "================================================";
				Si opc2=Falso Entonces
					Para i<-0 Hasta 6 Con Paso 1 Hacer
						votosEsperados[i]=Azar(799)+3201;
						Escribir "--- Votos esperados para la provincia ",i+1,"     ",votosEsperados[i];
					FinPara
					Escribir "================================================";
					Escribir "Digite cualquier tecla para regresar al menú";
					Esperar Tecla;
					
					Para i<-0 Hasta 6 Con Paso 1 Hacer
						Para j<-1 Hasta 4 Con Paso 1 Hacer
							votosValidos[i]=votosValidos[i]+matriz[i,j]; //Determino los votos validos de cada provincia
						FinPara
					FinPara
					
					Para i<-0 Hasta 6 Con Paso 1 Hacer
						votosNulos[i]=matriz[i,5];						//Determino los votos nulos de cada provincia
					FinPara
					
					Para i<-0 Hasta 6 Con Paso 1 Hacer
						votosNoEmitidos[i]=votosEsperados[i]-votosValidos[i]-votosNulos[i]; //Determino los votos no emitidos de cada provincia
					FinPara
				SiNo
					Para i<-0 Hasta 6 Con Paso 1 Hacer //Si ya la opción ya fue seleccionada, solamente muestro la matriz
						Escribir "--- Votos esperados para la provincia ",i+1,"     ",votosEsperados[i];
					FinPara
					Escribir "================================================";
					Escribir "Digite cualquier tecla para regresar al menú";
					Esperar Tecla;
				FinSi
				opc2=Verdadero;
			3:
				Escribir "      Total de votos para cada partido";
				Escribir "================================================";
				Para i<-1 Hasta 4 Con Paso 1 Hacer 
					Para j<-0 Hasta 6 Con Paso 1 Hacer
						votosPartido[i-1]=votosPartido[i-1]+matriz[j,i]; //Acumulo los votos de cada partido
					FinPara
					Escribir "--- Votos recibidos para el partido P",i,"    ",votosPartido[i-1];
					Escribir "";
				FinPara
				Escribir "================================================";
				Escribir "Digite cualquier tecla para regresar al menú";
				Esperar Tecla;
			4:
				Escribir "  Total de votos válidos y nulos por provincia";
				Escribir "================================================";
				Escribir "        Provincia    Validos    Nulos";
				Para i<-0 Hasta 6 Con Paso 1 Hacer 
					Para j<-0 Hasta 1 Con Paso 1 Hacer
						Si j=0 Entonces
							Escribir "            ",matriz[i,j],"         ", Sin Saltar;
						SiNo
							Segun Longitud(ConvertirATexto(votosValidos[i])) Hacer
								2:
									Escribir "  ",votosValidos[i],"       ",Sin Saltar;
								3:
									Escribir " ",votosValidos[i],"       ",Sin Saltar;
								4:
									Escribir votosValidos[i],"       ",Sin Saltar;
							FinSegun
							
							Segun Longitud(ConvertirATexto(votosNulos[i])) Hacer //Con esto alineamos la matriz
								1:
									Escribir "  ",votosNulos[i], Sin Saltar;
								2:
									Escribir " ",votosNulos[i], Sin Saltar;
								3:
									Escribir "",votosNulos[i], Sin Saltar;
							FinSegun
						FinSi
					FinPara
					Escribir "";
				FinPara
				Escribir "================================================";
				Escribir "Digite cualquier tecla para regresar al menú";
				Esperar Tecla;
			5:
				Escribir "Digite un número de provincia para observar el partido ganador";
				Leer buscarGanador;
				i=buscarGanador-1;
				
				Para j<-1 Hasta 4 Con Paso 1 Hacer
					Si matriz[i,j]>mayorVotos Entonces //Busco el partido ganador
						mayorVotos=matriz[i,j];
						partidoGanador=j;
					SiNo
						
					FinSi
				FinPara
				Escribir "Partido con la mayor cantidad de votos en la provincia ",buscarGanador," es el P",partidoGanador," con ",mayorVotos," votos";
				Escribir "================================================";
				Escribir "Digite cualquier tecla para regresar al menú";
				Esperar Tecla;
			6:
				Escribir "=======================================================================================================================================";
				Escribir "Provincia  |  V. esperados  |  V. Válidos  |  V. nulos  |  V. no emitidos  |  % Abstencionismo  |  % Emitidos  |  % Nulos  |  % Válidos";
				Para i<-0 Hasta 6 Con Paso 1 Hacer
					abstencionismo[i]=TRUNC(votosNoEmitidos[i]/votosEsperados[i]*100*100.0)/100.0;
					emitidos[i]=TRUNC((votosValidos[i]+votosNulos[i])/votosEsperados[i]*100*100.0)/100.0;
					nulos[i]=TRUNC(votosNulos[i]/votosEsperados[i]*100*100.0)/100.0;
					validos[i]=TRUNC(votosValidos[i]/votosEsperados[i]*100*100.0)/100.0;
					Escribir "    ",i+1,"             ",votosEsperados[i],"            "Sin Saltar;
					Segun Longitud(ConvertirATexto(votosValidos[i])) Hacer 
						2:
							Escribir "  ",votosValidos[i],"         ", Sin Saltar;
						3:
							Escribir " ",votosValidos[i],"         ", Sin Saltar;
						4:
							Escribir "",votosValidos[i],"         ", Sin Saltar;
					FinSegun
					Segun Longitud(ConvertirATexto(votosNulos[i])) Hacer 
						1:
							Escribir "   ",votosNulos[i],"             ", Sin Saltar;
						2:
							Escribir "  ",votosNulos[i],"             ", Sin Saltar;
						3:
							Escribir " ",votosNulos[i],"             ", Sin Saltar;
					FinSegun 
					Segun Longitud(ConvertirATexto(votosNoEmitidos[i])) Hacer 
						2:
							Escribir "  ",votosNoEmitidos[i],"               ", Sin Saltar;
						3:
							Escribir " ",votosNoEmitidos[i],"               ", Sin Saltar;
						4:
							Escribir "",votosNoEmitidos[i],"               ", Sin Saltar;
					FinSegun
					Segun Longitud(ConvertirATexto(abstencionismo[i])) Hacer 
						3:
							Escribir abstencionismo[i],"               ", Sin Saltar;
						4:
							Escribir abstencionismo[i],"              ", Sin Saltar;
						5:
							Escribir abstencionismo[i],"             ", Sin Saltar;
					FinSegun
					Segun Longitud(ConvertirATexto(emitidos[i])) Hacer 
						3:
							Escribir emitidos[i],"            ", Sin Saltar;
						4:
							Escribir emitidos[i],"           ", Sin Saltar;
						5:
							Escribir emitidos[i],"          ", Sin Saltar;
					FinSegun
					Segun Longitud(ConvertirATexto(nulos[i])) Hacer 
						3:
							Escribir nulos[i],"         ", Sin Saltar;
						4:
							Escribir nulos[i],"        ", Sin Saltar;
						5:
							Escribir nulos[i],"       ", Sin Saltar;
					FinSegun
					
					Escribir validos[i];
				FinPara
				Esperar Tecla;
			7:
				Escribir "Gracias por utilizar el programa de votaciones, ¡Hasta pronto! :)";
				Esperar Tecla;
			De Otro Modo:
				Escribir "Opción no válida, presione una tecla para continuar";
				Esperar Tecla;
		FinSegun
		Limpiar Pantalla;
	Hasta Que menu==7
FinAlgoritmo
