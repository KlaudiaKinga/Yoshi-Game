//K.Bajur
module yoshi_sprite_2
    (
        input wire clk, reset,       
        input wire btnU, btnL, btnR, 
        input wire video_on,         
        input wire [9:0] x, y,       
	input wire grounded,         
	input wire game_over_yoshi,  
	input wire collision,        
        output reg [11:0] rgb_out,   
        output reg yoshi_on,         
        output wire [9:0] y_x, y_y,  
	output wire jumping_up,      
	output wire direction        
    );
    parameter X_LOCATION = 100;
    
    
    localparam MAX_X = 640;
    localparam MAX_Y = 480;
    localparam MIN_Y =  16;
   
    
    localparam T_W = 16;
    localparam T_H = 16;
   
    
    localparam X_MAX = 25;
   
    
    localparam X_D = 9;
   
    /***********************************************************************************/
    /*                           sprite location registers                             */  
    /***********************************************************************************/
    
    reg [9:0] s_x_reg, s_y_reg;
    reg [9:0] s_x_next, s_y_next;
   
    
    always @(posedge clk, posedge reset)
        if (reset)
            begin
            s_x_reg     <= X_LOCATION;                 
            s_y_reg     <= MAX_Y - 2*T_H - 16;  
            end
        else
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
       
        if(btnL && !btnR)     
            dir_next = LEFT;  
           
        if(btnR && !btnL)     
            dir_next = RIGHT;
        end
   
    /***********************************************************************************/
    /*                           FSMD for x motion and momentum                        */  
    /***********************************************************************************/
   
    
    localparam [1:0] no_dir = 2'b00,
                     left = 2'b01,
                    right = 2'b10;      

    
    
    
    
    
    
    
    
    
    
                     
    
    localparam TIME_START_X  =   800000;  
    localparam TIME_STEP_X   =     6000;  
    localparam TIME_MIN_X    =   500000;  
               
    reg [1:0] x_state_reg, x_state_next;  
    reg [19:0] x_time_reg, x_time_next;   
    reg [19:0] x_start_reg, x_start_next; 
   
    
    always @(posedge clk, posedge reset)
        if (reset)
            begin
            x_state_reg <= no_dir;
            x_start_reg <= 0;
            x_time_reg  <= 0;
            end
        else
            begin
            x_state_reg <= x_state_next;
            x_start_reg <= x_start_next;
            x_time_reg  <= x_time_next;
            end
   
    
    always @*
        begin
        
        s_x_next     = s_x_reg;
        x_state_next = x_state_reg;
        x_start_next = x_start_reg;
        x_time_next  = x_time_reg;
       
        case (x_state_reg)
            
            no_dir:
                begin
                if(btnL && !btnR && (s_x_reg >= 1))                             
                    begin
                    x_state_next = left;                                        
                    x_time_next  = TIME_START_X;                                
                    x_start_next = TIME_START_X;                                
                    end
                else if(!btnL && btnR && (s_x_reg + 1 < MAX_X - T_W - X_D + 1)) 
                    begin
                    x_state_next = right;                                       
                    x_time_next  = TIME_START_X;                                
                    x_start_next = TIME_START_X;                                
                    end
                end
               
            left:
                begin
                if(x_time_reg > 0)                                              
                    x_time_next = x_time_reg - 1;                               
                   
                else if(x_time_reg == 0)                                        
                    begin 
                    if(s_x_reg >= 17)                                           
                        s_x_next = s_x_reg - 1;                                 
                    
		    if(btnL && x_start_reg > TIME_MIN_X)                    	
                        begin                                                   
                        x_start_next = x_start_reg - TIME_STEP_X;               
                        x_time_next  = x_start_reg - TIME_STEP_X;               
                        end
                       
                    else if(btnR && x_start_reg < TIME_START_X)                 
                        begin                                                   
                        x_start_next = x_start_reg + TIME_STEP_X;               
                        x_time_next  = x_start_reg + TIME_STEP_X;               
                        end
                    else                                                        
                        begin
                        x_start_next = x_start_reg;                             
                        x_time_next  = x_start_reg;                             
                        end
                    end
                   
                if(grounded && (!btnL || (btnL && btnR)))                       
                    x_state_next = no_dir;                                      
                else if(!grounded && btnR && x_start_reg >= TIME_START_X)       
                    begin
		    x_state_next = right;                                       
		    x_time_next  = TIME_START_X;                                
                    x_start_next = TIME_START_X;                                
		    end
		end
			
	    right:
                begin
		if(x_time_reg > 0)                                              
			x_time_next = x_time_reg - 1;                           
				
		else if(x_time_reg == 0)                                        
			begin
			if(s_x_reg + 1 < MAX_X - T_W - X_D - 15)                
			s_x_next = s_x_reg + 1;                                 
						
			if(btnR && x_start_reg > TIME_MIN_X)                    
				begin                                           
				x_start_next = x_start_reg - TIME_STEP_X;       
				x_time_next  = x_start_reg - TIME_STEP_X;       
				end
			else if(btnL && x_start_reg < TIME_START_X)             
				begin                                           
				x_start_next = x_start_reg + TIME_STEP_X;       
				x_time_next  = x_start_reg + TIME_STEP_X;       
				end
						
			else                                                        
				begin
				x_start_next = x_start_reg;                         
				x_time_next  = x_start_reg;                         
				end
			end
				
		if(grounded && (!btnR || (btnL && btnR)))                       
			x_state_next = no_dir;                                  
		else if(!grounded && btnL && x_start_reg >= TIME_START_X)       
			begin
			x_state_next = left;                                        
			x_time_next  = TIME_START_X;                                
                        x_start_next = TIME_START_X;                                
			end
		end	
		endcase
		end    
                   
    /***********************************************************************************/
    /*              FSMD for Sprite standing/walking states, and y motion              */  
    /***********************************************************************************/  
   
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    localparam [2:0] standing   = 3'b000, 
                     walking    = 3'b001, 
                     jump_up    = 3'b010, 
                     jump_extra = 3'b011, 
                     jump_down  = 3'b100; 
                     
    
    localparam TIME_START_Y      =   100000;  
    localparam TIME_STEP_Y       =     8000;  
    localparam TIME_MAX_Y        =   600000;  
    localparam TIME_TERM_Y       =   250000;  
    localparam BEGIN_COUNT_EXTRA =   450000;  
    localparam TILE_1_MAX        =  7000000;  
    localparam TILE_2_MAX        = 14000000;  
    localparam WALK_T_MAX        = 21000000;  
   
    reg [2:0] state_reg_y, state_next_y;    
    reg [24:0] walk_t_reg, walk_t_next;     
    reg [19:0] jump_t_reg, jump_t_next;     
    reg [19:0] start_reg_y, start_next_y;   
    reg [6:0] dy;                           
    reg [25:0] extra_up_reg, extra_up_next; 
   
   
    
    reg [7:0] btnU_reg;
    wire btnU_edge;
    assign btnU_edge = ~(&btnU_reg) & btnU;
   
    
    always @(posedge clk, posedge reset)
        if(reset)
            begin
            state_reg_y  <= standing;
            walk_t_reg   <= 0;
            jump_t_reg   <= 0;
            start_reg_y  <= 0;
            extra_up_reg <= 0;
            btnU_reg     <= 0;
            end
        else
            begin
            state_reg_y  <= state_next_y;
            walk_t_reg   <= walk_t_next;
            jump_t_reg   <= jump_t_next;
            start_reg_y  <= start_next_y;
            extra_up_reg <= extra_up_next;
            btnU_reg     <= {btnU_reg[6:0], btnU};
            end
           
    
    always @*
        begin
        
        state_next_y  = state_reg_y;
        walk_t_next   = walk_t_reg;
        jump_t_next   = jump_t_reg;
        start_next_y  = start_reg_y;
        extra_up_next = extra_up_reg;
        s_y_next      = s_y_reg;
        dy            = 0;
       
        case (state_reg_y)
           
            standing:
                begin
                dy = 0;                                 
				
                if((btnL && !btnR)  || (!btnL && btnR)) 
                    begin
                    state_next_y = walking;             
                    walk_t_next = 0;                    
                    end
                   
                if(btnU_edge)                           
                    begin
                    state_next_y = jump_up;             
                    start_next_y = TIME_START_Y;        
                    jump_t_next = TIME_START_Y;         
                    extra_up_next = 0;
                    end
                end
       
            walking:
                begin
		if(!grounded)
		    begin
                    state_next_y = jump_down;           
                    start_next_y = TIME_MAX_Y;          
                    jump_t_next  = TIME_MAX_Y;          
                    end
				
		if((!btnL && !btnR) || (btnL && btnR))  
                    state_next_y = standing;                 
				
		if(btnU_edge)                           
                    begin
                    state_next_y = jump_up;             
                    start_next_y = TIME_START_Y;        
                    jump_t_next = TIME_START_Y;         
                    extra_up_next = 0;                  
                    end
					
                if(walk_t_reg < WALK_T_MAX)             
                    walk_t_next = walk_t_reg + 1;       
                else
                    walk_t_next = 0;                    
               
                
                if(walk_t_reg <= TILE_1_MAX)            
                    dy = T_H;                           
                else if (walk_t_reg <= TILE_2_MAX)      
                    dy = 2*T_H;                         
                else if(walk_t_reg < WALK_T_MAX)        
                    dy = 0;                             
                end
 
            jump_up:
                begin
                dy = 3*T_H;                                       
               
                if(jump_t_reg > 0)                                
                    begin
                    jump_t_next = jump_t_reg - 1;                 
                    end
                   
                if(jump_t_reg == 0)                               
                    begin
                    if(btnU && start_reg_y > BEGIN_COUNT_EXTRA)   
                        extra_up_next = extra_up_reg + 1;         
                    
		    if( s_y_next > MIN_Y)                 	
			s_y_next = s_y_reg - 1;                   
                else 				                  
			begin
			state_next_y = jump_down;                 
			start_next_y = TIME_MAX_Y;                
                        jump_t_next  = TIME_MAX_Y;                
			end
						
		    if(start_reg_y <= TIME_MAX_Y)                 
                        begin
                        start_next_y = start_reg_y + TIME_STEP_Y; 
                        jump_t_next = start_reg_y + TIME_STEP_Y;  
                        end
                    else                                          
                        begin
                        state_next_y = jump_extra;                
                        extra_up_next = extra_up_reg << 1;
                        start_next_y = TIME_MAX_Y;                
                        jump_t_next  = TIME_MAX_Y;                
                        end
                    end
                end
               
            jump_extra:
                begin
                dy = 3*T_H;                                 
               
                if(extra_up_reg == 0)                       
                    begin
                    state_next_y = jump_down;               
                    start_next_y = TIME_MAX_Y;              
                    jump_t_next  = TIME_MAX_Y;              
                    end
               
                if(jump_t_reg > 0)                          
                    begin
                    jump_t_next = jump_t_reg - 1;           
                    end
                   
                if(jump_t_reg == 0)                         
                    begin
                    extra_up_next = extra_up_reg - 1;       
                    
		    if( s_y_next > MIN_Y)                   
			s_y_next = s_y_reg - 1;             
                    else 									
			state_next_y = jump_down;           
	
		    start_next_y = TIME_MAX_Y;              
                    jump_t_next = TIME_MAX_Y;               
                    end
                end
           
            jump_down:
                begin
                dy = 2*T_H;                                           
                if(jump_t_reg > 0)                                    
                    begin
                    jump_t_next = jump_t_reg - 1;                     
                    end
                   
                if(jump_t_reg == 0)                                   
                    begin
                    if(!grounded)                                      
                        begin
                        s_y_next = s_y_reg + 1;                       
                        if(start_reg_y > TIME_TERM_Y)                 
                            begin
                            start_next_y = start_reg_y - TIME_STEP_Y; 
                            jump_t_next = start_reg_y - TIME_STEP_Y;  
                            end
                        else
                            begin  
                            jump_t_next = TIME_TERM_Y;
                            end
                        end
                    else                                              
                        state_next_y = standing;                      
                    end
                end
        endcase
        end
       
    /***********************************************************************************/
    /*                                     ROM indexing                                */  
    /***********************************************************************************/  
                   
    
    
    wire [3:0] col;
    wire [6:0] row;
   
    
	
    assign col = (dir_reg == RIGHT && head_on)  ? (X_D + T_W - 1 - (x - s_x_reg)) :
                 (dir_reg == LEFT  && head_on)  ?                 ((x - s_x_reg)) :
                 (dir_reg == RIGHT && torso_on) ?       (T_W - 1 - (x - s_x_reg)) :
                 (dir_reg == LEFT  && torso_on) ?           ((x - s_x_reg - X_D)) : 0;
    
    
    assign row = head_on  ? (y - s_y_reg):
                 torso_on ? (dy + y - s_y_reg): 0;
				 
    
   
    
    wire [11:0] color_data_yoshi, color_data_yoshi_ghost;
   
    
    yoshi_mem_2 yoshi_mem_2_inst (.clk(clk), .row(row), .col(col), .color_data(color_data_yoshi));
	
    
    yoshi_soul_mem yoshi_soul_mem_inst (.clk(clk), .row(row), .col(col), .color_data(color_data_yoshi_ghost));
	
    
    wire head_on, torso_on;
    assign head_on = (dir_reg == RIGHT) && (x >= s_x_reg + X_D) && (x <= s_x_reg + X_MAX - 1) && (y >= s_y_reg) && (y <= s_y_reg + T_H - 1) ? 1
                   : (dir_reg == LEFT) && (x >= s_x_reg) && (x <= s_x_reg + T_W - 1) && (y >= s_y_reg) && (y <= s_y_reg + T_H - 1) ? 1 : 0;
   
    assign torso_on = (dir_reg == RIGHT) && (x >= s_x_reg) && (x <= s_x_reg + T_W - 1) && (y >= s_y_reg + T_H) && (y <= s_y_reg + 2*T_H - 1) ? 1
                    : (dir_reg == LEFT) && (x >= s_x_reg + X_D) && (x <= s_x_reg + X_MAX - 1) && (y >= s_y_reg + T_H) && (y <= s_y_reg + 2*T_H - 1) ? 1 : 0;
   
    
    assign y_x = s_x_reg;
    assign y_y = s_y_reg;
    assign jumping_up = (state_reg_y == jump_up) ? 1 : 0;
    assign direction = dir_reg;
	
    
    reg [27:0] collision_time_reg;
    wire [27:0] collision_time_next;
	
    
    always @(posedge clk, posedge reset)
	if(reset)
		collision_time_reg <= 0;
	else 
		collision_time_reg <= collision_time_next;
	
    
    assign collision_time_next = collision ? 200000000 : 
								 collision_time_reg > 0 ? collision_time_reg - 1 : 0;
       
    
    always @*
		begin
		
		yoshi_on = 0;
		rgb_out = 0;
		
		if(head_on || torso_on && video_on)               
			begin
			if(game_over_yoshi || collision_time_reg > 0) 
				rgb_out = color_data_yoshi_ghost;         
			else
				rgb_out = color_data_yoshi;               
		
			if(rgb_out != 12'b011011011110)               
					yoshi_on = 1;                         
			end
        end
endmodule
