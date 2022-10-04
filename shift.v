module shift(out_put,in_put,left,N);
output reg [31:0]out_put;
input  [31:0]in_put,N;
input  left;

integer i=0;
//assign out_put=left?{in_put[30:0],1'b0}:{1'b0,in_put[31:1]};
always@(*)

/* if(left)begin
for(i=0;i<=N;i=i+1)
 out_put={in_put[30:0],1'b0};end */
out_put=in_put<<N;
endmodule

module t_shift;
wire [31:0]out_put;
reg  [31:0]in_put,N;
reg  left;
shift m(out_put,in_put,left,N);
initial begin 
in_put=32'd1; left=1;N=32'd5;
end
endmodule
