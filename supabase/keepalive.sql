-- Keepalive: gives the daily GitHub job a real database WRITE to perform.
-- A plain read of `bookings` every two days was not enough to stop Supabase
-- from pausing the free project (paused 25.10 and again 4.11.2026).
-- Run once in the Supabase SQL editor (or via the Supabase MCP). Safe to re-run.

create table if not exists public.keepalive (
  id        int primary key default 1 check (id = 1),  -- single row
  pinged_at timestamptz not null default now(),
  pings     bigint not null default 0
);

-- No policies: the table is not readable or writable from the browser directly.
alter table public.keepalive enable row level security;

-- The only way in: bump the single row and return the new timestamp.
create or replace function public.keepalive()
returns timestamptz
language sql
security definer
set search_path = public
as $$
  insert into public.keepalive (id, pinged_at, pings)
  values (1, now(), 1)
  on conflict (id) do update
    set pinged_at = now(), pings = public.keepalive.pings + 1
  returning pinged_at;
$$;

revoke all on function public.keepalive() from public;
grant execute on function public.keepalive() to anon, authenticated;
