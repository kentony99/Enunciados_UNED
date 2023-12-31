Algoritmo Pr4
	Definir i,j,n,empleadoUsuario,empleado,salarioxHora Como Entero;
	Definir menu,menuInterno,horasRegulares,horasExtra,horasDobles Como Entero;
	Definir matrizPrincipal,categoriaEmple,categoriaPrecio Como Entero;
	Definir EXTRA,DOBLE,matrizSalarios,totalSemanal,totalEmpleado Como Real;
	Definir diasSemana Como Cadena;
	Definir montoRegular,montoExtra,montoDoble,salarioDiario Como Real;

	Definir op1,op2,op3 Como Logico;
	
	totalSemanal=0;
	op1=Falso;
	op2=Falso;
	op3=Falso;
	
	Repetir
		Escribir "Digite la cantidad de empleados:";
		Leer n;
		Si n<=0 Entonces
			Escribir "Debe ser un número mayor que cero";
		FinSi
	Hasta Que n>0
	
	Dimension matrizPrincipal[n,5];
	Dimension categoriaEmple[n];
	Dimension categoriaPrecio[4];
	Dimension matrizSalarios[n,8];
	Dimension diasSemana[5];
	
	diasSemana[0]="Lunes      ";
	diasSemana[1]="Martes     ";
	diasSemana[2]="Miércoles  ";
	diasSemana[3]="Jueves     ";
	diasSemana[4]="Viernes    ";

	iniciarMatrizPrin(n,matrizPrincipal);

	Repetir
		Escribir "--------------------------------------------------------------------";
		Escribir "                   M E N U   P R I N C I P A L";
		Escribir "--------------------------------------------------------------------";
		Escribir "Digite un número de la siguientes opciones:";
		Escribir " 1. Inicialización de matriz de horas laboradas";
		Escribir " 2. Inicialización de categorías por empleado";
		Escribir " 3. Inicialización de precio por hora de cada categoría";
		Escribir " 4. Reporte de salarios por empleado";
		Escribir " 5. Reporte de salarios de un empleado especific";
		Escribir " 6. Reporte general de salarios";
		Escribir " 7. Salir del menú";
		Escribir "";
		Escribir "Opción: " Sin Saltar;
		Leer menu;
		Escribir "";
		
		
		Segun menu Hacer
			1:
				opcionUno(n,matrizPrincipal,op1);
			2:
				opcionDos(n,categoriaEmple,op2);
			3:
				opcionTres(n,categoriaPrecio,op3,matrizPrincipal,matrizSalarios,categoriaEmple,categoriaPrecio,totalSemanal);
			4:
				opcionCuatro(n,op1,op2,op3,matrizPrincipal,matrizSalarios,totalSemanal);
			5:
				opcionCinco(n,op1,op2,op3,matrizPrincipal,matrizSalarios,categoriaEmple,categoriaPrecio,diasSemana);
			6:
				opcionSeis(n,op1,op2,op3,matrizSalarios,totalSemanal);
			7:
				Escribir "Saliendo del programa";
			De Otro Modo:
				Escribir "Opción Invalida. Digite <Enter> para continuar";
				Esperar Tecla;
		FinSegun
		Limpiar Pantalla;
	Hasta Que menu=7
FinAlgoritmo


//------------Subprocesos------------

SubProceso iniciarMatrizPrin(n,matriz)
	Definir i,j Como Entero;
	Para i<-0 Hasta n-1 Con Paso 1 Hacer 
		Para j<-0 Hasta 4 Con Paso 1 Hacer
			matriz[i,j]=AZAR(13);
		FinPara
	FinPara
FinSubProceso


SubProceso opcionUno(n,matriz,op1 Por Referencia)
	Definir i,j Como Entero;
	Escribir "- - - - - - - - - - - - - - - - - - - - - - - - ";
	Escribir "  Reporte de horas laboradas por los empleados";
	Escribir "- - - - - - - - - - - - - - - - - - - - - - - - ";
	Escribir "    Empleado   Lun   Mar   Mie   Jue   Vie";
	Para i<-0 Hasta n-1 Con Paso 1 Hacer 
		Escribir "        ",i+1,"    " Sin Saltar;
		Para j<-0 Hasta 4 Con Paso 1 Hacer
			Segun Longitud(ConvertirATexto(matriz[i,j])) Hacer //Con esto alineamos la matriz
				1:
					Escribir "   ",matriz[i,j],"  " Sin Saltar;
				2:
					Escribir "  ",matriz[i,j],"  " Sin Saltar;
			FinSegun
		FinPara
		Escribir "";
	FinPara
	Escribir "- - - - - - - - - - - - - - - - - - - - - - - - ";
	Escribir "";
	Escribir "Presione <ENTER> para continuar";
	Esperar Tecla;
	op1=Verdadero;
FinSubProceso

