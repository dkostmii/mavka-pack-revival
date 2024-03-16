PACK_CMD := "./install_packs.sh"

all: build

install:
	$(PACK_CMD)

.PHONY: clean

clean:
	$(RM) *.js

