# Robot Framework + GitLab CI/CD

## Over dit project

Dit project is opgezet als onderdeel van een praktische cursus **Robot Framework in combinatie met GitLab CI/CD**.

Het doel van de cursus is inzicht krijgen in het professioneel integreren van geautomatiseerde API-tests in een CI/CD-pipeline met GitLab.

De nadruk ligt op het begrijpen van de architectuur, configuratie en samenwerking tussen Robot Framework, Git, GitLab CI/CD en GitLab Runners.

## Gebruikte technologieën

- **Python** – programmeertaal voor de testautomatisering.
- **Robot Framework** – framework voor geautomatiseerde tests.
- **RequestsLibrary** – uitvoeren van HTTP/API-verzoeken.
- **Git** – versiebeheer.
- **GitLab** – repositorybeheer en CI/CD-pipelines.
- **GitLab CI/CD** – automatiseren van testuitvoeringen.
- **GitLab Runner** – uitvoeren van pipeline-jobs.
- **Docker** – containeromgeving voor pipeline-uitvoering.
- **JSONPlaceholder** – publieke test-API.

## Projectstructuur

```text
RF-API-GitLab/
│
├── tests/
│   └── api/
│       └── users.robot
│
├── resources/
│
├── results/
│
├── requirements.txt
├── .gitignore
├── .gitlab-ci.yml
└── README.md
```

## Lokale testuitvoering

De Robot Framework-tests kunnen lokaal worden uitgevoerd met:

```powershell
robot --outputdir results tests/api/users.robot
```

De testresultaten worden opgeslagen in de map `results`.

Robot Framework genereert standaard onder andere:

- `output.xml` – gestructureerde testresultaten.
- `log.html` – gedetailleerd technisch uitvoeringslog.
- `report.html` – overzicht van de testresultaten.

## Cursusoverzicht

### Module 1 – Projectopzet en Robot Framework

- Python virtual environment configureren.
- Robot Framework installeren.
- RequestsLibrary installeren.
- API-tests opzetten.
- Projectstructuur inrichten.
- Dependencies vastleggen in `requirements.txt`.

### Module 2 – Git en branches

- Git-basiscommando's.
- Werken met branches.
- Feature branches gebruiken.
- Committen en pushen.
- Pull Requests en Merge Requests.
- Samenwerken via versiebeheer.

### Module 3 – GitLab en repositories

- GitHub-repository importeren in GitLab.
- GitLab als primaire repository gebruiken.
- Git remote-configuratie.
- Verschillen tussen GitHub en GitLab.

### Module 4 – CI/CD-concepten

- Continuous Integration en Continuous Delivery/Deployment.
- Pipelines, stages en jobs.
- De rol van `.gitlab-ci.yml`.
- De rol van GitLab Runners.
- Het verloop van een CI/CD-pipeline.

### Module 5 – YAML en de eerste pipeline

- YAML-syntax en structuur.
- Docker-images configureren.
- Stages en jobs definiëren.
- Python-omgeving inrichten.
- Dependencies installeren.
- Robot Framework-tests vanuit GitLab uitvoeren.
- Pipeline-resultaten en joblogs analyseren.
- GitLab CI Lint gebruiken.

### Module 6 – GitLab Runners

- Wat een GitLab Runner is.
- GitLab-hosted en self-managed Runners.
- Verschillende Runner-executors.
- Docker executor.
- Docker-images en uitvoeringsomgevingen.
- Runner-tags en jobtoewijzing.
- Pending jobs analyseren.

### Module 7 – Meerdere stages en jobs

- Meerdere stages configureren.
- Meerdere jobs binnen een pipeline.
- Jobs parallel uitvoeren.
- Job-afhankelijkheden.
- `needs` gebruiken.
- DAG-pipelineconcept.
- Artifacts tussen jobs beschikbaar maken.

### Module 8 – Testresultaten en rapportage

