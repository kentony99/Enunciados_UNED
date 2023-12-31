Funcion neto <- CalcularNeto(salarioBruto,deduccion)
	Definir neto Como Real;
	neto=salarioBruto-deduccion;
FinFuncion

Funcion deduccion <- CalcularDeduccion(salarioBruto)
	Definir deduccion Como Real;
	deduccion=salarioBruto*0.055+salarioBruto*0.035+salarioBruto*0.01;
FinFuncion

Funcion salarioBruto <- CalcularSalBruto(horasOrdinarias,horasExtra)
	Definir salarioBruto Como Real;
	salarioBruto=(horasOrdinarias * 5000) + (horasExtra * 1.5 * 5000);
FinFuncion

Algoritmo proyecto4
	Definir matrizEmpresa Como Entero;
	Definir salariosBrutos Como Real;
	Definir deducciones Como Real;
	Definir salariosNetos Como Real;
	Definir opcion Como Entero;
	Definir salarioBruto,deduccion,neto Como Real;
	Dimension matrizEmpresa[10,5];
	Dimension salariosBrutos[10];
	Dimension deducciones[10];
	Dimension salariosNetos[10];
	
	
	Repetir
		Escribir "--------------------------------";
		Escribir " 1. Inicializar datos";
		Escribir " 2. Generar planilla";
		Escribir " 3. Reporte planilla";
		Escribir " 4. Salir";
		Escribir "--------------------------------";
		Leer opcion;
		Segun opcion Hacer
			1:
				OpcionUno(matrizEmpresa);
			2:
				OpcionDos(matrizEmpresa,salariosBrutos,deducciones,salariosNetos);
			3:
				OpcionTres(salariosBrutos,deducciones,salariosNetos);
			De Otro Modo:
				Escribir "Debe ser una opción valida [1-4]";
		FinSegun
	Hasta Que opcion=4
	
	
FinAlgoritmo

SubProceso OpcionUno (matrizEmpresa)
	CargarHoras(matrizEmpresa);
	ImprimirMatriz(matrizEmpresa);
	Escribir "Las horas fueron cargadas de forma correcta";
	Escribir "Presione una tecla para continuar";
	Esperar Tecla;
FinSubProceso

SubProceso OpcionDos(matrizEmpresa,salariosBrutos,deducciones,salariosNetos)
	Escribir "Llenando datos espere un momento";
	//Esperar 2 Segundos;
	Definir i Como Entero;
	Escribir "Colaborador    SalBruto     Deduccion     SalNeto";
	Para i<-0 Hasta 9 Con Paso 1 Hacer
		salariosBrutos[i]=0;
		deducciones[i]=0;
		salariosNetos[i]=0;
	FinPara
	GenerarPlanilla(matrizEmpresa,salariosBrutos,deducciones,salariosNetos);
	Escribir "Los planilla fue generada de forma correcta";
	Escribir "Presione una tecla para continuar";
	Esperar Tecla;
FinSubProceso

SubProceso OpcionTres(salariosBrutos,deducciones,salariosNetos)
	ReportePlanilla(salariosBrutos,deducciones,salariosNetos);
	Escribir "Presione una tecla para continuar";
	Esperar Tecla;
FinSubProceso

