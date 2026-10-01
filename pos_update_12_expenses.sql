-- =====================================================
-- MILKTEA POS - update 12: expenses (stage E1)
-- Run once in Supabase > SQL Editor (after update 11).
-- =====================================================

create table public.expenses (
  id bigint generated always as identity primary key,
  expense_date date not null default current_date,
  name text not null,                              -- what the money was spent on
  category text not null,                          -- e.g. Rent / Space Rental, Marketing / Advertising
  amount numeric not null check (amount > 0),
  payment_method text not null default 'Cash',     -- Cash, GCash, Bank transfer, Card, Other
  vendor text,                                     -- supplier or shop (optional)
  reference_no text,                               -- receipt or reference number (optional)
  notes text,
  created_at timestamptz not null default now()
);

create index expenses_date_idx on public.expenses (expense_date);

alter table public.expenses enable row level security;
create policy "logged in users only" on public.expenses
  for all to authenticated using (true) with check (true);
grant select, insert, update, delete on public.expenses to authenticated;
