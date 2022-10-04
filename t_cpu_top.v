module t_cpu_top;
reg    clk, reset;

cpu_top n(clk, reset);

initial  begin clk=0; forever #50 clk=~clk; end
initial
begin
reset=1;
#150 reset=0;
end
endmodule


