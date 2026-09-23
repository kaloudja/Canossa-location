-- CANOSSA LOCATION - Schéma Supabase / PostgreSQL
-- Tables principales : client, vehicule, location

create table if not exists public.client (
  id bigserial primary key,
  created_at timestamptz not null default now(),
  nom text,
  prenom text,
  telephone text,
  email text,
  adresse text,
  code_postal text,
  piece_identite text,
  numero_piece text,
  numero_permis text,
  date_expiration_permis date
);

create table if not exists public.vehicule (
  id bigserial primary key,
  created_at timestamptz not null default now(),
  immatriculation text,
  marque text,
  modele text,
  statut text default 'disponible',
  actif boolean not null default true,
  categorie text,
  capacite integer,
  tarif_journalier numeric(12,2),
  annee integer,
  kilometrage integer
);

create table if not exists public.location (
  id bigserial primary key,
  created_at timestamptz not null default now(),
  client_id bigint references public.client(id) on delete restrict,
  vehicule_id bigint references public.vehicule(id) on delete restrict,
  date_debut timestamptz,
  date_fin timestamptz,
  tarif_journalier numeric(12,2),
  statut text default 'réservée',
  note text
);

create index if not exists location_client_id_idx on public.location(client_id);
create index if not exists location_vehicule_id_idx on public.location(vehicule_id);
create index if not exists location_dates_idx on public.location(date_debut, date_fin);

-- RLS : activer avant mise en production.
alter table public.client enable row level security;
alter table public.vehicule enable row level security;
alter table public.location enable row level security;

-- IMPORTANT :
-- Ne crée pas de politique publique permissive pour les données clients en production.
-- Prévoir Supabase Auth + rôles administrateur/utilisateur.
