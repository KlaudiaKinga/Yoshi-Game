//K.Bajur, K.Brudz

module uart_receiver(
    input clk,
    input reset,
    input Data_in,
    input tick,
    output reg[7:0] dout,
    output reg load
    );

reg start_flag;

reg [7:0]shift_reg;

reg [3:0]counter;
reg [3:0]bit_cnt;

always@(posedge clk)
if(reset) 
	begin
	shift_reg<=0;
	counter<=0;
	bit_cnt<=0;
	start_flag<=0;
	end
else
	begin
		load <= 0; 
		if(!start_flag)begin 
			if(!Data_in && tick) 
				if(counter==7)    
					begin
					start_flag<=1; 
					counter<=0;    
					end
				else
				   counter<=counter+1;end 
		else if(tick)  
					if(counter == 15 && bit_cnt==8) 
						begin
						load<=1;             
						counter<=0;
						dout<=shift_reg[7:0]; 
						start_flag<=0;        
						bit_cnt<=0;
						end
					else if(counter == 15) 
						begin
						counter<=0;         
						shift_reg<={Data_in,shift_reg[7:1]}; 
						bit_cnt<=bit_cnt+1;  
						end
					else
						counter<=counter+1; 
	end
endmodule
