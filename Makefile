COMPILER = gcc
OBJ_DIR = ./obj
SRC_DIR = ./src
LIB_DIR = ./lib
BIN_DIR = ./bin
INCLUDE = ./include

lib: $(LIB_DIR)/libfunc.a

main: $(BIN_DIR)/main

$(BIN_DIR)/main: $(SRC_DIR)/main.c $(LIB_DIR)/libfunc.a
	$(COMPILER) -o $@ -I$(INCLUDE) $(OBJ_DIR)/*.o $(SRC_DIR)/main.c  

$(LIB_DIR)/libfunc.a: $(OBJ_DIR)/func1.o $(OBJ_DIR)/func2.o $(OBJ_DIR)/func3.o
	ar cru $@ $(OBJ_DIR)/*.o
	mkdir -p ./lib

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p ./obj
	$(COMPILER) -o $@ -c $^

clean:
	rm -f $(BIN_DIR)/* $(OBJ_DIR)/* $(LIB_DIR)/*
