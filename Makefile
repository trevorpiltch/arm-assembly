OBJS = movexamps.o

ifdef DEBUG
DEBUGFLGS = -g
else 
DEBUGFLGS = 
endif 

%.o: %.s
	as $(DEBUGFLGS) $< -o $@ 

movexamps: $(OBJS)
	ld -macos_version_min 14.0.0 -o movexamps $(OBJS) -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

clean:
	rm -f *.o movexamps	 