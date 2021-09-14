//K.Brudz
module bcd_converter
	(
		input wire clk, reset,        
		input wire start,             
		input wire [13:0] in,         
		output wire [3:0] bcd3, bcd2, 
  		                  bcd1, bcd0
	);
	
	
	reg  state_reg, state_next;                                
	reg [13:0] input_reg, input_next;                          
	reg [3:0] count_reg, count_next;                           
	reg [3:0] bcd_3_reg, bcd_2_reg, bcd_1_reg, bcd_0_reg,      
              bcd_3_next, bcd_2_next, bcd_1_next, bcd_0_next;  
    	wire [3:0] bcd_3_temp, bcd_2_temp, bcd_1_temp, bcd_0_temp; 
	
	
			  
	
	localparam idle    = 1'b0,
		   convert = 1'b1;
			   
	
	always @(posedge clk, posedge reset)
		if (reset)
			begin
			state_reg <= idle;
		    	input_reg <= 0;
		    	count_reg <= 0;
		    	bcd_3_reg <= 0;
		    	bcd_2_reg <= 0;
		    	bcd_1_reg <= 0;
		    	bcd_0_reg <= 0;
	            	end
		else
			begin
            		state_reg <= state_next;
            		input_reg <= input_next;
            		count_reg <= count_next;
            		bcd_3_reg <= bcd_3_next;
            		bcd_2_reg <= bcd_2_next;
            		bcd_1_reg <= bcd_1_next;
            		bcd_0_reg <= bcd_0_next;
			end
			
	
	always @*
		begin
		
		state_next = state_reg;
		input_next = input_reg;
		count_next = count_reg;
		bcd_0_next = bcd_0_reg;
		bcd_1_next = bcd_1_reg;
		bcd_2_next = bcd_2_reg;
		bcd_3_next = bcd_3_reg;
		
		case (state_reg)
			
			idle:
				begin
				if (start)
					begin
                     			state_next = convert; 
                     			bcd_0_next = 0;       
                     			bcd_1_next = 0;
                     			bcd_2_next = 0;
                     			bcd_3_next = 0;
                     			count_next = 0;       
                     			input_next = in;      
					 end
				end
				
			convert:
				begin
				
               			input_next = input_reg << 1;                     
               			bcd_0_next = {bcd_0_temp[2:0], input_reg[13]};   
               			bcd_1_next = {bcd_1_temp[2:0], bcd_0_temp[3]};   
               			bcd_2_next = {bcd_2_temp[2:0], bcd_1_temp[3]};   
               			bcd_3_next = {bcd_3_temp[2:0], bcd_2_temp[3]};   
			   
			   	
               			count_next = count_reg + 1;
               
			  	 
			  	 if (count_next== 14)
                  			 state_next = idle;
            			end
		endcase
		end
	
	
	assign bcd_0_temp = (bcd_0_reg > 4) ? bcd_0_reg + 3 : bcd_0_reg;
	assign bcd_1_temp = (bcd_1_reg > 4) ? bcd_1_reg + 3 : bcd_1_reg;
	assign bcd_2_temp = (bcd_2_reg > 4) ? bcd_2_reg + 3 : bcd_2_reg;
	assign bcd_3_temp = (bcd_3_reg > 4) ? bcd_3_reg + 3 : bcd_3_reg;
	
	
	assign bcd0 = bcd_0_reg;
	assign bcd1 = bcd_1_reg;
	assign bcd2 = bcd_2_reg;
	assign bcd3 = bcd_3_reg;

endmodule
