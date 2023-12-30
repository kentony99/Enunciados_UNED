Algoritmo pr4
	//Definicion de variables
	
	Definir CantPart,CantRondas Como Entero;
	Definir OpcionMenu Como Entero;
	
	Definir matriz,fila,columna,matriz1 Como Entero;
	
	Definir RondaActual,RondaBuscada,PosicionEliminar Como Entero;

	
	
	//Inicializacion de variables
	CantPart=5;//valor minimo
	CantRondas=2;//valor minimo
	OpcionMenu=0;
	fila=0;
	columna=0;
	RondaActual=-1;
	
	
	
	Escribir "------------------------------";
	Escribir "     Comité de deportes";
	Escribir "Módulo control de puntuaciones";
	Escribir " Inicialización de parámetros";
	Escribir "------------------------------";
	Repetir
		Escribir "Participantes: ";sin saltar
		Leer CantPart;
		Si CantPart<5 Entonces
			Escribir "La cantidad de participantes minima es CINCO";
		FinSi
	Hasta Que CantPart>=5
	
	Repetir
		Escribir "Rondas: ";sin saltar
		Leer CantRondas;
		Si CantRondas<2 Entonces
			Escribir "La cantidad de rondas debe ser mayor a 1";
		FinSi
	Hasta Que CantRondas>=2
	
	Dimension matriz(CantRondas,CantPart);
	Dimension matriz1(CantPart,2); //matriz para tener los datos para el ordenamiento
	
	Repetir
		Limpiar Pantalla;
		Escribir "------------------------------";
		Escribir "     Comité de deportes";
		Escribir "Módulo control de puntuaciones";
		Escribir "------------------------------";
		Escribir "[1] Inicialización de puntajes";
		Escribir "[2] Registro de datos de cada ronda";
		Escribir "[3] Consulta de puntuaciones de una ronda";
		Escribir "[4] Reporte de toda la competencia";
		Escribir "[5] Reporte de ganadores de la fecha";
		Escribir "[6] Salir del Sistema";
		
		Repetir
			Escribir "Opción: ";Sin Saltar
			Leer OpcionMenu;
			Si OpcionMenu<1 O OpcionMenu>6 Entonces
				Escribir "Debe digitar un número del menu";
			FinSi
		Hasta Que 0<OpcionMenu Y OpcionMenu<7
		
		
		Segun OpcionMenu Hacer
			1:
				Si RondaActual==-1 O RondaActual==CantRondas Entonces
					PosicionEliminar=CantPart-1;// se establece que debe empezar a eliminarse desde este indice que será el ultimo
					iniciarMatriz(matriz,CantRondas,CantPart); //subsproceso para inicializar la matriz
					Escribir "Inicializando datos...";
					Esperar 2 segundos;
					RondaActual=0;
				SiNo
					Escribir "Los datos ya se encuentran inicializados";
				FinSi
				Escribir "";
				Escribir "Digite ENTER para continuar";
				Esperar Tecla;
			2:
				
				Si RondaActual>=0 Y RondaActual<CantRondas Entonces
					Escribir "------------------------------";
					Escribir "     Comité de deportes";
					Escribir "Módulo control de puntuaciones";
					Escribir "------------------------------";
					Escribir "Resultados para la ronda #",RondaActual+1;
					Escribir "";
					
					llenarMatriz(matriz,CantPart,RondaActual,CantRondas,matriz1); //subproceso para llenar la matriz con aleatorios
					
					definirGanadores(CantPart,matriz1); //subproceso para ordenar los puntajes
					
					mostrarResultadoRonda(PosicionEliminar,matriz1); //subproceso para mostrar en pantalla los resultados ordenados de la ronda
					
					Si RondaActual<CantRondas-1 Entonces
						descalificarPart(matriz,PosicionEliminar,matriz1,RondaActual); //subproceso para remover los ultimos dos lugares
					FinSi
					
					RondaActual=RondaActual+1;
				SiNo
					Si RondaActual==CantRondas Entonces
						Escribir "La competencia ya finalizó";
					FinSi
				FinSi
				
				Escribir "";
				Escribir "Digite ENTER para continuar";
				Esperar Tecla;
			3:
				Si RondaActual<>-1 Entonces
					Escribir "-------------------------------------------------------";
					Escribir "                Comité de deportes";
					Escribir "           Módulo control de puntuaciones";
					Escribir "         Consulta de resultados de una ronda";
					Escribir "-------------------------------------------------------";
					Escribir "Digite el número de ronda que desea consultar";sin saltar
					Leer RondaBuscada;
					Si RondaBuscada<=RondaActual Y RondaBuscada>0 Entonces
						mostrarRondaBuscada(CantPart,matriz,RondaBuscada);
					SiNo
						Si RondaBuscada<>0 Entonces
							Si RondaBuscada>=CantRondas O RondaBuscada<=0 Entonces
								Escribir "Esta ronda no existirá en la competencia";
							SiNo
								Escribir "Esta ronda aún no se ha desarrollado";
							FinSi
						SiNo
							Escribir "Usted decidió no ver resultados";
						FinSi
					FinSi
				SiNo
					Escribir "La opción 1 aún no se ejecutó";
				FinSi
				Escribir "";
				Escribir "Digite ENTER para continuar";
				Esperar Tecla;
			4: 
				Si RondaActual>0 Entonces
					mostrarMatriz(CantPart,CantRondas,matriz);
				SiNo
					Escribir "Debe ejecutar las opciones 1 y 2 antes de entrar a esta opción";
				FinSi
				Escribir "";
				Escribir "Digite ENTER para continuar";
				Esperar Tecla;
			5:
				Si RondaActual=CantRondas Entonces
					Para columna<-0 Hasta CantPart-1 Con Paso 1 Hacer
						matriz1(columna,0)=matriz(cantRondas-1,columna);
						matriz1(columna,1)=columna+1;
					FinPara
					
					definirGanadores(CantPart,matriz1); //subproceso para ordenar los puntajes
					
					Escribir "-----------------------------------------------";
					Escribir "              Comité de deportes";
					Escribir "        Módulo control de puntuaciones";
					Escribir "     Resultados finales de la competencia";
					
					mostrarResultados(cantRondas,matriz1,matriz);
				SiNo
					Escribir "La competencia aún no ha terminado";
				FinSi
				Escribir "Digite ENTER para continuar";
				Esperar Tecla;
			6:
				Escribir "Saliendo del sistema";
				Esperar 2 Segundos;
			De Otro Modo:
				Escribir "Digite una opción correcta (1-6)";
				Escribir "Digite ENTER para continuar";
				Esperar Tecla;
		FinSegun
	Hasta Que OpcionMenu==6