SubProceso opcionDos(n,vector,op2 Por Referencia)
	Definir i,j Como Entero;
	Si op2=Falso Entonces
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - ";
		Para i<-0 Hasta n-1 Con Paso 1 Hacer
			vector[i]=AZAR(4)+1;
			Escribir "El empleado ",i+1," tiene asignada la categoría ",vector[i];
		FinPara
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - ";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;
		op2=Verdadero;
	SiNo
		Escribir "";
		Escribir "Vector ya inicializado, este el reporte";
		Escribir "";
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - ";
		Para i<-0 Hasta n-1 Con Paso 1 Hacer
			Escribir "El empleado ",i+1," tiene asignada la categoría ",vector[i];
		FinPara
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - ";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;
	FinSi
FinSubProceso



SubProceso opcionTres(n,vector,op3 Por Referencia,matrizP,matrizS,vectorC,vectorP,totalS Por Referencia)
	Definir i,j,menuInterno,horasRegulares,horasExtra,horasDobles Como Entero;
	Definir EXTRA,DOBLE,totalEmpleado,salarioDiario Como Real;
	EXTRA=1.5;
	DOBLE=2;
	totalEmpleado=0;
	salarioDiario=0;
	horasDobles=0;
	
	Si op3=Falso Entonces
		Repetir
			Escribir "¿Cómo desea hacer el registro?";
			Escribir " 1. Automático";
			Escribir " 2. Manual";
			Leer menuInterno;
			Si menuInterno<>1 Y menuInterno<>2 Entonces
				Escribir "Opción no válida, intente de nuevo";
			FinSi
		Hasta Que menuInterno=1 O menuInterno=2
		Segun menuInterno Hacer
			1:
				Para i<-0 Hasta 3 Con Paso 1 Hacer
					vector[i]=AZAR(3001)+3000;
				FinPara
				Escribir "Vector iniciada de manera correcta, presione <ENTER> para continuar";
				Esperar Tecla;
			2:
				Para i<-0 Hasta 3 Con Paso 1 Hacer
					Repetir
						Escribir "Digite el precio de la hora para la categoría ",i+1;
						Leer vector[i];
						Si vector[i]<3000 O vector[i]>6000 Entonces
							Escribir "Número inválido, deben ser números de 3000 a 6000";
						FinSi
					Hasta Que vector[i]>=3000 Y vector[i]<=6000
				FinPara
				Escribir "Presione <ENTER> para continuar";
				Esperar Tecla;
		FinSegun
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "         Reporte de salarios por categoría";
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Escribir "Categoría ",i+1," se le asignó un valor por hora de ",vector[i];
		FinPara
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;
		op3=Verdadero;
		
		Para i<-0 Hasta n-1 Con Paso 1 Hacer
			Para j<-0 Hasta 7 Con Paso 1 Hacer
				Segun j Hacer
					0:
						matrizS[i,0]=i+1;
					1:
						matrizS[i,j]=vectorP[vectorC[i]-1];
					2,3,4,5,6:
						Si matrizP[i,j-2]>8 Entonces
							horasRegulares=8;
							horasExtra=matrizP[i,j-2]-8;
						SiNo
							horasRegulares=matrizP[i,j-2];
							horasExtra=0;
						FinSi
						Si j<6 Entonces
							matrizS[i,j]=matrizS[i,1]*(horasRegulares+horasExtra*EXTRA);
						SiNo
							matrizS[i,j]=matrizS[i,1]*matrizP[i,j-2]*DOBLE;
						FinSi
						
						totalEmpleado=totalEmpleado+matrizS[i,j];
					7:
						matrizS[i,7]=totalEmpleado;
						totalS=totalS+matrizS[i,7];
						totalEmpleado=0;
				FinSegun
			FinPara
		FinPara
	SiNo
		Escribir "";
		Escribir "Vector ya inicializado, este el reporte";
		Escribir "";
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "         Reporte de salarios por categoría";
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Escribir "Categoría ",i+1," se le asignó un valor por hora de ",vector[i];
		FinPara
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;
	FinSi
FinSubProceso



