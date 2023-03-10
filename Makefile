#
# To run the demos when linked with a shared library (default):
#
#    LD_LIBRARY_PATH=../.. ./rsa_encrypt

CFLAGS = -I./ -g
LDLIBS = -L/usr/local/ssl/lib -lssl -lcrypto

all: ecise_demo

%.o: %.c
	$(CC) $(CFLAGS) -c $<

ecise_demo: ecies.o example.o keys.o secure.o
	@$(CC) $^ -o $@ $(LDLIBS)

clean:
	$(RM) *.o ecise_demo