- Robot Framework-resultaten analyseren.
- `output.xml`, `log.html` en `report.html`.
- JUnit XML genereren met `--xunit`.
- Artifacts configureren.
- `artifacts: paths` gebruiken.
- `artifacts: reports: junit` gebruiken.
- Testresultaten zichtbaar maken in GitLab.
- Testresultaten analyseren vanuit een Merge Request.

### Module 9 – Variables, secrets en testomgevingen

- GitLab predefined variables.
- Eigen CI/CD-variabelen configureren.
- Globale en job-level variables.
- Secrets veilig beheren.
- Masked en Protected variables.
- Environment variables uitlezen vanuit Robot Framework.
- `BASE_URL` en `TARGET_ENV`.
- Verschillende testomgevingen configureren.
- Environment-scoped variables.
- Omgevingsselectie vanuit de pipeline.

### Module 10 – Professionele workflow en pipeline

- Verschillende pipeline-onderdelen combineren.
- Een complete CI/CD-workflow opzetten.
- Git- en Merge Request-workflows integreren.
- YAML-configuratie hergebruiken met `extends`.
- Onderhoudbaarheid verbeteren.
- Pipelinebeveiliging beoordelen.
- Parallelle testuitvoering toepassen.
- Testresultaten en rapportages beoordelen.
- Bestaande pipelines professioneel reviewen.

## Voorbeeld van een GitLab CI/CD-pipeline

Onderstaand voorbeeld combineert de belangrijkste onderdelen uit de cursus:

```yaml
image: python:3.12-slim

stages:
  - validation
  - test

variables:
  TARGET_ENV: "test"

validate_project:
  stage: validation
  script:
    - python --version
    - pip --version
    - test -f requirements.txt
    - test -f tests/api/users.robot

robot_api_tests:
  stage: test
  variables:
    BASE_URL: "https://jsonplaceholder.typicode.com"
  script:
    - pip install -r requirements.txt
    - echo "Testing environment: $TARGET_ENV"
    - robot --outputdir results --xunit junit.xml tests/api/users.robot
  artifacts:
    when: always
    expire_in: 1 week
    paths:
      - results/
    reports:
      junit: results/junit.xml
```

Deze pipeline bestaat uit twee stages:

1. **Validation:** controleert de Python-omgeving en aanwezigheid van de benodigde projectbestanden.
2. **Test:** installeert de dependencies en voert de Robot Framework API-tests uit.

De resultaten worden als artifacts opgeslagen. De JUnit XML wordt door GitLab verwerkt, zodat de testresultaten ook in de GitLab-interface zichtbaar zijn.

*Let op: JSONPlaceholder is één publieke API. De configuratie hierboven gebruikt daarom één API-endpoint en simuleert geen afzonderlijke testomgevingen.*

## Belangrijkste leerresultaten

Na afronding van deze cursus is er inzicht opgebouwd in:

- Het opzetten van een Robot Framework API-testproject.
- Het beheren van testcode met Git.
- Het configureren van GitLab CI/CD-pipelines.
- Het begrijpen en inzetten van GitLab Runners.
- Het uitvoeren van geautomatiseerde tests binnen Docker.
- Het structureren van pipelines met stages en jobs.
- Het verwerken en analyseren van testresultaten.
- Het beheren van configuratie en secrets.
- Het uitvoeren van tests tegen verschillende omgevingen.
- Het beoordelen en verbeteren van bestaande CI/CD-pipelines.

## Conclusie

Deze cursus heeft de basis gelegd voor het professioneel inzetten van Robot Framework binnen een GitLab CI/CD-omgeving.

De belangrijkste les is dat testautomatisering niet ophoudt bij het schrijven en uitvoeren van geautomatiseerde tests. De tests moeten ook betrouwbaar, reproduceerbaar, onderhoudbaar en veilig geïntegreerd zijn in het ontwikkelproces.

Daarbij vormen Robot Framework, Git, GitLab CI/CD en GitLab Runners samen één geïntegreerde testautomatiseringsoplossing.