-- 代車.com 商品情報設定 公開ビュー（anon読取用・KEYDROP公開ビューと同方式）
-- 管理APP「他サービス設定 → 代車.com → 商品情報設定」(daisha-products.html) が
--   札幌: app_settings.key='hdm_daisha_product'
--   那覇: nha_app_settings.key='hdm_daisha_product'
-- に保存する。スワイプ予約サイト(代車.com)が anon でこのビューを読む。
--
-- 実行: Supabase SQL Editor（プロジェクト ckrxttbnawkclshczsia）で1回RUN。
--   ※ RLS非対象。ビューは定義者権限で app_settings を読むので anon に grant select するだけでOK。

-- ===== 札幌（app_settings） =====
create or replace view public.public_daisha_product_v as
  select value
  from public.app_settings
  where key = 'hdm_daisha_product';

grant select on public.public_daisha_product_v to anon, authenticated;

-- ===== 那覇（nha_app_settings） =====
create or replace view public.public_daisha_product_nha_v as
  select value
  from public.nha_app_settings
  where key = 'hdm_daisha_product';

grant select on public.public_daisha_product_nha_v to anon, authenticated;

-- 確認:
--   select * from public.public_daisha_product_v;
--   select * from public.public_daisha_product_nha_v;
