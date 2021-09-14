//K.Bajur, K.Brudz

module uart_read(
    input reset,
    input clk,
    input Serial_in,
    output RX_done,
    output [7:0] Data_out
    );
parameter baudrate = 9600 ;
parameter freq = 50000000 ;
wire tick;
baud_rate_gen#(freq/(baudrate*16)) baud_rate_gen_inst (
    .clk(clk), 
    .reset(reset), 
    .tick(tick)
    );
uart_receiver uart_receiver_inst (
    .clk(clk), 
    .reset(reset), 
    .Data_in(Serial_in), 
    .tick(tick), 
    .dout(Data_out), 
    .load(RX_done)
    );
endmodule
