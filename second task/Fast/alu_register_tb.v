`timescale 1ns/1ps

module tb_alu_register;
    parameter WIDTH = 8;
    reg clk, rst;
    reg [WIDTH-1:0] first, second;
    reg [2:0] opcode;
    wire [WIDTH-1:0] result;

    alu_register #(.WIDTH(WIDTH)) dut (
        .clk_i(clk),
        .rst_i(rst),
        .first_i(first),
        .second_i(second),
        .opcode_i(opcode),
        .result_o(result)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_alu_register);
    end

    initial begin
        rst = 1;
        first = 0;
        second = 0;
        opcode = 0;
        #20;

        rst = 0;
        #10;


        opcode = 3'b000;
        first = 8'hFF;
        second = 8'hAA;
        #10;


        opcode = 3'b001;
        first = 8'hAA;
        second = 8'h55;
        #10;


        opcode = 3'b010;
        first = 8'h80;
        second = 8'h7F;
        #10;


        opcode = 3'b011;
        first = 8'h80;
        second = 3;
        #10;


        opcode = 3'b100;
        first = 8'h0F;
        second = 8'hF0;
        #10;


        opcode = 3'b101;
        first = 8'h01;
        second = 3;
        #10;


        opcode = 3'b110;
        first = 8'hAA;
        #10;


        opcode = 3'b111;
        first = 8'h10;
        second = 8'h20;
        #10;


        opcode = 3'b010;
        first = 8'hFF;
        second = 8'h01;
        #10;


        opcode = 3'b101;
        first = 8'h01;
        second = 9;
        #10;


        opcode = 3'b010;
        first = 8'h12;
        second = 8'h34;
        #20;

        $finish;
    end

endmodule