FinAlgoritmo

SubProceso iniciarMatriz(matriz Por Referencia,CantRondas,CantPart)
	Definir fila,columna Como Entero;
	Para fila<-0 Hasta CantRondas-1 Con Paso 1 Hacer
		Para columna<-0 Hasta CantPart-1 Con Paso 1 Hacer
			matriz(fila,columna)=99;//Se inicia con el valor 99
		FinPara
	FinPara
FinSubProceso

SubProceso llenarMatriz(matriz Por Referencia,CantPart,RondaActual,CantRondas,matriz1 Por Referencia)
	Definir columna Como Entero;
	Para columna<-0 Hasta CantPart-1 Con Paso 1 Hacer
		//primera ronda
		Si RondaActual==0 Entonces
			matriz(RondaActual,columna)=Aleatorio(0,10);
		SiNo
			//si el valor de la fila anterior es diferente de -1 (perdedor)
			Si matriz(RondaActual,columna)<>-1 Entonces
				matriz(RondaActual,columna)=Aleatorio(0,10);
			SiNo
				//si no es la ultima ronda, la siguiente sigue como perdedor
				Si RondaActual<CantRondas-1 Entonces
					matriz(RondaActual+1,columna)=-1;
				FinSi
				
			FinSi
		FinSi
		//lleno la matriz1 para ejecutar el ordenamiento
		matriz1(columna,0)=matriz(RondaActual,columna);
		matriz1(columna,1)=columna+1;
	FinPara
FinSubProceso

SubProceso definirGanadores(CantPart,matriz1 Por Referencia)
	Definir columna,i,aux Como Entero;
	//aplico ordenamiento burbuja
	Para columna<-0 Hasta CantPart-1 Con Paso 1 Hacer
		Para i<-0 Hasta CantPart-2 Con Paso 1 Hacer
			//si el valor siguiente es mayor que actual, cambio valores
			Si matriz1(i,0)<matriz1(i+1,0) Entonces
				//intercambio puntuaciones
				aux=matriz1(i,0);
				matriz1(i,0)=matriz1(i+1,0);
				matriz1(i+1,0)=aux;
				//intercambio numero de competidores
				aux=matriz1(i,1);
				matriz1(i,1)=matriz1(i+1,1);
				matriz1(i+1,1)=aux;
			SiNo
				//si el valor siguiente es igual al actual, aplico el caso desempate. Si ALEATORIO es 0 significa que perdio por lo tanto intercambio valores
				Si matriz1(i,0)==matriz1(i+1,0) Y Aleatorio(0,1)==0 Entonces
					//intercambio puntuaciones
					aux=matriz1(i,0);
					matriz1(i,0)=matriz1(i+1,0);
					matriz1(i+1,0)=aux;
					//intercambio numero de competidores
					aux=matriz1(i,1);
					matriz1(i,1)=matriz1(i+1,1);
					matriz1(i+1,1)=aux;
				FinSi
			FinSi
		FinPara
	FinPara
FinSubProceso

SubProceso mostrarResultadoRonda(PosicionEliminar,matriz1)
	Definir columna Como Entero;
	Para columna<-0 Hasta PosicionEliminar Con Paso 1 Hacer
		Escribir "Posición ",columna+1," Competidor ",matriz1(columna,1)," Puntos: ",matriz1(columna,0);
	FinPara
FinSubProceso

