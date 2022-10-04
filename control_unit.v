module control_unit(ins_mem_wr_en,res_reg_mux,reg_file_wr_en,res_alu_mux,ALU_con,res_mem_mux,data_mem_wr_en,res_branch_mux,op_code,func6,reset,flag,Eh,Eb);
output reg ins_mem_wr_en,res_reg_mux,reg_file_wr_en,res_alu_mux,res_mem_mux,data_mem_wr_en,res_branch_mux,Eh,Eb;
output reg [4:0]ALU_con;
input      [5:0]op_code,func6;
input      reset,flag;
always@(*)begin
//-------------------------------------------------------Load-------------------------------------------------------------					
if ((op_code==6'b1000_11)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b00000;
							res_mem_mux=1;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------Load_half-------------------------------------------------------------					
else if ((op_code==6'b1000_01)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b00000;
							res_mem_mux=1;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=1;Eb=0;
					end
//-------------------------------------------------------Load_byte-------------------------------------------------------------					
else if ((op_code==6'b1000_00)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b00000;
							res_mem_mux=1;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=1;Eb=1;
					end
//-------------------------------------------------------store-------------------------------------------------------------					
 else if ((op_code==6'b1010_11)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=0;
							res_alu_mux=0;
							ALU_con=5'b00000;
							res_mem_mux=1;
							data_mem_wr_en=1;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end	 
//-------------------------------------------------------store_half-------------------------------------------------------------					
 else if ((op_code==6'b1010_01)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=0;
							res_alu_mux=0;
							ALU_con=5'b00000;
							res_mem_mux=1;
							data_mem_wr_en=1;
							res_branch_mux=1;
							Eh=1;Eb=0;
					end
//-------------------------------------------------------store_byte-------------------------------------------------------------					
 else if ((op_code==6'b1010_00)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=0;
							res_alu_mux=0;
							ALU_con=5'b00000;
							res_mem_mux=1;
							data_mem_wr_en=1;
							res_branch_mux=1;
							Eh=1;Eb=1;
					end					
//-------------------------------------------------------add_immediate-------------------------------------------------------------					
else if ((op_code==6'b0010_00)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b00000;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end	
//-------------------------------------------------------and_immediate-------------------------------------------------------------					
else if ((op_code==6'b0011_00)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b00010;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
						end	
//-------------------------------------------------------or_immediate-------------------------------------------------------------					
else if ((op_code==6'b0011_01)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b00011;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end						
//-------------------------------------------------------xor_immediate-------------------------------------------------------------					
else if ((op_code==6'b0011_10)&(~reset))
					begin   ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b00101;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end	
//-------------------------------------------------------set_on_lessthan_imm-------------------------------------------------------------					
else if ((op_code==6'b0010_10)&(~reset))
					begin 	ins_mem_wr_en=0;
							res_reg_mux=0;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b01000;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end	
//-------------------------------------------------------set_on_lessthan_imm_unsigned-------------------------------------------------------------					
else if ((op_code==6'b0010_11)&(~reset))
					begin 	ins_mem_wr_en=0;
							res_reg_mux=0;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b00111;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end	
//-------------------------------------------------------branch_equal-------------------------------------------------------------					
else if ((op_code==6'b0001_00)&(~reset)&(flag))
					begin  ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=0;
							res_alu_mux=1;
							ALU_con=5'b00110;
							res_mem_mux=1;
							data_mem_wr_en=0;
							res_branch_mux=0;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------branch_notequal-------------------------------------------------------------					
else if ((op_code==6'b0001_01)&(~reset)&(~flag))
					begin  ins_mem_wr_en=0;
							res_reg_mux=1;
							reg_file_wr_en=0;
							res_alu_mux=1;
							ALU_con=5'b00110;
							res_mem_mux=1;
							data_mem_wr_en=0;
							res_branch_mux=0;
							Eh=0;Eb=0;
					end	
//-------------------------------------------------------jump-------------------------------------------------------------					
else if ((op_code==6'b0000_10)&(~reset)&(~flag))
					begin 	ins_mem_wr_en=1;
							res_reg_mux=0;
							reg_file_wr_en=0;
							res_alu_mux=0;
							ALU_con=5'b00000;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end						
else					
case({op_code,func6,reset})
//-------------------------------------------------------ADD-------------------------------------------------------------
13'b0000_0010_0000_0:begin  ins_mem_wr_en=0;
						    res_reg_mux=0;
						    reg_file_wr_en=1;
							res_alu_mux=1;
							ALU_con=5'b00000;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------add_unsigned-------------------------------------------------------------
13'b0000_0010_0001_0:begin  ins_mem_wr_en=0;
						    res_reg_mux=0;
						    reg_file_wr_en=1;
							res_alu_mux=1;
							ALU_con=5'b01011;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------AND-------------------------------------------------------------
13'b0000_0010_0100_0:begin  ins_mem_wr_en=0;
						    res_reg_mux=0;
						    reg_file_wr_en=1;
							res_alu_mux=1;
							ALU_con=5'b00010;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------OR-------------------------------------------------------------
13'b0000_0010_0101_0:begin  ins_mem_wr_en=0;
						    res_reg_mux=0;
						    reg_file_wr_en=1;
							res_alu_mux=1;
							ALU_con=5'b00011;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------NOR-------------------------------------------------------------
13'b0000_0010_0111_0:begin  ins_mem_wr_en=0;
						    res_reg_mux=0;
						    reg_file_wr_en=1;
							res_alu_mux=1;
							ALU_con=5'b00100;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end	
//-------------------------------------------------------xOR-------------------------------------------------------------
13'b0000_0010_0110_0:begin  ins_mem_wr_en=0;
						    res_reg_mux=0;
						    reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b00101;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end									
//-------------------------------------------------------sub-------------------------------------------------------------					
13'b0000_0010_0010_0:begin 	ins_mem_wr_en=0;
							res_reg_mux=0;
							reg_file_wr_en=1;
							res_alu_mux=1;
							ALU_con=5'b00001;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------sub_unsigned-------------------------------------------------------------					
13'b0000_0010_0011_0:begin 	ins_mem_wr_en=0;
							res_reg_mux=0;
							reg_file_wr_en=1;
							res_alu_mux=1;
							ALU_con=5'b01100;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------shift_left_logical-------------------------------------------------------------					
13'b0000_0000_0000_0:begin 	ins_mem_wr_en=0;
							res_reg_mux=0;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b01001;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------shift_right_logical-------------------------------------------------------------					
13'b0000_0000_0010_0:begin 	ins_mem_wr_en=0;
							res_reg_mux=0;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b01010;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end

//-------------------------------------------------------shift_right_arithmetic-------------------------------------------------------------					
13'b0000_0000_1011_0:begin 	ins_mem_wr_en=0;
							res_reg_mux=0;
							reg_file_wr_en=1;
							res_alu_mux=0;
							ALU_con=5'b01101;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end

//-------------------------------------------------------set_on_lessthan-------------------------------------------------------------					
13'b0000_0010_1010_0:begin 	ins_mem_wr_en=0;
							res_reg_mux=0;
							reg_file_wr_en=1;
							res_alu_mux=1;
							ALU_con=5'b01000;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end
//-------------------------------------------------------set_on_lessthan_unsigned-------------------------------------------------------------					
13'b0000_0010_1011_0:begin 	ins_mem_wr_en=0;
							res_reg_mux=0;
							reg_file_wr_en=1;
							res_alu_mux=1;
							ALU_con=5'b00111;
							res_mem_mux=0;
							data_mem_wr_en=0;
							res_branch_mux=1;
							Eh=0;Eb=0;
					end					

default:;
endcase
end

endmodule