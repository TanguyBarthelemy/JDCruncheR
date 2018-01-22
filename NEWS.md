# JDCruncher 0.2.0

## Nouvelles fonctions

 * `update_workspace()` qui permet de mettre à jour un workspace sans exporter de résultat.
 * ajout de fonctions pour extraire un bilan qualité de la matrice des diagnostics de JDemetra+. Ajout de fonctions de manipulation et d'export de ces objets.

## Modification des fonctions déjà existantes

 * ajout d'un paramètre `log_file` aux fonctions `cruncher()` et `cruncher_and_param()` pour exporter si besoin la log du cruncher.

## Autres modifications
 * mise à jour des options `default_matrix_item` et `default_tsmatrix_series` avec les paramètres de la version 2.2.0 de JDemetra+