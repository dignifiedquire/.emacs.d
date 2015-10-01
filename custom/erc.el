(autoload 'erc "erc" "" t)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#ipfs" "#squatconf" "#elixir-langa")))

(erc :server "irc.freenode.net" :port 6667 :nick "dignifiedquire")

(require 'erc-match)
(setq erc-keywords '("dignifiedquire"))
