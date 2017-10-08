# Progetto DAF

###### Team Sugos

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
E' uno script che manda dati allo Statsd.

#### 2. Statsd
Sta in ascolto sulla porta 8125 per ricevere i dati da inviare al servizio OpenTSDB via protocollo UDP.

#### 3. OpenTSDB 4242
Sta in ascolto sulla porta 4242 per ricevere i dati da inviare al servizio Grafana tramite il protocollo TCP.

#### 4. Grafana
All'avvio del container verrà caricato il file di configurazione edit tramite uno script bash, e in successione ascoltando sulla porta 3000 verranno ricevuti i dati della tabella.

#### 5. WebApp
Prima di poter usufruire della WebApp si eseguiranno i seguenti passaggi:
* lanciare uno script node che  si collega all'api di grafana per creare un utente con soli permessi di visualizzazione;
* grafana manda allo script il token di autenticazione generato con la creazione dell'utente;
* lo script manderà a sua volta il token alla WebApp;
* la WebApp utilizzerà il token di autenticazione per la visualizzazione del grafico di Grafana.

A questo punto la WebApp sarà pienamente funzionante.

### Partecipanti:
* Nicola Salsotto
* Simone Cirino
* Giovanni Rizzi
* Fabrizio Sandri
* Antonio Radessich
