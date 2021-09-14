//K.Bajur, K.Brudz
module uart_ctl(
    input clk,
    input reset,
	 /* receiver signals */
		 
		 output RX_done,
		 
		 output [7:0] RX_data,
	     /* transmitter signals */
		 
		 output tx_ready,
		 
		 input [7:0] TX_data,
		 
		 input start_tx,
	 
	 /* UART signals */
		 input Serial_in,
		 output Serial_out
    );
parameter baudrate = 9600 ;
parameter freq = 100000000 ;

uart_read#(baudrate, freq) uart_read_inst (
    .reset(reset), 
    .clk(clk), 
    .Serial_in(Serial_in), 
    .RX_done(RX_done), 
    .Data_out(RX_data)
    );
uart_write#(baudrate, freq) uart_write_inst (
    .clk(clk), 
    .reset(reset), 
    .start(start_tx), 
    .TX_data(TX_data), 
    .tx_ready(tx_ready), 
    .Serial_out(Serial_out)
    );
endmodule

