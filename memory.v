module memory(data_out,data_in,In_addr,write_d,clk,Eh,Eb);
output [31:0]data_out;
input  [31:0]data_in;
input  [9:0]In_addr;
input  write_d,clk,Eh,Eb;
reg    [31:0]memory[1023:0];
integer i = 0;
initial begin
memory[0] = 32'h00000820;    //add
memory[1] = 32'h00201022;    //sub
memory[2] = 32'h20230007;    //add_immediate	
memory[3] = 32'h20030007;    //add_immediate   
memory[4] = 32'h30030005;    //and_immediate   
memory[5] = 32'h34030006;    //or_immediate
memory[6] = 32'h38030002;    //xor_immediate
memory[7] = 32'h00e04022;
memory[8] = 32'h01004820;
memory[9] = 32'had490030;    //store
memory[10] = 32'h0049802a;   //set_on_lessthan_unsigned
memory[11] = 32'h8d490030;   //load
memory[12] = 32'h2822002a;   //set_on_lessthan_im_unsigned
memory[13] = 32'h00203880;   //shift_left_logical
memory[14] = 32'h00450048;   //shift_right_arithmetic
memory[15] = 32'ha4120001;   //store_half
memory[16] = 32'h8e400000;
memory[17] = 32'h84120001;
memory[18] = 32'h02409820;
memory[19] = 32'h0260a020;
memory[20] = 32'h0280a820;
memory[21] = 32'h02a0b020;
memory[22] = 32'h02c0b820;
memory[23] = 32'h1423000a;   //branch_not_equal
memory[24] = 32'h08000001;   //jump
	for (i = 23; i<1024; i=i+1)
		memory[i] = 0;
end

assign data_out=Eh?(Eb?memory[In_addr][7:0]:memory[In_addr][15:0]):memory[In_addr];

always @(posedge clk)
begin if (write_d) memory[In_addr]=data_in;/* 
else if (Eh) memory[In_addr]={16'h0,data_in[15:0]};
else if (Eb) memory[In_addr]=data_in[7:0]; */
end

endmodule

module t_memory;
wire   [31:0]data_out;
reg    [31:0]data_in;
reg    [9:0]In_addr;
reg     write_d,clk,Eh,Eb;

memory g(data_out,data_in,In_addr,write_d,clk,Eh,Eb);

initial begin clk=1;forever#100 clk=~clk;end
initial begin
     In_addr=12;write_d=1;data_in=32'h909988ff;Eh=0;Eb=0;
/* #100 In_addr=12;write_d=0;
#100 In_addr=22;write_d=0; */
#100 In_addr=12;write_d=0;data_in=32'h909988ff;Eh=1;Eb=1;
#100 In_addr=12;write_d=0;data_in=32'h909988ff;Eh=1;Eb=0;
end
endmodule