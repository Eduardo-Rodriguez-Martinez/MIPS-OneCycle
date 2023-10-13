# Eduardo Rodriguez Martinez 99303354
# 1121025 Arquitectura de Computadoras
# Trimestre 23-P, Grupo CEL01
# 09/10/2017

# Este programa implementa un ciclo sencillo para probar la instrucción sll
        .data
n:	.word  10	# numero de veces que se correra el dato v
v:	.word  0x51B4	# dato v
menos:	.word  -1
        .text
	la	$t0, n
	lw	$t1, 0($t0)
	lw	$t2, 4($t0)
	lw	$t4, 8($t0)
loop:	sll	$t1, $t1, 1
	add	$t2, $t2, $t4
	slt	$t3, $t2, $zero
	beq	$t3, $zero, loop