-- ============================================================
--  Gallery category constraint update
--  Run in: Supabase Dashboard → SQL Editor → New Query → Run
-- ============================================================

-- 1. Drop the old constraint (dining was a valid value)
ALTER TABLE public.gallery
  DROP CONSTRAINT IF EXISTS gallery_category_check;

-- 2. Add the new constraint (exterior, rooms, interior only)
ALTER TABLE public.gallery
  ADD CONSTRAINT gallery_category_check
  CHECK (category IN ('rooms', 'exterior', 'interior'));

-- 3. Optional: migrate any existing 'dining' rows to 'interior'
--    Remove or comment out if you want to delete them instead.
UPDATE public.gallery
  SET category = 'interior'
  WHERE category = 'dining';
