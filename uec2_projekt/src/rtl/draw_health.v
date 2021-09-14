//K.Brudz
module draw_health
	(	
	    input wire clk,                
	    input wire [9:0] x, y,         
	    input wire [1:0] num_hearts,   
	    output wire [11:0] color_data, 
	    output reg hearts_on           
        );	
	
	
	reg [4:0] row;
	reg [3:0] col;
	
	
	heart_mem heart_mem_inst(.clk(clk), .row(row), .col(col), .color_data(color_data));
	
	
	always @* 
		begin
		
		row = 0;
		col = 0;
		hearts_on = 0;
		
		
		if(x >= 240 && x < 256 && y >= 16 && y < 32)
			begin
			col = x - 240;                     
			if(num_hearts > 0)                 
				row = y - 16;                  
			else 
				row = y;                       
			if(color_data != 12'b011011011110) 
				hearts_on = 1;                 
			end
		
		
		if(x >= 256 && x < 272 && y >= 16 && y < 32)
			begin
			col = x - 256;                     
			if(num_hearts > 1)                 
				row = y - 16;                  
			else 
				row = y;                       
			if(color_data != 12'b011011011110) 
				hearts_on = 1;                 
			end
		
		
		
		if(x >= 272 && x < 288 && y >= 16 && y < 32)
			begin
			col = x - 272;                     
			if(num_hearts > 2)                 
				row = y - 16;                  
			else 
				row = y;                       
			if(color_data != 12'b011011011110) 
				hearts_on = 1;                 
			end
		end
endmodule
