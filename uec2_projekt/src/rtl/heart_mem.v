//K.Brudz
module heart_mem
	(
		input wire clk,
		input wire [4:0] row,
		input wire [3:0] col,
		output reg [11:0] color_data
	);

	(* rom_style = "block" *)

	
	reg [4:0] row_reg;
	reg [3:0] col_reg;

	always @(posedge clk)
		begin
		row_reg <= row;
		col_reg <= col;
		end

	always @*
	case ({row_reg, col_reg})
		9'b000000000: color_data = 12'b011011011110;
		9'b000000001: color_data = 12'b011011011110;
		9'b000000010: color_data = 12'b011011011110;
		9'b000000011: color_data = 12'b011011011110;
		9'b000000100: color_data = 12'b011011011110;
		9'b000000101: color_data = 12'b011011011110;
		9'b000000110: color_data = 12'b011011011110;
		9'b000000111: color_data = 12'b011011011110;
		9'b000001000: color_data = 12'b011011011110;
		9'b000001001: color_data = 12'b011011011110;
		9'b000001010: color_data = 12'b011011011110;
		9'b000001011: color_data = 12'b011011011110;
		9'b000001100: color_data = 12'b011011011110;
		9'b000001101: color_data = 12'b011011011110;
		9'b000001110: color_data = 12'b011011011110;
		9'b000001111: color_data = 12'b011011011110;

		9'b000010000: color_data = 12'b011011011110;
		9'b000010001: color_data = 12'b011011011110;
		9'b000010010: color_data = 12'b011011011110;
		9'b000010011: color_data = 12'b011011011110;
		9'b000010100: color_data = 12'b011011011110;
		9'b000010101: color_data = 12'b011011011110;
		9'b000010110: color_data = 12'b011011011110;
		9'b000010111: color_data = 12'b011011011110;
		9'b000011000: color_data = 12'b011011011110;
		9'b000011001: color_data = 12'b011011011110;
		9'b000011010: color_data = 12'b011011011110;
		9'b000011011: color_data = 12'b011011011110;
		9'b000011100: color_data = 12'b011011011110;
		9'b000011101: color_data = 12'b011011011110;
		9'b000011110: color_data = 12'b011011011110;
		9'b000011111: color_data = 12'b011011011110;

		9'b000100000: color_data = 12'b011011011110;
		9'b000100001: color_data = 12'b011011011110;
		9'b000100010: color_data = 12'b011011011110;
		9'b000100011: color_data = 12'b111111111111;
		9'b000100100: color_data = 12'b111111111111;
		9'b000100101: color_data = 12'b111111111111;
		9'b000100110: color_data = 12'b011011011110;
		9'b000100111: color_data = 12'b011011011110;
		9'b000101000: color_data = 12'b011011011110;
		9'b000101001: color_data = 12'b011011011110;
		9'b000101010: color_data = 12'b111111111111;
		9'b000101011: color_data = 12'b111111111111;
		9'b000101100: color_data = 12'b111111111111;
		9'b000101101: color_data = 12'b011011011110;
		9'b000101110: color_data = 12'b011011011110;
		9'b000101111: color_data = 12'b011011011110;

		9'b000110000: color_data = 12'b011011011110;
		9'b000110001: color_data = 12'b011011011110;
		9'b000110010: color_data = 12'b111111111111;
		9'b000110011: color_data = 12'b000000000000;
		9'b000110100: color_data = 12'b000000000000;
		9'b000110101: color_data = 12'b000000000000;
		9'b000110110: color_data = 12'b111111111111;
		9'b000110111: color_data = 12'b011011011110;
		9'b000111000: color_data = 12'b011011011110;
		9'b000111001: color_data = 12'b111111111111;
		9'b000111010: color_data = 12'b000000000000;
		9'b000111011: color_data = 12'b000000000000;
		9'b000111100: color_data = 12'b000000000000;
		9'b000111101: color_data = 12'b111111111111;
		9'b000111110: color_data = 12'b011011011110;
		9'b000111111: color_data = 12'b011011011110;

		9'b001000000: color_data = 12'b011011011110;
		9'b001000001: color_data = 12'b111111111111;
		9'b001000010: color_data = 12'b000000000000;
		9'b001000011: color_data = 12'b111100000000;
		9'b001000100: color_data = 12'b111100000000;
		9'b001000101: color_data = 12'b111100000000;
		9'b001000110: color_data = 12'b000000000000;
		9'b001000111: color_data = 12'b111111111111;
		9'b001001000: color_data = 12'b111111111111;
		9'b001001001: color_data = 12'b000000000000;
		9'b001001010: color_data = 12'b111100000000;
		9'b001001011: color_data = 12'b111100000000;
		9'b001001100: color_data = 12'b111100000000;
		9'b001001101: color_data = 12'b000000000000;
		9'b001001110: color_data = 12'b111111111111;
		9'b001001111: color_data = 12'b011011011110;

		9'b001010000: color_data = 12'b011011011110;
		9'b001010001: color_data = 12'b111111111111;
		9'b001010010: color_data = 12'b000000000000;
		9'b001010011: color_data = 12'b111100000000;
		9'b001010100: color_data = 12'b111100000000;
		9'b001010101: color_data = 12'b111100000000;
		9'b001010110: color_data = 12'b111100000000;
		9'b001010111: color_data = 12'b000000000000;
		9'b001011000: color_data = 12'b000000000000;
		9'b001011001: color_data = 12'b111100000000;
		9'b001011010: color_data = 12'b111100000000;
		9'b001011011: color_data = 12'b111100000000;
		9'b001011100: color_data = 12'b111100000000;
		9'b001011101: color_data = 12'b000000000000;
		9'b001011110: color_data = 12'b111111111111;
		9'b001011111: color_data = 12'b011011011110;

		9'b001100000: color_data = 12'b011011011110;
		9'b001100001: color_data = 12'b111111111111;
		9'b001100010: color_data = 12'b000000000000;
		9'b001100011: color_data = 12'b111100000000;
		9'b001100100: color_data = 12'b111100000000;
		9'b001100101: color_data = 12'b111100000000;
		9'b001100110: color_data = 12'b111100000000;
		9'b001100111: color_data = 12'b111100000000;
		9'b001101000: color_data = 12'b111100000000;
		9'b001101001: color_data = 12'b111100000000;
		9'b001101010: color_data = 12'b111100000000;
		9'b001101011: color_data = 12'b111100000000;
		9'b001101100: color_data = 12'b111100000000;
		9'b001101101: color_data = 12'b000000000000;
		9'b001101110: color_data = 12'b111111111111;
		9'b001101111: color_data = 12'b011011011110;

		9'b001110000: color_data = 12'b011011011110;
		9'b001110001: color_data = 12'b111111111111;
		9'b001110010: color_data = 12'b000000000000;
		9'b001110011: color_data = 12'b111100000000;
		9'b001110100: color_data = 12'b111100000000;
		9'b001110101: color_data = 12'b111100000000;
		9'b001110110: color_data = 12'b111100000000;
		9'b001110111: color_data = 12'b111100000000;
		9'b001111000: color_data = 12'b111100000000;
		9'b001111001: color_data = 12'b111100000000;
		9'b001111010: color_data = 12'b111100000000;
		9'b001111011: color_data = 12'b111100000000;
		9'b001111100: color_data = 12'b111100000000;
		9'b001111101: color_data = 12'b000000000000;
		9'b001111110: color_data = 12'b111111111111;
		9'b001111111: color_data = 12'b011011011110;

		9'b010000000: color_data = 12'b011011011110;
		9'b010000001: color_data = 12'b011011011110;
		9'b010000010: color_data = 12'b111111111111;
		9'b010000011: color_data = 12'b000000000000;
		9'b010000100: color_data = 12'b111100000000;
		9'b010000101: color_data = 12'b111100000000;
		9'b010000110: color_data = 12'b111100000000;
		9'b010000111: color_data = 12'b111100000000;
		9'b010001000: color_data = 12'b111100000000;
		9'b010001001: color_data = 12'b111100000000;
		9'b010001010: color_data = 12'b111100000000;
		9'b010001011: color_data = 12'b111100000000;
		9'b010001100: color_data = 12'b000000000000;
		9'b010001101: color_data = 12'b111111111111;
		9'b010001110: color_data = 12'b011011011110;
		9'b010001111: color_data = 12'b011011011110;

		9'b010010000: color_data = 12'b011011011110;
		9'b010010001: color_data = 12'b011011011110;
		9'b010010010: color_data = 12'b011011011110;
		9'b010010011: color_data = 12'b111111111111;
		9'b010010100: color_data = 12'b000000000000;
		9'b010010101: color_data = 12'b111100000000;
		9'b010010110: color_data = 12'b111100000000;
		9'b010010111: color_data = 12'b111100000000;
		9'b010011000: color_data = 12'b111100000000;
		9'b010011001: color_data = 12'b111100000000;
		9'b010011010: color_data = 12'b111100000000;
		9'b010011011: color_data = 12'b000000000000;
		9'b010011100: color_data = 12'b111111111111;
		9'b010011101: color_data = 12'b011011011110;
		9'b010011110: color_data = 12'b011011011110;
		9'b010011111: color_data = 12'b011011011110;

		9'b010100000: color_data = 12'b011011011110;
		9'b010100001: color_data = 12'b011011011110;
		9'b010100010: color_data = 12'b011011011110;
		9'b010100011: color_data = 12'b011011011110;
		9'b010100100: color_data = 12'b111111111111;
		9'b010100101: color_data = 12'b000000000000;
		9'b010100110: color_data = 12'b111100000000;
		9'b010100111: color_data = 12'b111100000000;
		9'b010101000: color_data = 12'b111100000000;
		9'b010101001: color_data = 12'b111100000000;
		9'b010101010: color_data = 12'b000000000000;
		9'b010101011: color_data = 12'b111111111111;
		9'b010101100: color_data = 12'b011011011110;
		9'b010101101: color_data = 12'b011011011110;
		9'b010101110: color_data = 12'b011011011110;
		9'b010101111: color_data = 12'b011011011110;

		9'b010110000: color_data = 12'b011011011110;
		9'b010110001: color_data = 12'b011011011110;
		9'b010110010: color_data = 12'b011011011110;
		9'b010110011: color_data = 12'b011011011110;
		9'b010110100: color_data = 12'b011011011110;
		9'b010110101: color_data = 12'b111111111111;
		9'b010110110: color_data = 12'b000000000000;
		9'b010110111: color_data = 12'b111100000000;
		9'b010111000: color_data = 12'b111100000000;
		9'b010111001: color_data = 12'b000000000000;
		9'b010111010: color_data = 12'b111111111111;
		9'b010111011: color_data = 12'b011011011110;
		9'b010111100: color_data = 12'b011011011110;
		9'b010111101: color_data = 12'b011011011110;
		9'b010111110: color_data = 12'b011011011110;
		9'b010111111: color_data = 12'b011011011110;

		9'b011000000: color_data = 12'b011011011110;
		9'b011000001: color_data = 12'b011011011110;
		9'b011000010: color_data = 12'b011011011110;
		9'b011000011: color_data = 12'b011011011110;
		9'b011000100: color_data = 12'b011011011110;
		9'b011000101: color_data = 12'b011011011110;
		9'b011000110: color_data = 12'b111111111111;
		9'b011000111: color_data = 12'b000000000000;
		9'b011001000: color_data = 12'b000000000000;
		9'b011001001: color_data = 12'b111111111111;
		9'b011001010: color_data = 12'b011011011110;
		9'b011001011: color_data = 12'b011011011110;
		9'b011001100: color_data = 12'b011011011110;
		9'b011001101: color_data = 12'b011011011110;
		9'b011001110: color_data = 12'b011011011110;
		9'b011001111: color_data = 12'b011011011110;

		9'b011010000: color_data = 12'b011011011110;
		9'b011010001: color_data = 12'b011011011110;
		9'b011010010: color_data = 12'b011011011110;
		9'b011010011: color_data = 12'b011011011110;
		9'b011010100: color_data = 12'b011011011110;
		9'b011010101: color_data = 12'b011011011110;
		9'b011010110: color_data = 12'b011011011110;
		9'b011010111: color_data = 12'b111111111111;
		9'b011011000: color_data = 12'b111111111111;
		9'b011011001: color_data = 12'b011011011110;
		9'b011011010: color_data = 12'b011011011110;
		9'b011011011: color_data = 12'b011011011110;
		9'b011011100: color_data = 12'b011011011110;
		9'b011011101: color_data = 12'b011011011110;
		9'b011011110: color_data = 12'b011011011110;
		9'b011011111: color_data = 12'b011011011110;

		9'b011100000: color_data = 12'b011011011110;
		9'b011100001: color_data = 12'b011011011110;
		9'b011100010: color_data = 12'b011011011110;
		9'b011100011: color_data = 12'b011011011110;
		9'b011100100: color_data = 12'b011011011110;
		9'b011100101: color_data = 12'b011011011110;
		9'b011100110: color_data = 12'b011011011110;
		9'b011100111: color_data = 12'b011011011110;
		9'b011101000: color_data = 12'b011011011110;
		9'b011101001: color_data = 12'b011011011110;
		9'b011101010: color_data = 12'b011011011110;
		9'b011101011: color_data = 12'b011011011110;
		9'b011101100: color_data = 12'b011011011110;
		9'b011101101: color_data = 12'b011011011110;
		9'b011101110: color_data = 12'b011011011110;
		9'b011101111: color_data = 12'b011011011110;

		9'b011110000: color_data = 12'b011011011110;
		9'b011110001: color_data = 12'b011011011110;
		9'b011110010: color_data = 12'b011011011110;
		9'b011110011: color_data = 12'b011011011110;
		9'b011110100: color_data = 12'b011011011110;
		9'b011110101: color_data = 12'b011011011110;
		9'b011110110: color_data = 12'b011011011110;
		9'b011110111: color_data = 12'b011011011110;
		9'b011111000: color_data = 12'b011011011110;
		9'b011111001: color_data = 12'b011011011110;
		9'b011111010: color_data = 12'b011011011110;
		9'b011111011: color_data = 12'b011011011110;
		9'b011111100: color_data = 12'b011011011110;
		9'b011111101: color_data = 12'b011011011110;
		9'b011111110: color_data = 12'b011011011110;
		9'b011111111: color_data = 12'b011011011110;

		9'b100000000: color_data = 12'b011011011110;
		9'b100000001: color_data = 12'b011011011110;
		9'b100000010: color_data = 12'b011011011110;
		9'b100000011: color_data = 12'b011011011110;
		9'b100000100: color_data = 12'b011011011110;
		9'b100000101: color_data = 12'b011011011110;
		9'b100000110: color_data = 12'b011011011110;
		9'b100000111: color_data = 12'b011011011110;
		9'b100001000: color_data = 12'b011011011110;
		9'b100001001: color_data = 12'b011011011110;
		9'b100001010: color_data = 12'b011011011110;
		9'b100001011: color_data = 12'b011011011110;
		9'b100001100: color_data = 12'b011011011110;
		9'b100001101: color_data = 12'b011011011110;
		9'b100001110: color_data = 12'b011011011110;
		9'b100001111: color_data = 12'b011011011110;

		9'b100010000: color_data = 12'b011011011110;
		9'b100010001: color_data = 12'b011011011110;
		9'b100010010: color_data = 12'b011011011110;
		9'b100010011: color_data = 12'b011011011110;
		9'b100010100: color_data = 12'b011011011110;
		9'b100010101: color_data = 12'b011011011110;
		9'b100010110: color_data = 12'b011011011110;
		9'b100010111: color_data = 12'b011011011110;
		9'b100011000: color_data = 12'b011011011110;
		9'b100011001: color_data = 12'b011011011110;
		9'b100011010: color_data = 12'b011011011110;
		9'b100011011: color_data = 12'b011011011110;
		9'b100011100: color_data = 12'b011011011110;
		9'b100011101: color_data = 12'b011011011110;
		9'b100011110: color_data = 12'b011011011110;
		9'b100011111: color_data = 12'b011011011110;

		9'b100100000: color_data = 12'b011011011110;
		9'b100100001: color_data = 12'b011011011110;
		9'b100100010: color_data = 12'b011011011110;
		9'b100100011: color_data = 12'b111111111111;
		9'b100100100: color_data = 12'b111111111111;
		9'b100100101: color_data = 12'b111111111111;
		9'b100100110: color_data = 12'b011011011110;
		9'b100100111: color_data = 12'b011011011110;
		9'b100101000: color_data = 12'b011011011110;
		9'b100101001: color_data = 12'b011011011110;
		9'b100101010: color_data = 12'b111111111111;
		9'b100101011: color_data = 12'b111111111111;
		9'b100101100: color_data = 12'b111111111111;
		9'b100101101: color_data = 12'b011011011110;
		9'b100101110: color_data = 12'b011011011110;
		9'b100101111: color_data = 12'b011011011110;

		9'b100110000: color_data = 12'b011011011110;
		9'b100110001: color_data = 12'b011011011110;
		9'b100110010: color_data = 12'b111111111111;
		9'b100110011: color_data = 12'b000000000000;
		9'b100110100: color_data = 12'b000000000000;
		9'b100110101: color_data = 12'b000000000000;
		9'b100110110: color_data = 12'b111111111111;
		9'b100110111: color_data = 12'b011011011110;
		9'b100111000: color_data = 12'b011011011110;
		9'b100111001: color_data = 12'b111111111111;
		9'b100111010: color_data = 12'b000000000000;
		9'b100111011: color_data = 12'b000000000000;
		9'b100111100: color_data = 12'b000000000000;
		9'b100111101: color_data = 12'b111111111111;
		9'b100111110: color_data = 12'b011011011110;
		9'b100111111: color_data = 12'b011011011110;

		9'b101000000: color_data = 12'b011011011110;
		9'b101000001: color_data = 12'b111111111111;
		9'b101000010: color_data = 12'b000000000000;
		9'b101000011: color_data = 12'b000000000000;
		9'b101000100: color_data = 12'b000000000000;
		9'b101000101: color_data = 12'b000000000000;
		9'b101000110: color_data = 12'b000000000000;
		9'b101000111: color_data = 12'b111111111111;
		9'b101001000: color_data = 12'b111111111111;
		9'b101001001: color_data = 12'b000000000000;
		9'b101001010: color_data = 12'b000000000000;
		9'b101001011: color_data = 12'b000000000000;
		9'b101001100: color_data = 12'b000000000000;
		9'b101001101: color_data = 12'b000000000000;
		9'b101001110: color_data = 12'b111111111111;
		9'b101001111: color_data = 12'b011011011110;

		9'b101010000: color_data = 12'b011011011110;
		9'b101010001: color_data = 12'b111111111111;
		9'b101010010: color_data = 12'b000000000000;
		9'b101010011: color_data = 12'b000000000000;
		9'b101010100: color_data = 12'b000000000000;
		9'b101010101: color_data = 12'b000000000000;
		9'b101010110: color_data = 12'b000000000000;
		9'b101010111: color_data = 12'b000000000000;
		9'b101011000: color_data = 12'b000000000000;
		9'b101011001: color_data = 12'b000000000000;
		9'b101011010: color_data = 12'b000000000000;
		9'b101011011: color_data = 12'b000000000000;
		9'b101011100: color_data = 12'b000000000000;
		9'b101011101: color_data = 12'b000000000000;
		9'b101011110: color_data = 12'b111111111111;
		9'b101011111: color_data = 12'b011011011110;

		9'b101100000: color_data = 12'b011011011110;
		9'b101100001: color_data = 12'b111111111111;
		9'b101100010: color_data = 12'b000000000000;
		9'b101100011: color_data = 12'b000000000000;
		9'b101100100: color_data = 12'b000000000000;
		9'b101100101: color_data = 12'b000000000000;
		9'b101100110: color_data = 12'b000000000000;
		9'b101100111: color_data = 12'b000000000000;
		9'b101101000: color_data = 12'b000000000000;
		9'b101101001: color_data = 12'b000000000000;
		9'b101101010: color_data = 12'b000000000000;
		9'b101101011: color_data = 12'b000000000000;
		9'b101101100: color_data = 12'b000000000000;
		9'b101101101: color_data = 12'b000000000000;
		9'b101101110: color_data = 12'b111111111111;
		9'b101101111: color_data = 12'b011011011110;

		9'b101110000: color_data = 12'b011011011110;
		9'b101110001: color_data = 12'b111111111111;
		9'b101110010: color_data = 12'b000000000000;
		9'b101110011: color_data = 12'b000000000000;
		9'b101110100: color_data = 12'b000000000000;
		9'b101110101: color_data = 12'b000000000000;
		9'b101110110: color_data = 12'b000000000000;
		9'b101110111: color_data = 12'b000000000000;
		9'b101111000: color_data = 12'b000000000000;
		9'b101111001: color_data = 12'b000000000000;
		9'b101111010: color_data = 12'b000000000000;
		9'b101111011: color_data = 12'b000000000000;
		9'b101111100: color_data = 12'b000000000000;
		9'b101111101: color_data = 12'b000000000000;
		9'b101111110: color_data = 12'b111111111111;
		9'b101111111: color_data = 12'b011011011110;

		9'b110000000: color_data = 12'b011011011110;
		9'b110000001: color_data = 12'b011011011110;
		9'b110000010: color_data = 12'b111111111111;
		9'b110000011: color_data = 12'b000000000000;
		9'b110000100: color_data = 12'b000000000000;
		9'b110000101: color_data = 12'b000000000000;
		9'b110000110: color_data = 12'b000000000000;
		9'b110000111: color_data = 12'b000000000000;
		9'b110001000: color_data = 12'b000000000000;
		9'b110001001: color_data = 12'b000000000000;
		9'b110001010: color_data = 12'b000000000000;
		9'b110001011: color_data = 12'b000000000000;
		9'b110001100: color_data = 12'b000000000000;
		9'b110001101: color_data = 12'b111111111111;
		9'b110001110: color_data = 12'b011011011110;
		9'b110001111: color_data = 12'b011011011110;

		9'b110010000: color_data = 12'b011011011110;
		9'b110010001: color_data = 12'b011011011110;
		9'b110010010: color_data = 12'b011011011110;
		9'b110010011: color_data = 12'b111111111111;
		9'b110010100: color_data = 12'b000000000000;
		9'b110010101: color_data = 12'b000000000000;
		9'b110010110: color_data = 12'b000000000000;
		9'b110010111: color_data = 12'b000000000000;
		9'b110011000: color_data = 12'b000000000000;
		9'b110011001: color_data = 12'b000000000000;
		9'b110011010: color_data = 12'b000000000000;
		9'b110011011: color_data = 12'b000000000000;
		9'b110011100: color_data = 12'b111111111111;
		9'b110011101: color_data = 12'b011011011110;
		9'b110011110: color_data = 12'b011011011110;
		9'b110011111: color_data = 12'b011011011110;

		9'b110100000: color_data = 12'b011011011110;
		9'b110100001: color_data = 12'b011011011110;
		9'b110100010: color_data = 12'b011011011110;
		9'b110100011: color_data = 12'b011011011110;
		9'b110100100: color_data = 12'b111111111111;
		9'b110100101: color_data = 12'b000000000000;
		9'b110100110: color_data = 12'b000000000000;
		9'b110100111: color_data = 12'b000000000000;
		9'b110101000: color_data = 12'b000000000000;
		9'b110101001: color_data = 12'b000000000000;
		9'b110101010: color_data = 12'b000000000000;
		9'b110101011: color_data = 12'b111111111111;
		9'b110101100: color_data = 12'b011011011110;
		9'b110101101: color_data = 12'b011011011110;
		9'b110101110: color_data = 12'b011011011110;
		9'b110101111: color_data = 12'b011011011110;

		9'b110110000: color_data = 12'b011011011110;
		9'b110110001: color_data = 12'b011011011110;
		9'b110110010: color_data = 12'b011011011110;
		9'b110110011: color_data = 12'b011011011110;
		9'b110110100: color_data = 12'b011011011110;
		9'b110110101: color_data = 12'b111111111111;
		9'b110110110: color_data = 12'b000000000000;
		9'b110110111: color_data = 12'b000000000000;
		9'b110111000: color_data = 12'b000000000000;
		9'b110111001: color_data = 12'b000000000000;
		9'b110111010: color_data = 12'b111111111111;
		9'b110111011: color_data = 12'b011011011110;
		9'b110111100: color_data = 12'b011011011110;
		9'b110111101: color_data = 12'b011011011110;
		9'b110111110: color_data = 12'b011011011110;
		9'b110111111: color_data = 12'b011011011110;

		9'b111000000: color_data = 12'b011011011110;
		9'b111000001: color_data = 12'b011011011110;
		9'b111000010: color_data = 12'b011011011110;
		9'b111000011: color_data = 12'b011011011110;
		9'b111000100: color_data = 12'b011011011110;
		9'b111000101: color_data = 12'b011011011110;
		9'b111000110: color_data = 12'b111111111111;
		9'b111000111: color_data = 12'b000000000000;
		9'b111001000: color_data = 12'b000000000000;
		9'b111001001: color_data = 12'b111111111111;
		9'b111001010: color_data = 12'b011011011110;
		9'b111001011: color_data = 12'b011011011110;
		9'b111001100: color_data = 12'b011011011110;
		9'b111001101: color_data = 12'b011011011110;
		9'b111001110: color_data = 12'b011011011110;
		9'b111001111: color_data = 12'b011011011110;

		9'b111010000: color_data = 12'b011011011110;
		9'b111010001: color_data = 12'b011011011110;
		9'b111010010: color_data = 12'b011011011110;
		9'b111010011: color_data = 12'b011011011110;
		9'b111010100: color_data = 12'b011011011110;
		9'b111010101: color_data = 12'b011011011110;
		9'b111010110: color_data = 12'b011011011110;
		9'b111010111: color_data = 12'b111111111111;
		9'b111011000: color_data = 12'b111111111111;
		9'b111011001: color_data = 12'b011011011110;
		9'b111011010: color_data = 12'b011011011110;
		9'b111011011: color_data = 12'b011011011110;
		9'b111011100: color_data = 12'b011011011110;
		9'b111011101: color_data = 12'b011011011110;
		9'b111011110: color_data = 12'b011011011110;
		9'b111011111: color_data = 12'b011011011110;

		9'b111100000: color_data = 12'b011011011110;
		9'b111100001: color_data = 12'b011011011110;
		9'b111100010: color_data = 12'b011011011110;
		9'b111100011: color_data = 12'b011011011110;
		9'b111100100: color_data = 12'b011011011110;
		9'b111100101: color_data = 12'b011011011110;
		9'b111100110: color_data = 12'b011011011110;
		9'b111100111: color_data = 12'b011011011110;
		9'b111101000: color_data = 12'b011011011110;
		9'b111101001: color_data = 12'b011011011110;
		9'b111101010: color_data = 12'b011011011110;
		9'b111101011: color_data = 12'b011011011110;
		9'b111101100: color_data = 12'b011011011110;
		9'b111101101: color_data = 12'b011011011110;
		9'b111101110: color_data = 12'b011011011110;
		9'b111101111: color_data = 12'b011011011110;

		9'b111110000: color_data = 12'b011011011110;
		9'b111110001: color_data = 12'b011011011110;
		9'b111110010: color_data = 12'b011011011110;
		9'b111110011: color_data = 12'b011011011110;
		9'b111110100: color_data = 12'b011011011110;
		9'b111110101: color_data = 12'b011011011110;
		9'b111110110: color_data = 12'b011011011110;
		9'b111110111: color_data = 12'b011011011110;
		9'b111111000: color_data = 12'b011011011110;
		9'b111111001: color_data = 12'b011011011110;
		9'b111111010: color_data = 12'b011011011110;
		9'b111111011: color_data = 12'b011011011110;
		9'b111111100: color_data = 12'b011011011110;
		9'b111111101: color_data = 12'b011011011110;
		9'b111111110: color_data = 12'b011011011110;
		9'b111111111: color_data = 12'b011011011110;

		default: color_data = 12'b000000000000;
	endcase
endmodule