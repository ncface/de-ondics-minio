# ScaleIT Platform-Sidecar "webcontent"

Mit diesem Sidecar können beliebige statische Inhalte
per http angeboten werden, z.B. App-Icons, Handbücher, 
etc.

Das Image ist auf Go-Basis aufgebaut und minimal (ca. 5 MB).
Deswegen ist auch keine /bin/sh oder so verfügbar im Container.

## Nutzung

Die statischen Dateien im Verzeichnis ./content ablegen

Dann 
    
    $ make build
    $ make up

Danch können die Dateien mit 

   $ curl http://localhost:xxxx/content/<datei>

aufgerufen werden.

## Credits

https://github.com/PierreZ/goStatic

## Autor

(C) 2019, Ondics GmbH



