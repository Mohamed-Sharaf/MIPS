module Adder(out_put,in_put1,in_put2);
output [31:0]out_put;
input  [31:0]in_put1,in_put2;

assign out_put=in_put1+in_put2;

endmodule 