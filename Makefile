TARGET = $(file)
OBJS = $(TARGET).o

ifdef DEBUG
DEBUGFLGS = -g
else 
DEBUGFLGS = 
endif 

$(TARGET): $(OBJS)
	ld -macos_version_min 14.0.0 -o $(TARGET) $(OBJS) -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 
$(OBJS): $(TARGET).s
	as $(DEBUGFLGS) $< -o $@ 

clean:
	rm -f $(TARGET) $(OBJS)	 