SubProceso CargarHoras (matrizEmpresa)
	Definir i,j Como Entero;
	Para i<-0 Hasta 9 Con Paso 1 Hacer
		Para j<-0 Hasta 4 Con Paso 1 Hacer
			matrizEmpresa[i,j]=Aleatorio(6,12);
		FinPara
	FinPara
	matrizEmpresa[0,0] = 10;
	matrizEmpresa[0,1] = 10;
	matrizEmpresa[0,2] = 8;
	matrizEmpresa[0,3] = 6;
	matrizEmpresa[0,4] = 7;
	
	matrizEmpresa[1,0] = 10;
	matrizEmpresa[1,1] = 12;
	matrizEmpresa[1,2] = 6;
	matrizEmpresa[1,3] = 7;
	matrizEmpresa[1,4] = 6;
	
	matrizEmpresa[2,0] = 12;
	matrizEmpresa[2,0] = 9;
	matrizEmpresa[2,2] = 11;
	matrizEmpresa[2,3] = 8;
	matrizEmpresa[2,4] = 12;
	
	matrizEmpresa[3,0] = 6;
	matrizEmpresa[3,1] = 8;
	matrizEmpresa[3,2] = 7;
	matrizEmpresa[3,3] = 10;
	matrizEmpresa[3,4] = 10;
	
	matrizEmpresa[4,0] = 6;
	matrizEmpresa[4,1] = 8;
	matrizEmpresa[4,2] = 8;
	matrizEmpresa[4,3] = 10;
	matrizEmpresa[4,4] = 9;
	
	matrizEmpresa[5,0] = 11;
	matrizEmpresa[5,1] = 6;
	matrizEmpresa[5,2] = 9;
	matrizEmpresa[5,3] = 10;
	matrizEmpresa[5,4] = 8;
	
	matrizEmpresa[6,0] = 11;
	matrizEmpresa[6,1] = 9;
	matrizEmpresa[6,2] = 12;
	matrizEmpresa[6,3] = 9;
	matrizEmpresa[6,4] = 6;
	
	matrizEmpresa[7,0] = 6;
	matrizEmpresa[7,1] = 6;
	matrizEmpresa[7,2] = 10;
	matrizEmpresa[7,3] = 8;
	matrizEmpresa[7,4] = 10;
	
	matrizEmpresa[8,0] = 9;
	matrizEmpresa[8,1] = 8;
	matrizEmpresa[8,2] = 7;
	matrizEmpresa[8,3] = 9;
	matrizEmpresa[8,4] = 8;
	
	matrizEmpresa[9,0] = 9;
	matrizEmpresa[9,1] = 7;
	matrizEmpresa[9,2] = 8;
	matrizEmpresa[9,3] = 11;
	matrizEmpresa[9,4] = 7;
FinSubProceso

SubProceso ImprimirMatriz (matrizEmpresa)
	Definir i,j Como Entero;
	Escribir "Colaborador    L   Ma   Mi   J   V";
	Para i<-0 Hasta 9 Con Paso 1 Hacer
		Escribir "     ",i+1,"         ";Sin Saltar
		Para j<-0 Hasta 4 Con Paso 1 Hacer
			Escribir matrizEmpresa[i,j],"   ";Sin Saltar
		FinPara
		Escribir "";
	FinPara
FinSubProceso


SubProceso GenerarPlanilla(matrizEmpresa,salariosBrutos,deducciones,salariosNetos)
	Definir i,j Como Entero;
	Definir horasOrdinarias,horasExtra Como Entero;
	Para i<-0 Hasta 9 Con Paso 1 Hacer
		Para j<-0 Hasta 4 Con Paso 1 Hacer
			Si matrizEmpresa[i,j]>8 Entonces
				horasOrdinarias=8;
				horasExtra=matrizEmpresa[i,j]-8;
			SiNo
				horasOrdinarias=matrizEmpresa[i,j];
				horasExtra=0;
			FinSi
			salariosBrutos[i]=salariosBrutos[i]+CalcularSalBruto(horasOrdinarias,horasExtra);
		FinPara
		deducciones[i]=deducciones[i]+CalcularDeduccion(salariosBrutos[i]);
		salariosNetos[i]=salariosNetos[i]+CalcularNeto(salariosBrutos[i],deducciones[i]);
	FinPara
FinSubProceso

SubProceso ReportePlanilla(salariosBrutos,deducciones,salariosNetos)
	Definir i Como Entero;
	Escribir "Colaborador    SalBruto     Deduccion     SalNeto";
	Para i<-0 Hasta 9 Con Paso 1 Hacer
		Escribir "       ",i+1,"         ",Sin Saltar;
		Escribir salariosBrutos[i],"          ",deducciones[i],"         ",salariosNetos[i];
	FinPara
FinSubProceso