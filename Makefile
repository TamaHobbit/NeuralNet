compiler = clang++ -Wall
NAME = nn
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
	./nn 2 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 3 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 4 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 5 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 6 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 7 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 8 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 9 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 10 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 11 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 12 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 13 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 14 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 15 2 0.1 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 2 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 3 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 4 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 5 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 6 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 7 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 8 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 9 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 10 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 11 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 12 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 13 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 14 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 15 2 0.3 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 2 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 3 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 4 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 5 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 6 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 7 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 8 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 9 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 10 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 11 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 12 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 13 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 14 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 15 2 0.5 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 2 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 3 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 4 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 5 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 6 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 7 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 8 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 9 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 10 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 11 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 12 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 13 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 14 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 15 2 0.7 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 2 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 3 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 4 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 5 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 6 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 7 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 8 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 9 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 10 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 11 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 12 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 13 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 14 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt
	./nn 15 2 0.9 $(SIZE) -noinput iris-full.data >> res.txt

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

plot.png: plot.plt res.txt
	gnuplot plot.plt
	
