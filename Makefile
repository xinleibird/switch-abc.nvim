build:
	mkdir -p bin
	swiftc -O src/main.swift -o bin/switch-abc-bin

clean:
	rm -rf bin
