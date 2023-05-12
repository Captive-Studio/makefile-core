# Terminal colors

ifneq ($(TERM),)
	BLACK        := $(shell tput setaf 0)
	RED          := $(shell tput setaf 1)
	GREEN        := $(shell tput setaf 2)
	YELLOW       := $(shell tput setaf 3)
	LIGHTPURPLE  := $(shell tput setaf 4)
	PURPLE       := $(shell tput setaf 5)
	BLUE         := $(shell tput setaf 6)
	WHITE        := $(shell tput setaf 7)
	RESET        := $(shell tput sgr0)
	SMUL         := $(shell tput smul)
	RMUL         := $(shell tput rmul)
else
	BLACK        :=
	RED          :=
	GREEN        :=
	YELLOW       :=
	LIGHTPURPLE  :=
	PURPLE       :=
	BLUE         :=
	WHITE        :=
	RESET        :=
	SMUL         :=
	RMUL      	 :=
endif
