//K.Bajur, K.Brudz
module display_top
	(
		input  wire clk, hard_reset, 
		input  wire ps2c,ps2d,       
		output wire hsync, vsync,    
		output wire [11:0] rgb,      
		output wire [7:0] sseg,      
		output wire [3:0] an,         
	 
	 /* UART signals */
		input Serial_in,
		output Serial_out
	);
	
	
	
    wire up, left, right, start;                                  
	localparam idle = 3'b001;                                     
	localparam gameover = 3'b100;                                 
	wire [1:0] num_hearts;                                        
	wire [2:0] game_state;                                        
	wire game_en;                                                 
	wire game_reset;                                              
    wire reset;                                                   
	assign reset = hard_reset || game_reset;                      
	wire [9:0] x, y;                                              
	wire video_on, pixel_tick;                                    
	reg [11:0] rgb_reg, rgb_next;                                 
	wire [9:0] y_x, y_y;                                          
	wire [9:0] y_x_2, y_y_2;                                          
	wire [9:0] g_c_x, g_c_y;                                      
	wire [9:0] g_t_x, g_t_y;                                      
	wire [9:0] g_b_x, g_b_y;                                      
	wire grounded, jumping_up, direction;                         
	wire grounded_2, jumping_up_2, direction_2;
	wire collision;                                               
	wire collision_2;
	wire [13:0] score;                                            
	wire new_score;                                               
	wire [11:0]  yoshi_2_rgb, yoshi_rgb, platforms_rgb, ghost_crazy_rgb,        
				 ghost_bottom_rgb, ghost_top_rgb, bg_rgb,
				 eggs_rgb, hearts_rgb,
				 gameover_rgb;
	wire yoshi_on, yoshi_2_on, platforms_on, ghost_crazy_on, ghost_bottom_on, 
	     ghost_top_on, eggs_on, score_on, hearts_on, game_logo_on,
	     gameover_on;
		 
	wire [25:0] speed_offset; 
	assign speed_offset = (({14'b0, score[13:2]} << 12) < 2750000) ? ({14'b0, score[13:2]} << 12) : 2750000;
	
	
    	
	wire yoshi_up, yoshi_left, yoshi_right;
	wire yoshi_2_up, yoshi_2_left, yoshi_2_right;
	assign yoshi_up = up & game_en;
	assign yoshi_left = left & game_en;
	assign yoshi_right = right & game_en;
	
	
	wire game_over_yoshi;
	assign game_over_yoshi = (game_state == gameover) ? 1 : 0;
	
	
	
	
	vga_timing vga_timing_inst (.clk(clk), .reset(hard_reset), .hsync(hsync), .vsync(vsync),
                             .video_on(video_on), .p_tick(pixel_tick), .x(x), .y(y));
    
    wire start_tx;
    wire [7:0] TX_data;
    wire [7:0] RX_data;
    
    assign yoshi_2_up    = (RX_data==8'b01010111)?1'b1:1'b0; 
    assign yoshi_2_left  = (RX_data==8'b01000001)?1'b1:1'b0;
    assign yoshi_2_right = (RX_data==8'b01000100)?1'b1:1'b0;
    
    uart_ctl#(9600, 100000000) uart_ctl_inst (
        .clk(clk), 
        .reset(1'b0), 
        .RX_done(), 
        .RX_data(RX_data), 
        .tx_ready(), 
        .TX_data(TX_data), 
        .start_tx(start_tx), 
        .Serial_in(Serial_in), 
        .Serial_out(Serial_out)
        );
        
	
	PS2 controller (
	               .resetn(1'b1), .clk(clk),  .ps2c(ps2c), .ps2d(ps2d), 
	               .data_valid(start_tx), .TX_data(TX_data),
				   .up(up), .start(start), .left(left), .right(right));
	
	
	yoshi_sprite #(.X_LOCATION(100)) yoshi_sprite_inst (.clk(clk), .reset(reset), .btnU(yoshi_up),
				 .btnL(yoshi_left), .btnR(yoshi_right), .video_on(video_on), .x(x), .y(y),
				 .grounded(grounded), .game_over_yoshi(game_over_yoshi), .collision(collision),
				 .rgb_out(yoshi_rgb),.yoshi_on(yoshi_on), .y_x(y_x), .y_y(y_y), 
				 .jumping_up(jumping_up), .direction(direction));
	



	yoshi_sprite_2 #(.X_LOCATION(200)) yoshi_sprite_inst_2 (.clk(clk), .reset(reset), .btnU(yoshi_2_up),
				     .btnL(yoshi_2_left), .btnR(yoshi_2_right), .video_on(video_on), .x(x), .y(y),
				     .grounded(grounded_2), .game_over_yoshi(game_over_yoshi), .collision(collision_2),
				     .rgb_out(yoshi_2_rgb),.yoshi_on(yoshi_2_on), .y_x(y_x_2), .y_y(y_y_2), 
				     .jumping_up(jumping_up_2), .direction(direction_2));	
	
	mad_ghost mad_ghost_inst (.clk(clk), .reset(reset), .y_x(y_x_2), .y_y(y_y_2),
				      .x(x), .y(y), .speed_offset(speed_offset), .g_c_x(g_c_x), .g_c_y(g_c_y),
				      .ghost_crazy_on(ghost_crazy_on), .rgb_out(ghost_crazy_rgb));
	
	
	ghost_top ghost_top_inst (.clk(clk), .reset(reset), .y_x(y_x), .y_y(y_y),
				  .x(x), .y(y), .speed_offset(speed_offset), .g_t_x(g_t_x), .g_t_y(g_t_y),
				  .ghost_top_on(ghost_top_on), .rgb_out(ghost_top_rgb));
	
	
	ghost_bottom ghost_bottom_inst (.clk(clk), .reset(reset), .y_x(y_x), .y_y(y_y),
					.x(x), .y(y), .speed_offset(speed_offset), .g_b_x(g_b_x), .g_b_y(g_b_y),
					.ghost_bottom_on(ghost_bottom_on), .rgb_out(ghost_bottom_rgb));
    
	
    floors floors_inst (.clk(clk), .video_on(video_on), .x(x), .y(y), .rgb_out(platforms_rgb),
	                .platforms_on(platforms_on));
	
	
	grounded grounded_inst_1 (.clk(clk), .reset(reset), .y_x(y_x), .y_y(y_y), .jumping_up(jumping_up),
                        	.direction(direction), .grounded(grounded));
	grounded grounded_inst_2 (.clk(clk), .reset(reset), .y_x(y_x_2), .y_y(y_y_2), .jumping_up(jumping_up_2),
                        	.direction(direction_2), .grounded(grounded_2));	
	
	ghost_background_mem ghost_background_mem_inst (.clk(clk), .row(y[7:0]), .col(x[7:0]), .color_data(bg_rgb));
	
	
	collision_ctl collision_ctl_inst (.direction(direction), .y_x(y_x), .y_y(y_y), .g_c_x(g_c_x),
                                              .g_c_y(g_c_y), .g_t_x(g_t_x), .g_t_y(g_t_y), .g_b_x(g_b_x),
					      .g_b_y(g_b_y), .collision(collision)); 
	collision_ctl collision_ctl_inst_2 (.direction(direction), .y_x(y_x_2), .y_y(y_y_2), .g_c_x(g_c_x),
                                              .g_c_y(g_c_y), .g_t_x(g_t_x), .g_t_y(g_t_y), .g_b_x(g_b_x),
					      .g_b_y(g_b_y), .collision(collision_2)); 	
	
	egg_ctl egg_ctl_inst(.clk(clk), .reset(reset), .y_x(y_x), .y_y(y_y), .direction(direction),
		       .x(x), .y(y), .eggs_on(eggs_on), .rgb_out(eggs_rgb), .score(score), .new_score(new_score));

	
	draw_score draw_score_inst(.clk(clk), .reset(reset), .new_score(new_score), .score(score),
					  .x(x), .y(y), .sseg(sseg), .an(an), .score_on(score_on));		   
	
	
	draw_health draw_health_inst(.clk(clk), .x(x), .y(y), .num_hearts(num_hearts),
					    .color_data(hearts_rgb), .hearts_on(hearts_on));
	
	
	game_ctl game_ctl_inst(.clk(clk), .hard_reset(hard_reset), .start(start), .collision(collision),
				     .num_hearts(num_hearts), .game_state(game_state), .game_en(game_en),
				     .game_reset(game_reset));
	
	
	draw_end draw_end_inst(.clk(clk), .x(x), .y(y), .rgb_out(gameover_rgb),
	                                        .gameover_on(gameover_on));

	
	
    	always @*
		begin
        	if (~video_on)
			rgb_next = 12'b0; 
        	else if(score_on)
			rgb_next = 12'hFFF;
				
		else if(hearts_on)
			rgb_next = hearts_rgb;
				
		else if(gameover_on && game_state == gameover)
			rgb_next = gameover_rgb;
				
        else if(ghost_crazy_on && game_state != idle)	
			rgb_next = ghost_crazy_rgb;
				
		else if(ghost_bottom_on && game_state != idle)
			rgb_next = ghost_bottom_rgb;
				
		else if(ghost_top_on && game_state != idle)
			rgb_next = ghost_top_rgb;
				
		else if (yoshi_on && game_state != idle)
			rgb_next = yoshi_rgb;       
		else if (yoshi_2_on && game_state != idle)
		    rgb_next = yoshi_2_rgb; 		
		else if (eggs_on && game_en)
			rgb_next = eggs_rgb;
		
		else if(platforms_on)
                	rgb_next = platforms_rgb;
				
        else
            rgb_next = bg_rgb;			
		end
	
	
	always @(posedge clk)
		if (pixel_tick)
			rgb_reg <= rgb_next;		
			
	
	assign rgb = rgb_reg;

endmodule