SubProceso opcionCuatro(n,op1,op2,op3,matrizP,matrizS,totalS)
	Definir i,j Como Entero;
	Si op1 Y op2 Y op3 Entonces
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - ";
		Escribir "  Reporte de horas laboradas por los empleados";
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - ";
		Escribir "    Empleado   Lun   Mar   Mie   Jue   Vie";
		Para i<-0 Hasta n-1 Con Paso 1 Hacer 
			Escribir "        ",i+1,"    " Sin Saltar;
			Para j<-0 Hasta 4 Con Paso 1 Hacer
				Segun Longitud(ConvertirATexto(matrizP[i,j])) Hacer //Con esto alineamos la matriz
					1:
						Escribir "   ",matrizP[i,j],"  " Sin Saltar;
					2:
						Escribir "  ",matrizP[i,j],"  " Sin Saltar;
				FinSegun
			FinPara
			Escribir "";
		FinPara
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ";
		Escribir "Empleado    SalxHora      Lun        Mar        Mie        Jue        Vie       Total";
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ";
		Para i<-0 Hasta n-1 Con Paso 1 Hacer
			Para j<-0 Hasta 7 Con Paso 1 Hacer
				Segun j Hacer
					0:
						Escribir "    ",matrizS[i,j],"         "; Sin Saltar
					1:
						Escribir matrizS[i,1],"    "; Sin Saltar
					2,3,4,5,6:
						Segun Longitud(ConvertirATexto(matrizS[i,j])) Hacer
							1:
								Escribir "       ",matrizS[i,j],"   "; Sin Saltar
							2:
								Escribir "      ",matrizS[i,j],"   "; Sin Saltar
							3:
								Escribir "     ",matrizS[i,j],"   "; Sin Saltar
							4:
								Escribir "    ",matrizS[i,j],"   "; Sin Saltar
							5:
								Escribir "   ",matrizS[i,j],"   "; Sin Saltar
							6: 
								Escribir "  ",matrizS[i,j],"   "; Sin Saltar
							7:
								Escribir " ",matrizS[i,j],"   "; Sin Saltar
							8:
								Escribir "",matrizS[i,j],"   "; Sin Saltar
						FinSegun
					7:
						Escribir " ",matrizS[i,7];
				FinSegun
			FinPara
		FinPara
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ";
		Escribir "Monto total de Salarios                                                      ",totalS;
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;
	SiNo
		Si op1=Falso Entonces
			Si op2=Falso Entonces
				Si op3=Falso Entonces
					Escribir "Debe ejecutar primero las opciones 1, 2 y 3";
				SiNo
					Escribir "Debe ejecutar primero las opciones 1 y 2";
				FinSi
			SiNo
				Si op3=Falso Entonces
					Escribir "Debe ejecutar primero las opciones 1 y 3";
				SiNo
					Escribir "Debe ejecutar primero la opción 1";
				FinSi
			FinSi
		SiNo
			Si op2=Falso Entonces
				Si op3=Falso Entonces
					Escribir "Debe ejecutar primero las opciones 2 y 3";
				SiNo
					Escribir "Debe ejecutar primero la opción 2";
				FinSi
			SiNo
				Escribir "Debe ejecutar primero la opción 3";
			FinSi
		FinSi
		Escribir "";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;
	FinSi
FinSubProceso

