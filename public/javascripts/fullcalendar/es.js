$.fullCalendar.setDefaults({
monthNames:
['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
monthNamesShort:
['Ener.','Feb.','Marzo','Abr.','Mayo','Junio','Jul.','Agost.','Sept.','Oct.','Nov.','Dic.'],
dayNames: ['Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado'],
dayNamesShort: ['Lun', 'Mar', 'Mier', 'Jue', 'Vie', 'Sab', 'Dom'],
buttonText: {
	prev: '&nbsp;&#9668;&nbsp;',
	next: '&nbsp;&#9658;&nbsp;',
	prevYear: '&nbsp;&lt;&lt;&nbsp;',
	nextYear: '&nbsp;&gt;&gt;&nbsp;',
	today: 'Hoy',
	month: 'Mes',
	week: 'Semana',
	day: 'Día'
},
titleFormat: {
 	month: 'MMMM yyyy', // ex : Janvier 2010
 	week: "d[ MMMM][ yyyy]{ - d MMMM yyyy}", // ex : 10 — 16 Janvier 2010, semaine à cheval : 28 Décembre 2009 - 3 Janvier 2010
	// todo : ajouter le numéro de la semaine
 	day: 'dddd d MMMM yyyy' // ex : Jeudi 14 Janvier 2010
},
columnFormat: {
 	month: 'ddd', // Ven.
 	week: 'ddd d', // Ven. 15
	day: '' // affichage déja complet au niveau du 'titleFormat'
},
axisFormat: 'H:mm', // la demande de ferdinand.amoi : 15:00 (pour 15, simplement supprimer le ':mm'
timeFormat: {
	'': 'H:mm', // événements vue mensuelle.
	agenda: 'H:mm{ - H:mm}' // événements vue agenda
},
firstDay:0, // Lundi premier jour de la semaine 
});