# Progetto DAF

##### Team Sugos

### Introduzione
Dopo aver avviato la tecnologia di Docker-compose con il comando:
```
sudo docker-compose up
```
ora tutti i containers sono pronti all'uso.

### Componenti operativi del docker compose (containers)
1. Script Python
2. Statsd
3. OpenTSDB
4. Grafana
5. WebApp

#### 1. Script Python
È uno script che manda dati allo Statsd.

#### 2. Statsd
Sta in ascolto sulla porta 8125 per ricevere i dati da inviare al servizio OpenTSDB via protocollo UDP.

#### 3. OpenTSDB
Sta in ascolto sulla porta 4242 per ricevere i dati da inviare al servizio Grafana tramite il protocollo TCP.

#### 4. Grafana
All'avvio del container verrà caricato il file di configurazione edit tramite uno script bash, e in successione ascoltando sulla porta 3000 verranno ricevuti i dati della tabella.

#### 5. WebApp
Prima di poter usufruire della WebApp si eseguiranno i seguenti passaggi:
* lanciare uno script node che  si collega all'api di grafana per generare una chiave con soli permessi di visualizzazione;
* grafana manda allo script la chiave di autenticazione appena creata;
* lo script manderà a sua volta la chiave alla WebApp;
* la WebApp utilizzerà la chiave per l'autenticazione dell'identità dell'utente che cercherà di accedere ai dati interni e se il token sarà giusto si potrà scaricare dell'immagine del grafico di grafana.

A questo punto la WebApp sarà pienamente funzionante.

### Partecipanti del gruppo:
* Nicola Salsotto
* Simone Cirino
* Giovanni Rizzi
* Fabrizio Sandri
* Antonio Radessich
