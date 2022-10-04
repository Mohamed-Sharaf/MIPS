module ALU(result,flag,data_1,data_2,control_signal);
output reg [31:0]result;
output reg flag;
input      [31:0]data_1,data_2;
input      [04:0]control_signal;
reg signed [31:0]signed_data_1,signed_data_2;

always@(*)begin 
signed_data_1=data_1;
signed_data_2=data_2;
case(control_signal)
5'b00000:begin result=data_1+data_2;    flag=0;	    end   //add
5'b00001:begin result=data_1-data_2;    flag=0;	    end   //sub
5'b00010:begin result=data_1&data_2;    flag=0;	    end   //and
5'b00011:begin result=data_1|data_2;    flag=0;     end   //or
5'b00100:begin result=~(data_1|data_2); flag=0;     end   //nor
5'b00101:begin result=data_1^data_2;    flag=0;     end   //xor
5'b00110:begin if(data_1==data_2)       flag=1; 
				else                    flag=0;     end   //flag
5'b00111:begin if(data_1<data_2)        result=1; 
				else                    result=0;   end   //set_on_lessthan_unsigned
5'b01000:begin if(data_1[31]&(~data_2[31])) result=1;
			else if((data_1^(32'h80000000))<(data_2^(32'h80000000)))        result=1; 
			else                    result=0;   end   //set_on_lessthan		
5'b01001:begin result=data_1<<data_2[10:6];         end   //shift left logical
5'b01010:begin result=data_1>>data_2[10:6];         end   //shift right logical	
5'b01011:begin result=((data_1+data_2)^(32'h80000000));    flag=0;	    end   //add_unsigned
5'b01100:begin result=((data_1-data_2)^(32'h80000000));    flag=0;	    end   //sub_unsigned
5'b01101:begin result=data_1>>>data_2[10:6];         end   //shift right arithmetic	
default:;
endcase
end
endmodule

module t_ALU;
wire   [31:0]result;
wire   flag;
reg    [31:0]data_1,data_2;
reg    [04:0]control_signal;

ALU f(result,flag,data_1,data_2,control_signal);

initial begin
     data_1=32'd67;data_2=32'd33;control_signal=5'b00010;
#100 data_1=32'd67;data_2=32'd33;control_signal=5'b00011;
#100 data_1=32'd67;data_2=32'd0;control_signal=5'b00011;
#100 data_1=32'd67;data_2=32'd0;control_signal=5'b00100;
#100 data_1=32'd33;data_2=32'd33;control_signal=5'b00101;
#100 data_1=32'd33;data_2=32'd32;control_signal=5'b00101;
#100 data_1=32'h80000032;data_2=32'h33;control_signal=5'b00111;
#100 data_1=32'h80000032;data_2=32'h31;control_signal=5'b01000;
#100 data_1=32'h80000032;data_2=32'h80000031;control_signal=5'b01000;
#100 data_1=32'd1;data_2=32'd128;control_signal=5'b01001;
#100 data_1=32'd4;data_2=32'd128;control_signal=5'b01010;
#100 data_1=32'd2147483648;data_2=32'd0;control_signal=5'b01011;
#100 data_1=32'hffff1244;data_2=32'h128;control_signal=5'b01101;
#100 data_1=32'h80000000;data_2=32'h88;control_signal=5'b01101;
end
endmodule









