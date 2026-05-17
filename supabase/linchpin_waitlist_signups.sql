-- Linchpin Cloud — waitlist signups
--
-- Applied 2026-05-17 to project `flow-rpa` (dhkpgytpbawinqvpnfsz) via the
-- Supabase MCP. Re-running this file is safe (idempotent).
--
-- Table:   public.linchpin_waitlist_signups
-- Posture: anon role can INSERT only. SELECT / UPDATE / DELETE are blocked
--          at RLS. Service-role bypasses RLS for operator reads.
--
-- Reading the list:
--   - Supabase dashboard → Table Editor → linchpin_waitlist_signups
--   - or psql with the service-role connection string:
--       \copy (select email, source, created_at
--              from public.linchpin_waitlist_signups
--              order by created_at desc) to 'waitlist.csv' csv header

create extension if not exists "pgcrypto";

create table if not exists public.linchpin_waitlist_signups (
  id          uuid primary key default gen_random_uuid(),
  email       text not null unique,
  source      text default 'landing_page',
  user_agent  text,
  referrer    text,
  created_at  timestamptz not null default now()
);

create index if not exists linchpin_waitlist_signups_created_at_idx
  on public.linchpin_waitlist_signups (created_at desc);

alter table public.linchpin_waitlist_signups enable row level security;

drop policy if exists "anon can insert linchpin waitlist signups"
  on public.linchpin_waitlist_signups;

create policy "anon can insert linchpin waitlist signups"
  on public.linchpin_waitlist_signups
  for insert
  to anon
  with check (
    -- Belt + suspenders: bound the email length + shape server-side so
    -- a bad client can't post a 50 KB blob of garbage. RFC 3696 caps
    -- email at 320 chars (local + domain).
    char_length(email) <= 320
    and email ~* '^[^@\s]+@[^@\s]+\.[^@\s]+$'
  );

-- No SELECT / UPDATE / DELETE policies → anon cannot read or modify.
comment on table public.linchpin_waitlist_signups is
  'Linchpin Cloud — early-access waitlist signups from linchpin.work. Anon-insert-only via RLS.';
