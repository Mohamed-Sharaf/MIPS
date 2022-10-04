module counter(pc,in,flag,clk,reset);
output reg [31:0]pc;
input      [31:0]in;
input  flag,clk,reset;

always @(posedge clk)
begin
	if (reset) pc = 0;
	else if (flag) pc=in;
	else
  	 pc <= pc + 1;
end

endmodule

