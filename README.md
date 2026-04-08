# Analysis Repository

Welcome to the data repository for our analysis application. This repository serves as a centralized "Cloud Catalog" for geospatial and flow-based data analyses.

## 🚀 How it works
This repository is connected directly to the application. When users select "Import from GitHub," the app fetches the `index.json` from this root directory and presents the available analyses listed below.

## 📂 Structure
- `/analyses`: Contains the raw JSON analysis files.
- `index.json`: A generated manifest file (do not edit manually).
- `generate-index.sh`: The utility script used to sync the index and this README.

## 🛠 Contributing
To add a new analysis:
1. Place your JSON file in the `/analyses` folder.
2. Ensure the JSON follows the required schema (including the `LocalFlow__Content__c` metadata).
3. Run `./generate-index.sh` to update the catalog.
4. Commit and push your changes.

# Analyses

| Name | Description | Tags | Author | Last Update |
| :--- | :--- | :--- | :--- | :--- |
| **Directory of Nearby Campsites** | Exhaustive analysis of nearby campsites including address extraction, phone number, email, website, and star rating. Results are interactive on the map and via a contact dashboard. | `camping` `tourism` `world` | Community | 2026-04-08 |
| **Bureaux Stratégiques (GE)** | Analyse d'intelligence économique sur les bureaux d'ingénierie des grandes entreprises (GE). L'interface offre une interactivité bidirectionnelle complète : cliquer sur un marqueur orange ou sur une ligne du tableau affiche instantanément les dirigeants, les effectifs locaux et une analyse de densité de voisinage (OSM). | `france` `esn` `grands groupes` `bureaux` `intelligence économique` | Renaud Pawlak Dev481 | 2026-04-08 |
| **Ingénierie GE : Filtre par Secteur** | Analyse stratégique multisectorielle (Technique, IT, Finance, R&D) focalisée sur les bureaux locaux des grands groupes (GE). L'outil propose un filtrage dynamique par secteur d'activité, synchronisant la visibilité sur la carte et le tableau, avec accès aux effectifs et analyse de densité locale. | `france` `esn` `grands groupes` `ingénierie` | Renaud Pawlak Dev481 | 2026-04-08 |
| **Établissements locaux (Rayon 50km)** | Cette analyse identifie les établissements physiques (agences, magasins, bureaux) situés dans un rayon de 50 km. Contrairement à une recherche classique qui peut pointer vers le siège social national, cette version utilise les coordonnées exactes de chaque établissement local pour garantir la pertinence géographique. | `france` `esn` `établissements locaux` | Renaud Pawlak Dev481 | 2026-04-08 |
| **Analyse Emploi** | Cette analyse montre les emplois accessibles en voiture depuis un point de départ sélectionné, ainsi qu'une estimation du prix au m² dans la zone d'accessibilité. | `france` `esn` `emploi` `isochrone` `dvf` `francetravail` `interpolation` | Renaud Pawlak Dev481 | 2026-04-08 |
| **Topographical Analysis & Slope (1km²)** | Topographical analysis of a 1km² area. Includes contour lines every meter, synchronized cross-section graphs with a real metric scale, and indicators of maximum slope. | `world` `topography` `slope` `isobands` `isoclines` | Community | 2026-04-08 |
| **Neighborhood & Co-Visibility Analysis** | This cartographic analysis identifies all buildings and vegetation areas within a 200-meter radius around a selected point. It then calculates the line of sight towards each neighboring building to determine whether it is visible or obstructed by other structures, providing an essential co-visibility indicator for impact studies or neighborhood assessments. Compatible with Google Maps and Leaflet. | `world` `visibility` `line-of-sight` `urban` `cartography` | Community | 2026-04-08 |
