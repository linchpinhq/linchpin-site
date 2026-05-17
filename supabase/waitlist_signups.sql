-- Linchpin Cloud — waitlist signups
--
-- Run once against your Supabase project (SQL Editor → New query → paste → Run).
-- Idempotent — safe to re-run.
--
-- Table: waitlist_signups
-- Posture: anon can INSERT only. SELECT / UPDATE / DELETE are blocked at the
-- RLS layer; the service-role key bypasses RLS server-side when you read the
-- list from your admin tooling.

create extension if not exists "pgcrypto";

create table if not exists waitlist_signups (
  id          uuid primary key default gen_random_uuid(),
  email       text not null unique,
  source      text default 'landing_page',
  user_agent  text,
  referrer    text,
  created_at  timestamptz not null default now()
);

create index if not exists waitlist_signups_created_at_idx
  on waitlist_signups (created_at desc);

-- Lock everything down, then explicitly allow INSERT for the anon role.
alter table waitlist_signups enable row level security;

drop policy if exists "anon can insert waitlist signups" on waitlist_signups;

create policy "anon can insert waitlist signups"
  on waitlist_signups
  for insert
  to anon
  with check (
    -- Belt + suspenders: redact server-side too in case a bad client posts a
    -- 50 KB blob of garbage. Keeping it under 320 chars (max email length per
    -- RFC 3696 incl. the local + domain parts) is a cheap floor.
    char_length(email) <= 320
    and email ~* '^[^@\s]+@[^@\s]+\.[^@\s]+$'
  );

-- No SELECT / UPDATE / DELETE policies → anon cannot read or modify.
-- Operator reads the list via the Supabase dashboard (which uses service-role
-- credentials) or via `supabase` CLI with the service key.
--
-- To export to CSV from psql:
--   \copy (select email, source, created_at from waitlist_signups
--          order by created_at desc) to 'waitlist.csv' csv header