SubProceso descalificarPart(matriz Por Referencia,PosicionEliminar Por Referencia,matriz1,RondaActual)
	Definir Eliminar,i Como Entero;
	Para i<-0 Hasta 1 Con Paso 1 Hacer
		//se repite dos veces porque se eliminan dos participantes
		Eliminar=matriz1(PosicionEliminar,1);
		matriz(RondaActual+1,Eliminar-1)=-1;
		PosicionEliminar=PosicionEliminar-1;
		//con eliminar se va quitando la utlima posicion que va quedando por eso se resta UNO
	FinPara
FinSubProceso

SubProceso mostrarRondaBuscada(CantPart,matriz,RondaBuscada)
	Definir columna Como Entero;
	Para columna<-0 Hasta CantPart-1 Con Paso 1 Hacer
		Escribir "P",columna+1,"   ";Sin Saltar
	FinPara
	Escribir "";
	Para columna<-0 Hasta CantPart-1 Con Paso 1 Hacer
		//Se repite mucho codigo por la variacion de los digitos >=10
		Si columna>=9 Entonces
			Si matriz(RondaBuscada-1,columna)<10 Entonces
				Si matriz(RondaBuscada-1,columna)==-1 Entonces
					Escribir "PE    ";Sin Saltar
				SiNo
					Escribir matriz(RondaBuscada-1,columna),"     ";Sin Saltar
				FinSi
			SiNo
				Escribir matriz(RondaBuscada-1,columna),"    ";Sin Saltar
			FinSi
		SiNo
			Si matriz(RondaBuscada-1,columna)<10 Entonces
				Si matriz(RondaBuscada-1,columna)==-1 Entonces
					Escribir "PE   ";Sin Saltar
				SiNo
					Escribir matriz(RondaBuscada-1,columna),"    ";Sin Saltar
				FinSi
			SiNo
				Escribir matriz(RondaBuscada-1,columna),"   ";Sin Saltar
			FinSi
		FinSi
	FinPara
FinSubProceso

SubProceso mostrarMatriz(CantPart,CantRondas,matriz)
	Definir fila,columna Como Entero;
	Escribir "-------------------------------------------------------";
	Escribir "                Comité de deportes";
	Escribir "           Módulo control de puntuaciones";
	Escribir "            Resultados de la competencia";
	Escribir "-------------------------------------------------------";
	Para columna<-0 Hasta CantPart-1 Con Paso 1 Hacer
		Escribir "P",columna+1,"   ";Sin Saltar
	FinPara
	Escribir "";
	Escribir "-------------------------------------------------------";
	Para fila<-0 Hasta CantRondas-1 Con Paso 1 Hacer
		Para columna<-0 Hasta CantPart-1 Con Paso 1 Hacer
		Si columna>=9 Entonces
			Si matriz(fila,columna)<10 Entonces
				Si matriz(fila,columna)==-1 Entonces
					Escribir "PE    ";Sin Saltar
				SiNo
					Escribir matriz(fila,columna),"     ";Sin Saltar
				FinSi
			SiNo
				Escribir matriz(fila,columna),"    ";Sin Saltar
			FinSi
		SiNo
			Si matriz(fila,columna)<10 Entonces
				Si matriz(fila,columna)==-1 Entonces
					Escribir "PE   ";Sin Saltar
				SiNo
					Escribir matriz(fila,columna),"    ";Sin Saltar
				FinSi
			SiNo
				Escribir matriz(fila,columna),"   ";Sin Saltar
			FinSi
		FinSi
	FinPara
		Escribir "";
	FinPara
	Escribir "-------------------------------------------------------";
FinSubProceso

SubProceso mostrarResultados(cantRondas,matriz1,matriz)
	Definir i,suma,minimo,maximo,fila Como Entero;
	Definir promedio Como Real;
	//se repite tres veces para dar los primeros tres lugares
	Para i<-0 Hasta 2 Con Paso 1 Hacer
		Escribir "-----------------------------------------------";
		Escribir " Lugar    Ronda    Participante    Puntuacion";
		suma=0;
		minimo=10;
		maximo=0;
		Escribir "-----------------------------------------------";
		Para fila<-0 Hasta cantRondas-1 Con Paso 1 Hacer
			Escribir "   ",i+1,"        ",fila+1,"           ",matriz1(i,1),"              ",matriz(fila,matriz1(i,1)-1);
			//se acumulan las puntuaciones
			suma=suma+matriz(fila,matriz1(i,1)-1);
			Si minimo>matriz(fila,matriz1(i,1)-1) Entonces
				minimo=matriz(fila,matriz1(i,1)-1);
			FinSi
			Si maximo<matriz(fila,matriz1(i,1)-1) Entonces
				maximo=matriz(fila,matriz1(i,1)-1);
			FinSi
		FinPara
		promedio=suma/cantRondas;
		Escribir "-----------------------------------------------";
		Escribir "  Promedio de puntuación = ",promedio;
		Escribir "  Puntuacion más baja = ",minimo;
		Escribir "  Puntuacion más alta = ",maximo;
		Escribir "-----------------------------------------------";
	FinPara
FinSubProceso
	