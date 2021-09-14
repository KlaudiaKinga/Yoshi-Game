//K.Bajur, K.Brudz

module ghost_top
    (
        input wire clk, reset,
        input wire [9:0] y_x, y_y,         
	input wire [9:0] x, y,             
	input wire [25:0] speed_offset,    
	output wire [9:0] g_t_x, g_t_y,    
        output ghost_top_on,               
	output wire [11:0] rgb_out         
    );
   
    
    
    localparam MAX_X = 640;
    localparam MAX_Y = 480;
   
    
    localparam T_W = 16;
   
    /***********************************************************************************/
    /*                           sprite location registers                             */  
    /***********************************************************************************/
    
    reg [9:0] s_x_reg, s_y_reg;
    reg [9:0] s_x_next, s_y_next;
   
    
    always @(posedge clk)
	begin
        s_x_reg     <= s_x_next;
        s_y_reg     <= s_y_next;
	end

    /***********************************************************************************/
    /*                                direction register                               */  
    /***********************************************************************************/
    
   
    
    localparam LEFT = 0;
    localparam RIGHT = 1;
   
    reg dir_reg, dir_next;
    
    
    always @(posedge clk, posedge reset)
        if (reset)
            dir_reg     <= RIGHT;
        else
            dir_reg     <= dir_next;
    
    
    always @*
        begin
        dir_next = dir_reg;

	if(y_x < s_x_reg)
		dir_next = LEFT;
			
	if(y_x > s_x_reg)  
		dir_next = RIGHT;
        end

    /***********************************************************************************/
    /*                                sprite motion                                    */  
    /***********************************************************************************/
    
    localparam TIME_MAX    =   4600000; 

    reg [25:0] time_reg;   
    wire [25:0] time_next; 
    reg tick_reg;

    
    always @(posedge clk, posedge reset)
	if(reset)
		time_reg <= 0;
	else
		time_reg <= time_next;
	
    
    assign time_next = (time_reg < TIME_MAX - speed_offset) ? time_reg + 1 : 0;
			
    
    wire tick;
    assign tick = (time_reg == TIME_MAX - speed_offset) ? 1 : 0;
   
    
    always @(posedge tick, posedge reset)
		begin
		
		s_x_next = s_x_reg;
		s_x_next = s_x_reg;
		
		if(reset)
			s_x_next = 608;                 
			else if(y_y <= 231)             
			begin
			if(s_x_reg > y_x)       	
				s_x_next = s_x_reg - 1; 
			else if(s_x_reg < y_x)  	
				s_x_next = s_x_reg + 1; 
			end
		else 
			s_x_next = s_x_reg;         	
			
		if(reset)
			s_y_next = 17;            	
		else if(y_y <= 231)        		
			begin
			if(s_y_reg > y_y)       	
				s_y_next = s_y_reg - 1; 
			else if(s_y_reg < y_y) 		
				s_y_next = s_y_reg + 1; 
			end
		else 
			s_y_next = s_y_reg;         	
		end      
    
    /***********************************************************************************/
    /*                                     ROM indexing                                */  
    /***********************************************************************************/  
    
    
    reg [25:0] face_t_reg;
    wire [25:0] face_t_next;
	
    
    wire [5:0] face_type;
	
    
    always @(posedge clk, posedge reset)
	if(reset)
		face_t_reg <= 0;
	else 
		face_t_reg <= face_t_next;
	
    
    assign face_t_next = (face_t_reg < 40000000)? face_t_reg + 1 : 0;
	
    
    assign face_type = (face_t_reg < 20000000 || y_y > 231)? 0 : 16;
	
    
    
    wire [3:0] col;
    wire [4:0] row;
   
    
    
    assign col = dir_reg == RIGHT ? x - s_x_reg : (T_W - 1 - (x - s_x_reg)); 
    
    assign row = y + face_type - s_y_reg;
   
    
    wire [11:0] color_data;
	
    
    standard_ghost_mem standard_ghost_mem_inst (.clk(clk), .row(row), .col(col), .color_data(color_data));
   
    
    wire ghost_on;
    assign ghost_on = (x >= s_x_reg && x < s_x_reg + 16
                       && y >= s_y_reg && y < s_y_reg + 16)? 1 : 0;
					
    
    
    assign ghost_top_on = ghost_on && rgb_out != 12'b011011011110 ? 1 : 0;
	
    
    assign rgb_out = color_data;
	
    
    assign g_t_x = s_x_reg;
    assign g_t_y = s_y_reg;
	
endmodule
