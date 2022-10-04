module reg_mux(out_put,in_put1,in_put2,select);
output [4:0]out_put;
input  [4:0]in_put1,in_put2;
input  select;

assign out_put=select?in_put1:in_put2;

endmodule

module t_mux;
wire   [4:0]out_put;
reg    [4:0]in_put1,in_put2;
reg    select;

mux m(out_put,in_put1,in_put2,select);

initial begin 
in_put1=5'd67;in_put2=5'd0;select=1;
#100 in_put1=5'd67;in_put2=5'd0;select=0;
end 
endmodule
