//K.Bajur, K.Brudz

module uart_write(
    input clk,
    input reset,
    input start,
    input [7:0] TX_data,
    output tx_ready,
    output Serial_out
    );
parameter baudrate = 9600 ;
parameter freq = 50000000 ;
wire tick;
uart_transmitter uart_transmitter_inst (
    .clk(clk), 
    .reset(reset), 
    .tick(tick), 
    .start(start), 
    .din(TX_data), 
    .tx_ready(tx_ready), 
    .dout(Serial_out)
    );
tick_gen#(freq/baudrate) tick_gen_inst (
    .reset(reset), 
    .clk(clk), 
    .tick(tick)
    );

endmodule
