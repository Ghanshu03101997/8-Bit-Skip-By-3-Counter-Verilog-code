`timescale 1ns / 1ps



module test_bench();
reg clk,rst;
wire [7:0] data_out;
skip_cnt ghanshyam(clk,rst,data_out);
initial begin
clk=0; rst=1;
#10 clk=1; rst=0;
end
always #5 clk=~clk;
endmodule
