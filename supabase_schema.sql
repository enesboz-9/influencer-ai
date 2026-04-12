-- Supabase'de çalıştır
create table if not exists ece_posts (
  id          bigserial primary key,
  image_prompt text        not null,
  caption     text        not null,
  mood        text,
  hashtags    text,           -- JSON array string olarak saklanır
  theme       text,
  image_url   text        default 'PENDING_IMAGE',
  status      text        default 'pending',  -- pending | ready | published
  created_at  timestamptz default now()
);

-- En yeni postları hızlı çekmek için index
create index if not exists idx_ece_posts_created_at on ece_posts(created_at desc);
