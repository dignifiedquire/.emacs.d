(require 'erc-match)

(autoload 'erc "erc" "" t)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#ipfs" "#squatconf" "#elixir-langa")))

(erc :server "irc.freenode.net" :port 6667 :nick "dignifiedquire")

(setq erc-prompt-for-nickserv-password t)

(setq erc-keywords '("dignifiedquire"))
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
