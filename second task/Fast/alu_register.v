module alu_register #(
    parameter WIDTH = 8
) (
    input wire clk_i,
    input wire rst_i,
    input wire [WIDTH-1:0] first_i,
    input wire [WIDTH-1:0] second_i,
    input wire [2:0] opcode_i,
    output wire [WIDTH-1:0] result_o
);

reg [WIDTH-1:0] result_reg;
reg [WIDTH-1:0] alu_result;

always @(*) begin
    case(opcode_i)
        3'b000: alu_result = ~(first_i & second_i);
        3'b001: alu_result = first_i ^ second_i;
        3'b010: alu_result = first_i + second_i;
        3'b011: alu_result = $signed(first_i) >>> second_i;
        3'b100: alu_result = first_i | second_i;
        3'b101: alu_result = first_i << second_i;
        3'b110: alu_result = ~first_i;
        3'b111: alu_result = { {WIDTH-1{1'b0}}, (first_i < second_i) };
        default: alu_result = {WIDTH{1'b0}};
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