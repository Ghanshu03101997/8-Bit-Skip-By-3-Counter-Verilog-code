`timescale 1ns / 1ps



module skip_cnt(clk,rst,data_out);
input clk,rst;
output reg [8:0]data_out;
reg [1:0] small_cnt;

always@(posedge clk or posedge rst) begin
if(rst) begin
small_cnt <= 0;
data_out <=0;
end
else begin
// initialize both the counter to reset condition
 if (data_out == 8'd254) begin
small_cnt <= 0;
data_out <= 0;
end
// increament both the counter by 1
else if (small_cnt != 2'd2) begin 
/*t not equal to 254, then we check if the small counter is Not equal to 2, then we increament both the counter by 1
 so we simply add 1 to the small counter and 1 to the skip by three counter*/
small_cnt <= small_cnt + 8'd1;
data_out <= data_out + 8'd1;
end
else begin
// eqaul to 2 then
/* Rollover small counter back to 1
Increament 8-Bit counter by 2*/
small_cnt <= 8'd1;
data_out <= data_out + 8'd2;
end
end
end


endmodule
