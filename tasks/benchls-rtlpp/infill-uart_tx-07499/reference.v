module rtlpp_07499 (
    clk,        
    txbyte,     
    senddata,   
    reset,      
    txdone,     
    tx         
    );

    input clk;
    input [7:0] txbyte;
    input senddata;
    input reset;      

    output txdone;
    output tx;

    parameter STATE_IDLE = 8'd0;
    parameter STATE_STARTTX = 8'd1;
    parameter STATE_TXING = 8'd2;
    parameter STATE_TXDONE = 8'd3;

    reg [7:0] state = 8'b0;
    reg [7:0] buf_tx = 8'b0;
    reg [7:0] bits_sent = 8'b0;
    reg txbit = 1'b0; 
    reg txdone = 1'b0;

    assign tx = txbit;

    always @ (posedge clk) begin
        if (reset) begin
          state <= STATE_IDLE;
          buf_tx <= 8'b0;
          bits_sent <= 8'b0;
          txbit <= 1'b1; 
          txdone <= 1'b0;
        end else begin
            if (senddata == 1 && state == STATE_IDLE) begin
                state <= STATE_STARTTX;
                buf_tx <= txbyte;
                txdone <= 1'b0;
            end else if (state == STATE_IDLE) begin
                txbit <= 1'b1; 
                txdone <= 1'b0;
            end

            if (state == STATE_STARTTX) begin
                txbit <= 1'b0; 
                state <= STATE_TXING;
            end

            if (state == STATE_TXING && bits_sent < 8'd8) begin
                txbit <= buf_tx[0];
                buf_tx <= buf_tx >> 1;
                bits_sent <= bits_sent + 1;  
            end else if (state == STATE_TXING) begin
                txbit <= 1'b1;
                bits_sent <= 8'b0;
                state <= STATE_TXDONE;
            end

            if (state == STATE_TXDONE) begin
                txdone <= 1'b1;
                state <= STATE_IDLE;
            end
        end 
    end

endmodule