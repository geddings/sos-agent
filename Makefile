CC = gcc
CFLAGS = -Wall  -lpthread -g -ggdb 
LIBS = -L/usr/local/lib -I/usr/include/libxml2  -lxml2  -I/usr/local/include  -pthread -L/usr/local/lib -lprotobuf-c -lz -lpthread   -luuid

HASHDIR=./uthash
CFLAGS +=-I$(HASHDIR)


CFILES = arguments.c network.c agent.c poll.c controller.c discovery.c packet.pb-c.c protobuf-rpc.pb-c.c

all: 
	protoc-c --c_out=. packet.proto 
	protoc-c --c_out=. protobuf-rpc.proto
	$(CC) $(CFLAGS) -o agent  $(CFILES) $(LIBS)


clean:
	rm -fr agent client server *.o packet.pb-c.* protobuf-rpc.pb-c.*

