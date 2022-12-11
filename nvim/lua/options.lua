local options = {
  helplang = "ja",

  number = true, -- 行番号を表示

  -- カーソル下の行・列をハイライト表示
  cursorline = true,
  cursorcolumn = true,

  list = true, -- 制御文字を表示
  listchars = "space:･,eol:↴",

  encoding = "utf-8",
  fileencoding = "utf-8",

  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = true, -- vimを閉じてもundoできるようにする

  expandtab = true, -- Tabキー押下時に、タブ文字ではなく半角スペースを挿入
  tabstop = 2, -- タブの幅
  shiftwidth = 2, -- インデントの幅
  smartindent = true, -- C言語風のプログラミング言語向けの自動インデント
  autoindent = true, -- 現在の行のインデントをキープ

  showtabline = 2, -- 常時、タブバーを表示する

  clipboard = "unnamedplus", -- ヤンクした文字列をクリップボードに送る

  mouse = "a", -- マウスをvimの全モードで利用可能にする

  -- ウィンドウの開く方向を下・右に設定
  splitbelow = true,
  splitright = true,

  completeopt = {
    "menuone", -- 候補が1つでもポップアップメニューを使う
    "noinsert", -- ポップアップメニューから選択しない限り挿入しない
  },

  conceallevel = 0, -- 構文として必要だが視認性を妨げるものを非表示にする機能をオフ

  wrap = false, -- 画面端で行を折り返さない

  -- 画面端でのスクロールに縦横8行分の余裕をもたせる
  scrolloff = 8,
  sidescrolloff = 8,

  autoread = true, -- ファイルに外部で変更があった場合、自動的に読み込み直す

  display = "lastline", -- 長い行の省略をしない

  pumheight = 10, -- 変換候補で一度に表示される数

  -- 括弧の入力時、対応する括弧に一瞬カーソルを飛ばす
  showmatch = true,
  matchtime = 1,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
