Algoritmo proyecto2_KentonySL
	Definir identificacion,plazo,clientes,contador Como Entero;
	Definir i,cantidadClientes,j Como Entero;
	Definir historialCredi,papelesDia,capacidadPago,salir Como Caracter;
	Definir valorPropiedad,ingresoBruto,gastosMensuales Como Real;
	Definir salarioLibre,montoCredito,mensualidad Como Real;
	Definir montoPoliza,mensualFinal,comision Como Real;
	Definir avaluo,gastosNotariales,gastosFinales Como Real;
	Definir prima,totalPrestamos,totalCreditos Como Real;
	Definir totalComisiones,totalAvaluos,totalGastos Como Real;
	
	capacidadPago="";
	historialCredi="";
	papelesDia="";
	salir="";
	plazo=30;
	totalPrestamos=0;
	totalCreditos=0;
	totalComisiones=0;
	totalAvaluos=0;
	totalGastos=0;
	salarioLibre=0;
	montoCredito=0;
	mensualidad=0;
	montoPoliza=0;
	mensualFinal=0;
	comision=0;
	avaluo=0;
	gastosNotariales=0;
	gastosFinales=0;
	prima=0;
	i=0;									//Variable para el índice del vector clientes
	contador=0;
	cantidadClientes=0;
	j=1;									//Variable para el reporte de clientes
	Dimension clientes[50];
	Para contador<-0 Hasta 49 Con Paso 1 Hacer //Inicializo el vector de clientes
		clientes[i]=0;						
	FinPara
	
	
	Escribir " __^__                                      __^__";
	Escribir "( ___ )------------------------------------( ___ )";
	Escribir " | / |                                      | \ |";
	Escribir " | / |       Bienvenido al sistema para     | \ |";
	Escribir " | / |            crédito bancario          | \ |";
	Escribir " |___|                                      |___|";
	Escribir "(_____)------------------------------------(_____) ";
	Escribir "";
	Escribir "";
	Escribir "                            01000";
	Escribir "                            00010";
	Escribir "                      10011011101001010";
	Escribir "                   0000110001110111000100";
	Escribir "                  111001100 00010111101011";
	Escribir "                  11011   1111   011011011";
	Escribir "                  11011   1111    11011011";
	Escribir "                   01010110010";
	Escribir "                    1110101110110111010";
	Escribir "                     1010111011011101010";
	Escribir "                      1011101101110101011";
	Escribir "                             0111010101101";
	Escribir "                 011011011   1111   110111";
	Escribir "                 011011011   1111   110111";
	Escribir "                  111001100 00010111101011";
	Escribir "                   0000110001110111000100";
	Escribir "                     10011011101001010";
	Escribir "                            01000";
	Escribir "                            00010";
	Escribir "";
	Escribir "";
	Escribir "Digite cualquier tecla para iniciar sesión ";
	Esperar Tecla;
	Escribir "";
	Escribir "";
	Escribir "Cargando, espere un momento" Sin Saltar;
	Esperar 500 Milisegundos;
	Escribir "." Sin Saltar;
	Esperar 500 Milisegundos;
	Escribir "." Sin Saltar;
	Esperar 500 Milisegundos;
	Escribir "." Sin Saltar;
	Esperar 500 Milisegundos;
	
	Repetir
		Limpiar Pantalla;
		Escribir "Digite el número de identificación del cliente: ",Sin Saltar;
		Leer identificacion;
		
		Repetir
			Escribir "Digite su ingreso bruto",Sin Saltar;
			Leer ingresoBruto;
			Si ingresoBruto<=0 Entonces
				Escribir "Debe ser un valor mayor que cero";
			FinSi
		Hasta Que ingresoBruto>0
		
		Repetir
			Escribir "Digite el total de sus gastos mensuales",Sin Saltar;
			Leer gastosMensuales;
			Si gastosMensuales<=0 Entonces
				Escribir "Debe ser un valor mayor que cero";
			FinSi
		Hasta Que gastosMensuales>0
		
		Repetir
			Escribir "¿Cuál es el valor de la propiedad?",Sin Saltar;
			Leer valorPropiedad;
			Si valorPropiedad<=0 Entonces
				Escribir "Debe ser un valor mayor que cero";
			FinSi
		Hasta Que valorPropiedad>0
		
		salarioLibre=ingresoBruto-gastosMensuales;
		
		Si salarioLibre>=ingresoBruto*0.3 Entonces
			
			Repetir
				Escribir "¿El cliente cuenta con buen historial crediticio? (S/N)",Sin Saltar;
				Leer historialCredi;
			Hasta Que Mayusculas(historialCredi)=="S" O Mayusculas(historialCredi)=="N"
			
			Escribir "Se valida si cuenta con los siguientes documentos";
			Escribir "==================================================";
			Escribir "1. Constancia salarial o certificación de ingresos";
			Escribir "2. Copia de la escritura";
			Escribir "3. Plano catastral";
			Escribir "4. Copia de recibo de agua, luz o teléfono";
			Escribir "5. Presupuesto de construcción";
			Escribir "6. Permisos municipales";
			Escribir "7. Los papeles tienen menos de un mes";
			Escribir "==================================================";
			Escribir "";
			Repetir
				Escribir "¿Cuenta con los papeles anteriores? (S/N)",Sin Saltar;
				Leer papelesDia;
			Hasta Que Mayusculas(papelesDia)=="S" O Mayusculas(papelesDia)=="N"
			
			Si Mayusculas(papelesDia)=="S" Entonces
				Limpiar Pantalla;
				Si valorPropiedad<=100000000 Entonces
					montoCredito=redon(valorPropiedad*0.8);
				SiNo
					montoCredito=redon(valorPropiedad*0.7);
				FinSi
				mensualidad=redon(montoCredito*0.0085);
				montoPoliza=redon(montoCredito*0.0024);
				mensualFinal=redon(mensualidad+montoPoliza);
				comision=redon(montoCredito*0.01);
				avaluo=redon(valorPropiedad*0.003);
				gastosNotariales=redon(montoCredito*0.08);
				gastosFinales=redon(comision+avaluo+gastosNotariales);
				prima=redon(montoCredito*0.18);
				Escribir "                                                          Estudio de crédito";
				Escribir "=======================================================================================================================================";
				Escribir "Montos para realizar el estudio";
				Escribir "---------------------------------------------------------------------------------------------------------------------------------------";
				Escribir "Valor de propiedad...................................................... ",valorPropiedad;
				Escribir "Monto del crédito ...................................................... ",montoCredito;
				Escribir "=======================================================================================================================================";
				Escribir "Detalle de cálculos";
				Escribir "";
				Escribir "Mensualidad (M):            Mc * Pm .................................... ",montoCredito," * 0.0085 ----> ",mensualidad;
				Escribir "Póliza (P):                 Mc * Pp .................................... ",montoCredito," * 0.0024 ----> ",montoPoliza;
				Escribir "";
				Escribir "Total de la mensualidad:    M + P   .................................... ",mensualidad,"  + ",montoPoliza," ---> ",mensualFinal;
				Escribir "--------------------------------------------------------------------------------------------------------------------------------------";
				Escribir "Comisión (C):               Mc * Pc .................................... ",montoCredito," * 0.01 ----> ",comision;
				Escribir "Avalúo (A):                 Vp * Pa .................................... ",valorPropiedad," * 0.003 ----> ",avaluo;
				Escribir "Gastos notaeriales (Gn):    Mc * Pg .................................... ",montoCredito," * 0.08 ----> ",gastosNotariales;
				Escribir "";
				Escribir "Total de gastos:         C + A + Gn .................................... ",comision," + ",avaluo," + ",gastosNotariales," ----> ",gastosFinales;
				Escribir "";
				Escribir "Prima (P):                 Mc * Ppr .................................... ",montoCredito," * 0.18 ----> ",prima;
				Escribir "";
				Escribir "=======================================================================================================================================";
				Escribir "Mc = Monto de crédito , Pm = % de mensualidad , Pp = % de poliza , Pc = % de comisión , Vp = Valor propiedad ";
				Escribir "Pa = % avalúo , Pg = % gastos , Ppr = % prima";
				Escribir "";
				Escribir "";
				Escribir "=======================================================================================================================================";
				Escribir "El crédito solicitado por el cliente ",identificacion,", calificó y fue aprobado por el banco.";
				Escribir "=======================================================================================================================================";
				Escribir "Digite una tecla para ver los detalles del crédito";
				clientes[i]=identificacion;
				i=i+1;
				cantidadClientes=i;
				Esperar Tecla;
				
				Limpiar Pantalla;
				
				Escribir "                                Detalle del crédito";
				Escribir "===================================================================================";
				Escribir "Plazo                   ........................ ",plazo;
				Escribir "Valor de la propiedad   ........................ ",valorPropiedad;
				Escribir "Monto de financiamiento ........................ ",montoCredito;
				Escribir "Total de pago mensual   ........................ ",mensualFinal;
				Escribir "Monto de gastos         ........................ ",gastosFinales;
				Escribir "Monto de la prima       ........................ ",prima;
				
				totalPrestamos=totalPrestamos+valorPropiedad;
				totalCreditos=totalCreditos+montoCredito;
				totalComisiones=totalComisiones+comision;
				totalAvaluos=totalAvaluos+avaluo;
				totalGastos=totalGastos+gastosNotariales;
			SiNo
				Escribir "";
				Escribir "El trámite no puede continuar porque no se cuenta con toda la documentación completa";
			FinSi
			
		SiNo
			Escribir "";
			Escribir "El trámite no puede continuar porque el cliente no tiene capacidad de pago";
		FinSi
		
		Repetir
			Escribir "¿Desea procesar otro cliente? (S/N)";
			Leer salir;
		Hasta Que Mayusculas(salir)=="S" O Mayusculas(salir)=="N"
		
		
	Hasta Que Mayusculas(salir)=="N"
	Limpiar Pantalla;
	Escribir "===================================================================================";
	Escribir "                                 Reporte final";
	Escribir "===================================================================================";
	Escribir "Monto total de préstamos solicitados aprobabos ............ ",totalPrestamos;
	Escribir "Monto total de financiamientos aceptados       ............ ",totalCreditos;
	Escribir "Total de comisiones aprobadas                  ............ ",totalComisiones;
	Escribir "Total de avalúos                               ............ ",totalAvaluos;
	Escribir "Monto total de gastos notariales               ............ ",totalGastos;
	Escribir "===================================================================================";
	Escribir "                               Reporte de clientes";
	Escribir "===================================================================================";
	Escribir "Cliente                                                     Identificación";
	Mientras cantidadClientes>0 Hacer
		Escribir "   ",j,"                                                        ",clientes[j-1];
		cantidadClientes=cantidadClientes-1;
		j=j+1;
	FinMientras
	Escribir "===================================================================================";
	
FinAlgoritmo
