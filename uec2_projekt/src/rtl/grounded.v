//K.brudz
module grounded
    (
        input wire clk, reset,     
        input wire [9:0] y_x, y_y, 
        input wire jumping_up,     
	input wire direction,       
	output wire grounded       
    );
   
    
    
    localparam MAX_X = 640;
    localparam MAX_Y = 480;
   
    
    localparam T_W = 16;
    localparam T_H = 16;
   
    
    localparam X_MAX = 25;
   
    
    localparam X_D   = 9;
    localparam LA    = 19;
    localparam LB    = 13;
    localparam RA    = 11;
    localparam RB    =  5;
    localparam LEFT  =  0;
    localparam RIGHT =  1;
	
    
    reg grounded_reg, grounded_next;
	
    
    always @(posedge clk, posedge reset)
	if(reset)
		grounded_reg <= 1;
	else
		grounded_reg <= grounded_next;
	
    
    always @*
		begin
		
		grounded_next = grounded_reg;
		
		
        	
		
		if(!jumping_up)
			begin
			
			
			if(direction == LEFT && (y_y == 132 - 2*T_H) && (y_x >= 16) && (y_x < 160 - LB))
				grounded_next = 1;
			
			else if(direction == RIGHT && (y_y == 132 - 2*T_H) && (y_x >= 16) && (y_x < 160 - RB))
				grounded_next = 1;
			
			
			else if(direction == LEFT && (y_y == 132 - 2*T_H) && (y_x >= 480 - LA) && (y_x < 624))
				grounded_next = 1;
			
			else if(direction == RIGHT && (y_y == 132 - 2*T_H) && (y_x >= 480 - RA) && (y_x < 624))
				grounded_next = 1;
			
			
			else if(direction == LEFT && (y_y == 215 - 2*T_H) && (y_x >= 80 - LA) && (y_x < 561 - LB))
				grounded_next = 1;
			
			else if(direction == RIGHT && (y_y == 215 - 2*T_H) && (y_x >= 80 - RA) && (y_x < 561 - RB))
				grounded_next = 1;
			
			
			else if(direction == LEFT && (y_y == 298 - 2*T_H) && (y_x >= 16) && (y_x < 256 - LB))
				grounded_next = 1;
			
			else if(direction == RIGHT && (y_y == 298 - 2*T_H) && (y_x >= 16) && (y_x < 256 - RB))
				grounded_next = 1;
				
			
			else if(direction == LEFT && (y_y == 298 - 2*T_H) && (y_x >= 384 - LA) && (y_x < 624 - LB))
				grounded_next = 1;
			
			else if(direction == RIGHT && (y_y == 298 - 2*T_H) && (y_x >= 384 - RA) && (y_x < 624 - RB))
				grounded_next = 1;
			
			
			else if(direction == LEFT && (y_y == 381 - 2*T_H) && (y_x > 112 - LA) && (y_x < 529 - LB))
				grounded_next = 1;
			
			else if(direction == RIGHT && (y_y == 381 - 2*T_H) && (y_x > 112 - RA) && (y_x < 529 - RB))
				grounded_next = 1;
				
			
			else if((y_y == MAX_Y - 2*T_H - 16))
				grounded_next = 1;
	
			else 
				grounded_next = 0;
			end
		else 
			grounded_next = 0;
		end	
	
	assign grounded = grounded_reg;
endmodule  
