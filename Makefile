CC=gcc
CFLAGS=-I. -Wall -Werror $(shell pkg-config --cflags --libs gtk+-3.0 librsvg-2.0)
DEPS = sail_view.h sail_viewstate.h sail_boat.h sail_physics.h
OBJ = sail_application.o sail_view.o sail_viewstate.o sail_boat.o sail_physics.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

sails: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -vf sails sails.exe *o
