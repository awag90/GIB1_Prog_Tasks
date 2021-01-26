/* Author : @Steffen Marz
 * Programm :  Spielesimulation
 * 
 * In der vorliegenden Spielesimulation bewegen sich verschiedene Akteure zufällig über die Spieleoberfläche. Es gibt verschiedene Klassen in der Spielesimulation:
 * Klasse Simulation - Start der Spielesimulation über den EclipseDialog Run As Java Application. Die Klasse Simulation verwaltet alle Akteure der Spielesimulation.
 * Klasse Actor - Jeder Teilnehmer der Spielesimulation ist vom Typ
 * Die Klasse Cruiser habe ich entfernt und Person, Businnes, Tester, Virus und Doc hinzugefügt. Die Funktion act() habe ich komplett entfernt und neu geschrieben, 
 * da mir die Vorgabe nicht gefallen hat und die Akteure so eine festgelegte und in Simulation anpassbare Zeit zu 75% ihre Richtung ändern.  
 * Die Tester haben die Aufgabe alle Personen zu testen. Die Docs sollen diese dann heilen. 
 * 
 * !!!! Tester und Docs können in dieser Simulation nicht erkranken!!!! 
 * 
 * Die roten Kreise sollen Hotspots darstellen, in denen sich Personen bei Kontakt infizieren. 
 * Businnes Leute haben die gleiche Funktion wie normale Leute, nur dass sie schneller laufen, da die arbeitende Bevölkerung meist mehr unterwegs ist.
 * 
 * 
 * 1. Erläutern Sie die Schlüsselwörter this und super anhand der vorhandenen Klassen.
 * Mit dem Schlüsselwort super kann man auf die Implementierung der Basisklasse zugreifen. Es behinhaltet also eine Referenz
 * auf die Mutterklasse. mit super() wird der Konstruktor der Superklasse aufgerunfen, mit super.y() wird eine Methode Y aufgerufen, und 
 * mit super.y  kann man auf ein spezielles Attribut zugreifen, welches den Namen a hat.
 * Analog erhält man mit this eine Referenz auf sich selbst. this lässt sich sinvoll im Konstruktor einer Klasse nutzen, um Parameter die übergeben werden
 * gleich benennen zu können.
 * 
 * 2. Erläutern Sie das Konzept der Vererbung anhand der Klassen Actor und Cruiser.
 * 	Crusier wurde durch Businnes etc ersetzt.
 *  In der Simulation wird durch eine Schleife die act() und display() funktion von Actor asugeführt. Diese wird jedoch
 * 	von den jeweiligen Subklassen wie Businnes oder Person überschrieben und so je nach Rolle (Person oder Businnes) unterschiedlich
 * 	ausgeführt. Ist in den Subklassen kein act() oder display() vorhanden, werden die der Mutterklasse ausgeführt.
 * 
 * 3. Erläutern Sie das Konzept der Polymorphie anhand der bestehenden Klassen.
 * Mit dem Konzept der Polymorphie lässt sich ein Array aus mehreren Objekten erzeugen. So enthält das Actor Array Objekte wie Virus, Tester, Doc und Person.
*/