module cpu_top(clk, reset);
input  clk, reset;

reg [31:0] pc;
wire [31:0] instruction,mem_data,branch;
wire [4:0] src1, src2, dst,ALU_con,reg_data;
wire [5:0] op_code, func6;
wire ins_mem_wr_en,res_reg_mux,reg_file_wr_en,res_alu_mux,res_mem_mux,data_mem_wr_en,res_branch_mux,flag,Eh,Eb;
wire [31:0]data1,data2,alu_result,mux_out1,mux_out2,mux_out3,sign;

always @(posedge clk)
begin
	if (reset) pc = 0;
	else if (ins_mem_wr_en) pc={6'b0,instruction[25:0]};
	else
  	 pc <= mux_out3 + 1;
end
memory inst_memory(instruction,0,pc[9:0],0,clk,0,0);
assign src1 = instruction[25:21];
assign src2 = instruction[20:16];
assign dst = instruction[15:11];
assign op_code = instruction[31:26];
assign shamt = instruction[10:6];
assign func6 = instruction[5:0];

Adder add(branch,pc,sign);
control_unit con(ins_mem_wr_en,res_reg_mux,reg_file_wr_en,res_alu_mux,ALU_con,res_mem_mux,data_mem_wr_en,res_branch_mux,op_code,func6,reset,flag,Eh,Eb);
reg_mux m(reg_data,src2,dst,res_reg_mux);
reg_file register_file(data1,data2,mux_out2,src1,src2,reg_data,reg_file_wr_en,clk,Eh,Eb);
sign_extend ex(sign,instruction[15:0]);
mux multiplixer1(mux_out1,data2,sign,res_alu_mux);
ALU alu_unit(alu_result,flag,data1,mux_out1,ALU_con);
mux multiplixer2(mux_out2,mem_data,alu_result,res_mem_mux);
mux multiplixer3(mux_out3,pc,branch,res_branch_mux);


memory data_memory(mem_data,data2,alu_result [9:0],data_mem_wr_en,clk,Eh,Eb);
endmodule
