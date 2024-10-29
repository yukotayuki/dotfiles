# -------------------
# zstyleのdefault設定
# -------------------
zstyle :compinstall filename "$HOME/.zshrc"

zstyle ":completion:*:commands" rehash 1

# たぶん、大文字小文字を区別しない補完
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

zstyle ':completion:*' ignore-parents parent pwd ..

# 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1
