module uart_interrupt
#(
    parameter TX_FIFO_DEPTH = 32,
    parameter RX_FIFO_DEPTH = 32
)
(
    input  wire                           clk_i,
    input  wire                           rstn_i,

    // registers
    input  wire [2:0]                     IER_i,             // interrupt enable register

    // control logic
    input  wire                           error_i,
    input  wire [$clog2(RX_FIFO_DEPTH):0] rx_elements_i,
    input  wire [$clog2(TX_FIFO_DEPTH):0] tx_elements_i,
    input  wire [1:0]                     trigger_level_i,

    input  wire [3:0]                     clr_int_i,         // one hot

    output wire                           interrupt_o,
    output wire [3:0]                     IIR_o
);

    reg [3:0] iir_n;
    reg [3:0] iir_q;
    reg trigger_level_reached;

    always @(*) begin
        trigger_level_reached = 1'b0;
        case (trigger_level_i)
            2'b00:
                if ($unsigned(rx_elements_i) == 1)
            	    trigger_level_reached = 1'b1;
            2'b01:
                if ($unsigned(rx_elements_i) == 4)
            	    trigger_level_reached = 1'b1;
            2'b10:
                if ($unsigned(rx_elements_i) == 8)
            	    trigger_level_reached = 1'b1;
            2'b11:
                if ($unsigned(rx_elements_i) == 14)
            	    trigger_level_reached = 1'b1;
        endcase
    end


    [MASKED]


    always @(posedge clk_i or negedge rstn_i) begin
        if (~rstn_i)
       	    iir_q <= 4'b0;
        else
       	    iir_q <= iir_n;
    end

    assign IIR_o = iir_q;
    assign interrupt_o = iir_q[2] | iir_q[3];

endmodule