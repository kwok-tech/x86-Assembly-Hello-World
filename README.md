# x86-Assembly: Hello-World

Hello World breakdown in x86 Assembly

👋🌎
Directions for nasm on linux command line:

Download nasm
```
sudo pacman -S nasm
```
Create obj file using this asm with nasm
```
nasm -f elf32 -o HelloWorld.o HelloWorld.asm
```
link executable file using object file
```
ld -m elf_i386 -o  HelloWorld HelloWorld.o
```
Run executable
```
./HelloWorld
```
