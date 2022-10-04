module reg_file(data_1,data_2,data_in,addr1,addr2,addr3,write_d,clk,Eh,Eb);
output [31:0]data_1,data_2;
input  [31:0]data_in;
input  [4:0]addr1,addr2,addr3;
input  write_d,clk,Eh,Eb;
reg    [31:0]reg_memory[31:0];

integer i = 0;
initial begin
	reg_memory[i] = 5;
	for (i = 1; i<32 ; i = i + 1)
		reg_memory[i] = 0;
end

assign data_1=reg_memory[addr1];
assign data_2=Eh?(Eb?reg_memory[addr2][7:0]:reg_memory[addr2][15:0]):reg_memory[addr2];

always @(posedge clk)
begin /* if (Eb) reg_memory[addr3]=data_in[7:0];
else if (Eh) reg_memory[addr3]=data_in[15:0];
else */ if (write_d) reg_memory[addr3]=data_in;
end

endmodule

module t_reg_file;
wire   [31:0]data_1,data_2;
reg    [31:0]data_in;
reg    [4:0]addr1,addr2,addr3;
reg    write_d,clk,Eh,Eb;

reg_file m(data_1,data_2,data_in,addr1,addr2,addr3,write_d,clk,Eh,Eb);

initial begin clk=1;forever#100 clk=~clk;end

initial begin
     addr1=5'h2;   addr2=5'h9;    addr3=5'h34;  write_d=1;data_in=32'hffffae;
#100 addr1=5'h18;  addr2=5'h34;   addr3=5'h0;   write_d=0;data_in=32'hffffae;Eh=1;Eb=1;
#100 addr1=5'h18;  addr2=5'h34;   addr3=5'h0;   write_d=0;data_in=32'hffffae;Eh=1;Eb=0;
end
endmodule