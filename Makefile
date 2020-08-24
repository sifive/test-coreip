PROGRAM ?= test-coreip

# Disable warnings on variadic macros so that this can be compiled with
# -std=c99 -Wall -Werror without failing.
override CFLAGS += -Wno-variadic-macros

$(PROGRAM): $(wildcard *.c) $(wildcard *.h) $(wildcard *.S)
	$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.c %.S,$^) $(LOADLIBES) $(LDLIBS) -o $@

clean:
	rm -f $(PROGRAM) $(PROGRAM).hex

