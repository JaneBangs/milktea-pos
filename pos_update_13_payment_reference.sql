-- =====================================================
-- MILKTEA POS - update 13: payment reference number
-- Optional reference no. for GCash / Bank Transfer sales.
-- Run once in Supabase > SQL Editor. Safe to run again. Your data stays as it is.
-- =====================================================

alter table public.sales add column if not exists payment_ref text;
