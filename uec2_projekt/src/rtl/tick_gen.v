//K.Bajur, K.Brudz

module tick_gen(
    input reset,
    input clk,
    output tick
    );
parameter max = 2604 ;
reg[31:0]counter;
assign tick=(counter==max)?1'b1:1'b0;
always@(posedge clk)
	if(reset)
		counter<=0;
	else if(counter==max)
		counter<=0;
	else
		counter<=counter+1;
endmodule
