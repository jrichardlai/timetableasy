$.fullCalendar.setDefaults({
monthNames:
['Janvier','Février','Mars','Avril','Mai','Juin','Juillet','Août','Septembre','Octobre','Novembre','Décembre'],
monthNamesShort:
['janv.','févr.','mars','avr.','mai','juin','juil.','août','sept.','oct.','nov.','déc.'],
dayNames: ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'],
dayNamesShort: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],
buttonText: {
	prev: '&nbsp;&#9668;&nbsp;',
	next: '&nbsp;&#9658;&nbsp;',
	prevYear: '&nbsp;&lt;&lt;&nbsp;',
	nextYear: '&nbsp;&gt;&gt;&nbsp;',
	today: 'aujourd\'hui',
	month: 'mois',
	week: 'semaine',
	day: 'jour'
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