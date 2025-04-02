module  overlay
                            //Здесь могут находиться параметры
)
(
    input  a_i, b_i,        // входные порты
    input  clk_i,           // входной порт - тактовый сигнал
    output a_o, b_o         // выходные порты
);
    reg a_reg, b_reg;
    assign a_o = b_reg;
    
    always @(posedge clk_i) begin // запуск блока при каждом положительном фронте тактового сигнала
        a_reg <= a_i;
        b_reg <= a_reg;
    // и эти две стороки равносильны следующим двум строчкам:
    //  b_reg <= a_reg;
    //  a_reg <= a_i;
    end

endmodule                   
