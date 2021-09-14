//K.Bajur, K.Brudz

module baud_rate_gen(
    input clk,
	 input reset,
    output tick
    );
parameter max = 163 ;
reg[31:0]counter;
assign tick=(counter==max-1)?1'b1:1'b0;
always@(posedge clk)
	if(reset)
		counter<=0;
	else if(counter==max-1)
		counter<=0;
	else
		counter<=counter+1;
endmodule
