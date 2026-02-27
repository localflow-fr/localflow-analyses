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
*(The list of available analyses will be automatically generated here)*# Analysis

| Name | Description | Author | Last Update |
| :--- | :--- | :--- | :--- |
| **Annuaire Complet des Campings** | Analyse exhaustive des campings à proximité incluant l'extraction de l'adresse, du téléphone, de l'e-mail, du site web et du classement en étoiles. Les résultats sont interactifs sur la carte et via un tableau de bord de contact. | Community | 2026-02-27 |
| **Voisinage et Co-visibilité** | Analyse géospatiale du voisinage immédiat (200m). Cette analyse identifie les types de bâtiments et les zones de végétation dense. Elle calcule la co-visibilité en testant si chaque structure est masquée par un obstacle physique (autre bâtiment ou végétation). Les résultats sont présentés par catégorie (Habitation, Commerce, Industrie, Public). | Community | 2026-02-27 |
