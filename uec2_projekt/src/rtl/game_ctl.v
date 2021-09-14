//K.Bajur
module game_ctl
	(	
		input wire clk, hard_reset,   
		input wire start,             
        	input wire collision,         
		output wire [1:0] num_hearts, 
		output wire [2:0] game_state, 
		output wire game_en,          
		output reg game_reset         
        );
	
	
	reg start_reg;
	wire start_posedge;
	
	
	always @(posedge clk, posedge hard_reset)
		if(hard_reset)
			start_reg <= 0;
		else 
			start_reg <= start;
	
	
	assign start_posedge = start & ~start_reg;
	
	
	localparam [2:0] init     = 3'b000,  
			 idle     = 3'b001,  
		         playing  = 3'b010,  
			 hit      = 3'b011,  
			 gameover = 3'b100;  
	
	reg [2:0] game_state_reg, game_state_next; 
	reg [27:0] timeout_reg, timeout_next;      
	reg [1:0] hearts_reg, hearts_next;         
	reg game_en_reg, game_en_next;             
	
	
	always @(posedge clk, posedge hard_reset)
		if(hard_reset)
			begin
			game_state_reg <= init;
			timeout_reg    <= 20000000;
			hearts_reg     <= 3;
			game_en_reg    <= 0;
			end
		else
			begin
			game_state_reg <= game_state_next;
			timeout_reg    <= timeout_next;
			hearts_reg     <= hearts_next;
			game_en_reg    <= game_en_next;
			end
	
	always @*
		begin
		
		game_state_next = game_state_reg;
		timeout_next    = timeout_reg;
		hearts_next     = hearts_reg;
		game_en_next    = game_en_reg;
		game_reset = 0;
		
		case(game_state_reg)
			
			init:
				begin	
				if(timeout_reg > 0)                   
					timeout_next = timeout_reg - 1;
				else 
					game_state_next = idle;           
				end
				
			idle:
				begin
				if(start_posedge)                     
					begin
					game_en_next = 1;                 
					game_reset   = 1;                 
					game_state_next = playing;        
					end
				end
			
			playing:
				begin
				if(collision)                         
					begin
					if(hearts_reg == 1)               
						begin
						hearts_next = hearts_reg - 1; 
						game_en_next = 0;             
						game_state_next = gameover;   
						end
					else
						begin
						hearts_next = hearts_reg - 1; 
						game_state_next = hit;        
						timeout_next = 200000000;     
						end
					end
				end
				
			hit:
				begin	                              
				if(timeout_reg > 0)                   
					timeout_next = timeout_reg - 1;
				else 
					game_state_next = playing;        
				end
			
			gameover:                                 
				begin
				if(start_posedge)                     
					begin
					hearts_next = 3;                  
					game_state_next = init;           
					game_reset   = 1;                 
					end
				end
				
			endcase
			end
	
	
	assign num_hearts = hearts_reg;
	assign game_state = game_state_reg;
	assign game_en = game_en_reg;

endmodule
