CC := clang
STD := c99
CFLAGS := -lglfw -lm -ldl -I. -std=${STD} -Wall

SOURCES=src/main.c lib/glad.c
OBJECTS=$(SOURCES:.cpp=.o)
OUTPUT_BINARY=csprite

all: CFLAGS += -g -O0
all: $(SOURCES) $(OUTPUT_BINARY)

release: CFLAGS += -O2 -DNDEBUG
release: $(SOURCES) $(OUTPUT_BINARY)

$(OUTPUT_BINARY): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) -c $(CFLAGS) $< -o $@
