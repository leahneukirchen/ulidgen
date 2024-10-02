ALL=ulidgen

CFLAGS=-g -O2 -Wall -Wno-switch -Wextra -Wwrite-strings

DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man

all: $(ALL)

ulidgen: ulidgen.o ulid.o
ulid.o: ulid.c ulid.h

clean: FRC
	rm -f $(ALL) *.o

install: FRC all
	mkdir -p $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1 $(DESTDIR)$(ZSHCOMPDIR)
	install -m0755 $(ALL) $(DESTDIR)$(BINDIR)
	install -m0644 $(ALL:=.1) $(DESTDIR)$(MANDIR)/man1

README: ulidgen.1
	mandoc -Tutf8 $< | col -bx >$@

FRC:
