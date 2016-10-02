compiler = g++ -Wall
NAME = nn.exe
SOURCES=main.cc #add new sourcefiles here
OBJECTS=$(SOURCES:.cc=.o)
SIZE=100000 #takes 4.26 minutes per million on my laptop

all: $(NAME)

$(NAME): $(OBJECTS)
	$(compiler) $(OBJECTS) -o $@

%.o : %.cc dataset.h neuralnet.h
	$(compiler) -c $<

clean:
	rm -f *.o $(NAME)
  
batch:
	make
	./nn.exe 2 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 3 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 4 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 5 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 6 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 7 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 8 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 9 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 10 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 11 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 12 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 13 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 14 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 15 2 0.1 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 2 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 3 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 4 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 5 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 6 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 7 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 8 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 9 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 10 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 11 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 12 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 13 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 14 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 15 2 0.3 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 2 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 3 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 4 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 5 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 6 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 7 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 8 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 9 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 10 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 11 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 12 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 13 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 14 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 15 2 0.5 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 2 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 3 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 4 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 5 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 6 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 7 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 8 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 9 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 10 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 11 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 12 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 13 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 14 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 15 2 0.7 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 2 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 3 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 4 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 5 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 6 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 7 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 8 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 9 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 10 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 11 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 12 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 13 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 14 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt
	./nn.exe 15 2 0.9 $(SIZE) -noinput ../data/iris-full.data >> res.txt

bigbatch:#32 instances
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
	make batch
  