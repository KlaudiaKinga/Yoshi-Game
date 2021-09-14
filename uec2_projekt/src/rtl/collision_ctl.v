//K.Brudz
module collision_ctl
	(
		input direction,                
		input wire [9:0] y_x, y_y,      
		input wire [9:0] g_c_x, g_c_y,  
		input wire [9:0] g_t_x, g_t_y,  
		input wire [9:0] g_b_x, g_b_y,  
		output wire collision           
    );
	
	
    localparam LEFT = 0;
    localparam RIGHT = 1;
	
	
	reg collide;
	
	always @*
		begin
		
		collide = 0;
		
		
		if(direction == LEFT)
			begin
			
			if((g_c_x + 13 > y_x && g_c_x < y_x + 13 && g_c_y + 13 > y_y && g_c_y < y_y + 13) ||
			   (g_c_x + 13 > y_x + 9 && g_c_x < y_x + 16 && g_c_y + 13 > y_y + 13 && g_c_y < y_y + 18))
			  collide = 1;
			  
			
			else if((g_t_x + 13 > y_x && g_t_x < y_x + 13 && g_t_y + 13 > y_y && g_t_y < y_y + 13) ||
			        (g_t_x + 13 > y_x + 9 && g_t_x < y_x + 16 && g_t_y + 13 > y_y + 13 && g_t_y < y_y + 18))
			  collide = 1;
			  
			
			else if((g_b_x + 13 > y_x && g_b_x < y_x + 13 && g_b_y + 13 > y_y && g_b_y < y_y + 13) ||
			        (g_b_x + 13 > y_x + 9 && g_b_x < y_x + 16 && g_b_y + 13 > y_y + 13 && g_b_y < y_y + 18))
			  collide = 1;
			end
		
		
		if(direction == RIGHT)
			begin
			
			if((g_c_x + 13 > y_x + 9 && g_c_x < y_x + 16 && g_c_y + 13 > y_y && g_c_y < y_y + 13) ||
			   (g_c_x + 13 > y_x && g_c_x < y_x + 13 && g_c_y + 13 > y_y + 13 && g_c_y < y_y + 18))
			  collide = 1;
			
			
			else if((g_t_x + 13 > y_x + 9 && g_t_x < y_x + 16 && g_t_y + 13 > y_y && g_t_y < y_y + 13) ||
			        (g_t_x + 13 > y_x && g_t_x < y_x + 13 && g_t_y + 13 > y_y + 13 && g_t_y < y_y + 18))
			  collide = 1;
			
			
			else if((g_b_x + 13 > y_x + 9 && g_b_x < y_x + 16 && g_b_y + 13 > y_y && g_b_y < y_y + 13) ||
			        (g_b_x + 13 > y_x && g_b_x < y_x + 13 && g_b_y + 13 > y_y + 13 && g_b_y < y_y + 18))
			  collide = 1;
			end
		end
	
	
	assign collision = collide;
			
endmodule