SubProceso opcionCinco(n,op1,op2,op3,matrizP,matrizS,vectorC,vectorP,vectorD)
	
	Definir i,empleadoUsuario,empleado,salarioxHora Como Entero;
	Definir montoRegular,montoExtra,montoDoble,salarioDiario Como Real;
	Definir horasRegulares,horasExtra,horasDobles Como Entero;
	Si op1 Y op2 Y op3 Entonces
		Repetir
			Escribir "¿Digite el número de empleado para observar el reporte:"Sin Saltar;
			Leer empleadoUsuario;
			Si empleadoUsuario<=0 O empleadoUsuario>n Entonces
				Escribir "El empleado no está dentro del rango";
			FinSi
		Hasta Que empleadoUsuario>0 Y empleadoUsuario<=n
		empleado=empleadoUsuario-1;
		salarioxHora=vectorP[vectorC[empleadoUsuario]-1];
		Escribir "";
		Escribir "                                Reporte de salarios semanal  ";
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "Número de empleado: ",empleadoUsuario;
		Escribir "Salario por hora: ",salarioxHora;
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "Día        HorasReg   MontoHR    HorasExt   MontoHE    HorasDob   MontoHD    Salario Diario";
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Para i<-0 Hasta 4 Con Paso 1 Hacer
			Si matrizP[empleado,i]>8 Entonces
				horasRegulares=8;
				horasExtra=matrizP[empleado,i]-8;
				horasDobles=0;
			SiNo
				horasRegulares=matrizP[empleado,i];
				horasExtra=0;
				horasDobles=0;
			FinSi
			Si i=4 Entonces
				horasRegulares=0;
				horasExtra=0;
				horasDobles=matrizP[empleado,i];
			FinSi
			montoRegular=horasRegulares*salarioxHora;
			montoExtra=horasExtra*salarioxHora;
			montoDoble=horasDobles*salarioxHora;
			salarioDiario=montoRegular+montoExtra+montoDoble;
			Escribir vectorD[i],"   ",horasRegulares,"    "Sin Saltar;
			Segun Longitud(ConvertirATexto(montoRegular)) Hacer
				1:
					Escribir "        ",montoRegular,"     "; Sin Saltar
				2:
					Escribir "       ",montoRegular,"     "; Sin Saltar
				3:
					Escribir "      ",montoRegular,"     "; Sin Saltar
				4:
					Escribir "     ",montoRegular,"     "; Sin Saltar
				5:
					Escribir "    ",montoRegular,"     "; Sin Saltar
				6: 
					Escribir "   ",montoRegular,"     "; Sin Saltar
				7:
					Escribir "  ",montoRegular,"     "; Sin Saltar
			FinSegun
			Escribir "   ",horasExtra,"    ", Sin Saltar;
			Segun Longitud(ConvertirATexto(montoExtra)) Hacer
				1:
					Escribir "        ",montoExtra,"     "; Sin Saltar
				2:
					Escribir "       ",montoExtra,"     "; Sin Saltar
				3:
					Escribir "      ",montoExtra,"     "; Sin Saltar
				4:
					Escribir "     ",montoExtra,"     "; Sin Saltar
				5:
					Escribir "    ",montoExtra,"     "; Sin Saltar
				6: 
					Escribir "   ",montoExtra,"     "; Sin Saltar
				7:
					Escribir "  ",montoExtra,"     "; Sin Saltar
			FinSegun
			Escribir "    ",horasDobles,"  " Sin Saltar;
			Segun Longitud(ConvertirATexto(montoDoble)) Hacer
				1:
					Escribir "         ",montoDoble,"     "; Sin Saltar
				2:
					Escribir "        ",montoDoble,"     "; Sin Saltar
				3:
					Escribir "       ",montoDoble,"     "; Sin Saltar
				4:
					Escribir "      ",montoDoble,"     "; Sin Saltar
				5:
					Escribir "     ",montoDoble,"     "; Sin Saltar
				6: 
					Escribir "    ",montoDoble,"     "; Sin Saltar
				7:
					Escribir "   ",montoDoble,"     "; Sin Saltar
			FinSegun
			Escribir "   ",salarioDiario;
		FinPara
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "Monto total semanal para el empleado: ",empleadoUsuario," es de                                  ",matrizS[empleado,7];
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;
	SiNo
		Si op1=Falso Entonces
			Si op2=Falso Entonces
				Si op3=Falso Entonces
					Escribir "Debe ejecutar primero las opciones 1, 2 y 3";
				SiNo
					Escribir "Debe ejecutar primero las opciones 1 y 2";
				FinSi
			SiNo
				Si op3=Falso Entonces
					Escribir "Debe ejecutar primero las opciones 1 y 3";
				SiNo
					Escribir "Debe ejecutar primero la opción 1";
				FinSi
			FinSi
		SiNo
			Si op2=Falso Entonces
				Si op3=Falso Entonces
					Escribir "Debe ejecutar primero las opciones 2 y 3";
				SiNo
					Escribir "Debe ejecutar primero la opción 2";
				FinSi
			SiNo
				Escribir "Debe ejecutar primero la opción 3";
			FinSi
		FinSi
		Escribir "";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;
	FinSi
FinSubProceso

SubProceso opcionSeis(n,op1,op2,op3,matrizS,totalS)
	Definir i Como Entero;
	Definir ccss,asoSolidarista,bancoPopular Como Real;
	
	Si op1 Y op2 Y op3 Entonces
		ccss=totalS*0.3;
		asoSolidarista=totalS*0.03;
		bancoPopular=totalS*0.01;
		Escribir "                              Reporte general de salarios  ";
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "   Empleado            Salario Semanal";
		Para i<-0 Hasta n-1 Con Paso 1 Hacer
			Escribir "       ",i+1,"                   ",matrizS[i,7];
		FinPara
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "Total Semanal por los ",n," empleados:        ",totalS;
		Escribir "CCSS                                      ",ccss;
		Escribir "Asociación solidarista                     ",asoSolidarista;
		Escribir "Banco Popular                               ",bancoPopular;
		Escribir "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
		Escribir "";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;

	SiNo
		Si op1=Falso Entonces
			Si op2=Falso Entonces
				Si op3=Falso Entonces
					Escribir "Debe ejecutar primero las opciones 1, 2 y 3";
				SiNo
					Escribir "Debe ejecutar primero las opciones 1 y 2";
				FinSi
			SiNo
				Si op3=Falso Entonces
					Escribir "Debe ejecutar primero las opciones 1 y 3";
				SiNo
					Escribir "Debe ejecutar primero la opción 1";
				FinSi
			FinSi
		SiNo
			Si op2=Falso Entonces
				Si op3=Falso Entonces
					Escribir "Debe ejecutar primero las opciones 2 y 3";
				SiNo
					Escribir "Debe ejecutar primero la opción 2";
				FinSi
			SiNo
				Escribir "Debe ejecutar primero la opción 3";
			FinSi
		FinSi
		Escribir "";
		Escribir "Presione <ENTER> para continuar";
		Esperar Tecla;
	FinSi
FinSubProceso
	