# Sugos Progetto DAF - OpenTSDB-Grafana

### Descrizione
Sugos OpenTSDB-Grafana è una docker-compose sviluppata dal team *Sugos* con
lo scopo di far risparmiare allo sviluppatore tempo utile che andrebbe sprecato
per l' installazione di tutte le componenti necessarie.
Attraverso la tecnologia docker-compose è possibile eseguire più framework
utilizzando un unico comando.

---

### Requisiti di sistema
- docker

---

### Avvio
Per lanciare la docker-compose prima di tutto assicuratevi di avere avviato
correttamente  il servizio *docker* e successivamente eseguite all' interno
della directory contente il file docker-compose.yml il seguente comando:
```
docker-compose up
```
Questo comando permette di automatizzare l'esecuzione dei vari servizi.

---

### Componenti operativi utili per la docker compose
1. Script Python
2. Statsd
3. OpenTSDB
4. Grafana
5. WebApp

#### 1. Script Python
È uno script che manda dati allo Statsd. Quello fatto di esempio è un' semplice script python che spedisce punti ogni 5 secondi, per poi formare una sinusoide.

#### 2. Statsd
Sta in ascolto sulla porta 8125 per ricevere i dati da inviare al servizio OpenTSDB via protocollo UDP. Riceve i dati dallo script python.

#### 3. OpenTSDB
È un servizio di accumulo informazioni in grado di gestire grandi quantità di dati. Per estrarre i dati da esso, basterà accedervi sulla porta 4242.

#### 4. Grafana
Grafana è la parte principale del progetto e permette di gestire varie tipologie di grafici. Grafana è già stato preconfigurato per estrarre i dati da OpenTSDB sulla porta 4242.

#### 5. WebApp
Prima di poter usufruire della WebApp si eseguiranno i seguenti passaggi:
* lanciare uno script node che  si collega all'api di grafana per generare una chiave con soli permessi di visualizzazione;
* grafana manda allo script la chiave di autenticazione appena creata;
* lo script manderà a sua volta la chiave alla WebApp;
* la WebApp utilizzerà la chiave per l'autenticazione dell'identità dell'utente che cercherà di accedere ai dati interni e se il token sarà giusto si potrà scaricare dell'immagine del grafico di grafana.


### Partecipanti del gruppo:
* Nicola Salsotto | https://github.com/NicoVarg99
* Simone Cirino | https://github.com/Cirino99
* Giovanni Rizzi | https://github.com/giovannirizzi
* Fabrizio Sandri | https://github.com/FabrizioSandri/DockerCompose
* Antonio Radessich | https://github.com/AntoRade
