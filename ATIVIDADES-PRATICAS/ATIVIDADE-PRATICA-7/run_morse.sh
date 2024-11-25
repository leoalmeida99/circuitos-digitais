#!/bin/bash

# Verifica se os arquivos necessários estão presentes
if [ ! -f "morse_tb.v" ] || [ ! -f "morse.v" ]; then
    echo "Erro: Arquivos 'morse_tb.v' ou 'morse.v' não encontrados!"
    exit 1
fi

# Passo 1: Compilação com iverilog
echo "Compilando o código com iverilog..."
iverilog -o morse.vvp morse_tb.v
if [ $? -ne 0 ]; then
    echo "Erro na compilação!"
    exit 1
fi

# Passo 2: Executando com vvp
echo "Executando a simulação..."
vvp morse.vvp
if [ $? -ne 0 ]; then
    echo "Erro na simulação!"
    exit 1
fi

# Passo 3: Abrindo o GTKWave
echo "Abrindo GTKWave..."
if [ -f "morse.vcd" ]; then
    gtkwave morse.vcd
else
    echo "Erro: Arquivo 'morse.vcd' não foi gerado!"
    exit 1
fi
