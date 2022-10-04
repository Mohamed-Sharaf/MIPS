module sign_extend(out_put,in_put);
output reg [31:0]out_put;
input      [15:0]in_put;

always@(*)
begin
if(in_put[15]==0) out_put=32'h0+in_put;
else              out_put=32'hffff0000+in_put;
end
endmodule

module t_sign_extend;
wire   [31:0]out_put;
reg    [15:0]in_put;

sign_extend G(out_put,in_put);

initial begin 
     in_put=16'hfa67;
#100 in_put=16'h0a67;
end
endmodule