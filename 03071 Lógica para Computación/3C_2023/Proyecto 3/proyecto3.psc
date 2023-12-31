Algoritmo sin_titulo
	Definir opcionMenu Como Entero;;
	Definir matrizEntradas Como Entero;
	Definir matrizTipoEntrada Como Caracter;
	Definir tardiasSemana Como Entero;
	Definir tardiasDia Como Entero;
	Definir i,j Como Entero;
	Definir opcionUno Como Logico;
	Definir maximo Como Entero;
	Definir indice Como Entero;
	Definir dias Como Cadena;
	
	Dimension matrizEntradas[4,5];
	Dimension matrizTipoEntrada[4,5];
	Dimension tardiasSemana[4];
	Dimension tardiasDia[5];
	Dimension dias[5];
	
	opcionMenu=0;
	i=0;
	j=0;
	opcionUno=Falso;
	maximo=0;
	indice=0;
	
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		tardiasSemana[i]=0;
	FinPara
	Para i<-0 Hasta 4 Con Paso 1 Hacer
		tardiasDia[i]=0;
	FinPara
	dias[0]="Lunes";
	dias[1]="Martes";
	dias[2]="Miercoles";
	dias[3]="Jueves";
	dias[4]="Viernes";
	
	Repetir
		Escribir "===============================";
		Escribir "  M E N U   P R I N C I P A L";
		Escribir "===============================";
		Escribir "1. Generar entradas";
		Escribir "2. Generar reporte";
		Escribir "3. Salir";
		Escribir "===============================";
		Escribir "Opción deseada: ";Sin Saltar
		Leer opcionMenu;
		
		Segun opcionMenu Hacer
			1:
				Si opcionUno=Falso Entonces
					Para i<-0 Hasta 3 Con Paso 1 Hacer
						Para j<-0 Hasta 4 Con Paso 1 Hacer
							matrizEntradas[i,j]=730+Aleatorio(0,29);
							matrizTipoEntrada[i,j]="P";
							Si Aleatorio(7,8)=7 Entonces
								matrizEntradas[i,j]=730+Aleatorio(0,29);
								matrizTipoEntrada[i,j]="P";
							SiNo
								matrizEntradas[i,j]=800+Aleatorio(0,30);
								Si matrizEntradas[i,j]<>800 Entonces
									matrizTipoEntrada[i,j]="T";
									tardiasSemana[i]=tardiasSemana[i]+1;
									tardiasDia[j]=tardiasDia[j]+1;
								SiNo
									matrizTipoEntrada[i,j]="P";
								FinSi
							FinSi
						FinPara
					FinPara
				FinSi
				
				Escribir "  Semana     L    K    M    J    V";
				Para i<-0 Hasta 3 Con Paso 1 Hacer
					Escribir "     ",i+1,"      ";Sin Saltar
					Para j<-0 Hasta 4 Con Paso 1 Hacer
						Escribir matrizEntradas[i,j],"  ";Sin Saltar
					FinPara
					Escribir "";
				FinPara
				opcionUno=Verdadero;
			2:
				Si opcionUno=Verdadero Entonces
					Escribir "       HORAS DE ENTRADA";
					Escribir "  Semana     L    K    M    J    V";
					Para i<-0 Hasta 3 Con Paso 1 Hacer
						Escribir "     ",i+1,"      ";Sin Saltar
						Para j<-0 Hasta 4 Con Paso 1 Hacer
							Escribir matrizEntradas[i,j],"  ";Sin Saltar
						FinPara
						Escribir "";
					FinPara
					
					Escribir "       HORAS DE ENTRADA";
					Escribir "  Semana      L     K     M     J     V";
					Para i<-0 Hasta 3 Con Paso 1 Hacer
						Escribir "     ",i+1,"      ";Sin Saltar
						Para j<-0 Hasta 4 Con Paso 1 Hacer
							Escribir Concatenar(Concatenar(SubCadena(ConvertirATexto(matrizEntradas[i,j]),0,0),":"),SubCadena(ConvertirATexto(matrizEntradas[i,j]),1,2)),"  ";Sin Saltar
						FinPara
						Escribir "";
					FinPara
					
					
					Escribir "";
					Escribir "  Semana     L    K    M    J    V  | Tardías";
					Para i<-0 Hasta 3 Con Paso 1 Hacer
						Escribir "     ",i+1,"       ";Sin Saltar
						Para j<-0 Hasta 4 Con Paso 1 Hacer
							Escribir matrizTipoEntrada[i,j],"    ";Sin Saltar
						FinPara
						Escribir "   ",tardiasSemana[i];
					FinPara
					Escribir " Tardías     ";Sin Saltar;
					Para i<-0 Hasta 4 Con Paso 1 Hacer
						Escribir tardiasDia[i],"    ";Sin Saltar
					FinPara
					Escribir "   ",tardiasSemana[0]+tardiasSemana[1]+tardiasSemana[2]+tardiasSemana[3];
					Escribir "";
					Escribir "La cantidad de tardías del mes es: ",tardiasSemana[0]+tardiasSemana[1]+tardiasSemana[2]+tardiasSemana[3];
					maximo=0;
					Para i<-0 Hasta 4 Con Paso 1 Hacer
						Si tardiasDia[i]>maximo Entonces
							maximo=tardiasDia[i];
						FinSi
					FinPara
					Escribir "Los días con más tardías en el mes fue: ";Sin Saltar
					Si maximo<>0 Entonces
						Para i<-0 Hasta 4 Con Paso 1 Hacer
							Si tardiasDia[i]=maximo Entonces
								Escribir dias[i],", ";Sin Saltar
							FinSi
						FinPara
					SiNo
						Escribir "N/A";
					FinSi
					Escribir "";
					maximo=0;
					Para i<-0 Hasta 3 Con Paso 1 Hacer
						Si tardiasSemana[i]>maximo Entonces
							maximo=tardiasSemana[i];
						FinSi
					FinPara
					Escribir "Las semanas con más tardías fue: ";Sin Saltar
					Si maximo<>0 Entonces
						Para i<-0 Hasta 3 Con Paso 1 Hacer
							Si tardiasSemana[i]=maximo Entonces
								Escribir "Semana ",i+1,", ";Sin Saltar
							FinSi
						FinPara
					SiNo
						Escribir "N/A";
					FinSi
					
					Escribir "";
				SiNo
					Escribir "Primero debe generar las horas de entrada (Opción 1)";
				FinSi
			De Otro Modo:
				Escribir "Digita una opción correcta (1-3)";
		FinSegun
		Escribir "";
		Escribir "Digite una tecla para continuar";
		Esperar Tecla;
		Limpiar Pantalla;
		
		
		
	Hasta Que opcionMenu=3
	
	
	
	
	
FinAlgoritmo
