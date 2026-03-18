build:
	mkdir -p bin
	swiftc -O src/main.swift -o bin/im-select-bin

clean:
	rm -rf bin
