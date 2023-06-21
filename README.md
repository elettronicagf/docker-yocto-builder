### egf-docker

Egf docker raccoglie il dockerfile dei container docker su cui vengono compilate immagini yocto. Esso raccoglie inoltre gli script per compilare e d eseguire la macchina secondo la configurazione desiderata.

## Configurazione

Nella cartella scripts/ è contenuto il file egf-conf.sh in cui è possibile specificare le seguenti variabili:

| Variables              |   |
|------------------------|---|
| GIT_REPO_DOWNLOADS_URL |  URL API Google                              |
| NXP_MANIFEST_REPO      |  URL Repository manifesto dei layer NXP      |
| VERSIONE               |  Versione Yocto                              |
| BRANCH_NXP_VERSIONE    |  Branch repository manifesto NXP             |
| MANIFEST_NXP           |  XML Manifest NXP                            |
| PROGETTO               |  Nome locale del progetto                    |
| EGF_MANIFEST_REPO      |  Repository manifesto EGF                    |
| BRANCH_EGF_MANIFEST    |  Branch repository manifesto EGF             |
| MANIFEST_EGF           |  XML Manifest EGF                            |
| FTP_USER               |  EGF FTP User                                |
| FTP_PASS               |  EGF FTP Password                            |
| FTP_URL                |  EGF FTP URL                                 |
| DOCKER_IMAGE           |  Docker container name                       |
| MNT_DIR                |  Folder where to mount output                |
| PRG_DIR                |  Folder where to mount input and dowloads    |
| OUTPUT_SRC             |  Output folder complete path on host         |
| INPUT_SRC              |  Input  folder complete path on host         |
| DOWNLOADS_SRC          |  Downloads folder complete path on host      |
| OUTPUT_DEST            |  Output folder complete path on container    |
| INPUT_DEST             |  Input folder complete path on container     |
| DOWNLOADS_DEST         |  Downloads folder complete path on container |

## Compilare immagine docker 

Per la compilazione dell'immagine è sufficiente lanciare lo script :

<pre><code>
./docker_image_setup.sh
</code></pre>


Il comando lancia installazione dell'immagine ubuntu indicata nel dockerfile includendo i relativi pacchetti. Esclusi sono i layer di yocte sono installati su dischi della macchina locale e vengono montati sul container al momento della sua esecuzione.

Per clonare tutti i layer NXP ed EGF eseguire il comando aggiungendo il seguente flag.

<pre><code>
./docker_image_setup.sh --repo-setup
</code></pre>


## Eseguire docker e lanciare una compilazione 

Una volta compilata l'immagine docker e clonati sorgenti yocto è possibile eseguire il container e lanciare la compilazione bitbake dell'immagine.

Per eseguire il container:

<pre><code>
./docker_run.sh 
</code></pre>

Per compilare l'immagine il primo step è quello di eseguire il setup dei metadati dal nostro layer ai layer NXP.

<pre><code>
cd yocto-input/sources/meta-egf
./scripts/egf-setup.sh
</code></pre>

Una volta fatto ciò fare il setup dell'ambiente di build eseguendo lo script ./setup_build.sh in yocto-input.


<pre><code>
cd ../../
source setup_build.sh
</code></pre>

Questo ci porta direttamente nella cartella di build da cui possiamo ora eseguire il comando bitbake:

<pre><code>
bitbake "image-name"
</code></pre>


