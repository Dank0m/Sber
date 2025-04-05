module alu_register #(          //название модуля
    parameter WIDTH = 8         //требуемый параметр параметр шины по ТЗ
) (
    input wire clk_i,           //переменная тактирования
    input wire rst_i,           //переменная синхронного сброса
    input wire [WIDTH-1:0] first_i,     //первый операнд
    input wire [WIDTH-1:0] second_i,    //второй операнд
    input wire [2:0] opcode_i,          //вход инструкции
    output wire [WIDTH-1:0] result_o    //результат работы АЛУ
);

reg [WIDTH-1:0] result_reg; //промежуточные переменные типа reg, чтобы 
reg [WIDTH-1:0] alu_result; //можно было работать с ними в always блоке

always @(*) begin
    case(opcode_i)
        3'b000: alu_result <= ~(first_i & second_i); 
        3'b001: alu_result <= first_i ^ second_i;    
        3'b010: alu_result <= first_i + second_i;    
        3'b011: alu_result <= $signed(first_i) >>> second_i;
        3'b100: alu_result <= first_i | second_i;
        3'b101: alu_result <= first_i << second_i;
        3'b110: alu_result <= ~first_i;
        3'b111: alu_result <= first_i < second_i;
        default: alu_result <= {WIDTH{1'b0}};
        //Конкатенация {}: Объединяет битовые последовательности.
        //{WIDTH{1'b0}}: Создает вектор из WIDTH нулевых бит.
    endcase
end

always @(posedge clk_i) begin
    if (rst_i)
        result_reg <= {WIDTH{1'b0}};
    else
        result_reg <= alu_result;
end

assign result_o = result_reg;

endmodule
