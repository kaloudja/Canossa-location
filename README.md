# CANOSSA LOCATION — Sources complètes récupérées

Ce dossier regroupe les fichiers source retrouvés pour le logiciel Canossa Location.

## Démarrage rapide

1. Ouvrir `index.html` dans un navigateur.
2. Pour une vraie connexion aux données, vérifier les paramètres Supabase dans le fichier.
3. Dans Supabase, exécuter `database/schema.sql`.
4. Ne pas désactiver la sécurité RLS en production.
5. Déployer le dossier sur Cloudflare Pages si souhaité.

## Organisation

- `index.html` : version corrigée reliée à Supabase, placée comme point d'entrée.
- `originals/` : toutes les versions HTML récupérées sans modification.
- `database/schema.sql` : création des tables principales.
- `database/seed_demo.sql` : données de démonstration.
- `docs/FONCTIONS.md` : modules prévus / présents.
- `deployment/cloudflare-pages.txt` : procédure simple de déploiement.

## Modules Canossa

Le projet comprend ou prévoit :
- Calendrier / planning des locations
- Clients
- Parc véhicules
- Réservations
- Contrats
- Paiements / impayés
- États des lieux
- Alertes entretien / assurance / contrôle technique
- Retards et pénalités
- Messagerie
- Connexion Supabase

## Sécurité importante

Le code côté navigateur ne doit contenir qu'une clé publique/publishable Supabase.
Ne jamais mettre une `service_role` key dans un fichier HTML ou JavaScript public.
Avant exploitation réelle : mettre en place Supabase Auth et des politiques RLS adaptées.

## Version technique

Les fichiers retrouvés sont principalement des applications HTML/CSS/JavaScript autonomes.
Ils peuvent être ouverts directement ou déployés comme site statique.
