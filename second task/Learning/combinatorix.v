module  combinatorix        // combinatorix - имя модуля
#(
                            // Здесь могут находиться параметры
)
(
    input wire [7:0] a,b,   // Входные порты a,b,

    output [7:0] res        // Тип wire устанавливается по-умолчанию, но можно написать 
                            // output wire [7:0] res
);
    assign res = a+b+1;     // Здесь добавляется тело модуля

endmodule                   // endmodule - конец описания модуля


