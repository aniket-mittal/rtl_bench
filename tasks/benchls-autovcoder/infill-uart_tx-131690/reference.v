module autovcoder_131690(  
    input clk,  
    input rst,  
    input baud_clk,  
    input [7:0] data_in,  
    input send,  
    output reg tx  
);  
    reg [3:0] state;  
    reg [3:0] bit_index;  
    reg [9:0] shift_reg; // 1 start bit + 8 data bits + 1 stop bit  

    localparam IDLE = 0, START = 1, DATA = 2, STOP = 3;  

    always @(posedge clk or posedge rst) begin  
        if (rst) begin  
            tx <= 1;  
            state <= IDLE;  
            bit_index <= 0;  
        end else begin  
            case (state)  
                IDLE: begin  
                    tx <= 1;  
                    if (send) begin  
                        shift_reg <= {1'b1, data_in, 1'b0}; // load shift reg with 1 stop, data, and 1 start  
                        state <= START;  
                        bit_index <= 0;  
                    end  
                end  
                START: begin  
                    if (baud_clk) begin  
                        tx <= shift_reg[0]; // transmit start bit  
                        state <= DATA;  
                    end  
                end  
                DATA: begin  
                    if (baud_clk) begin  
                        tx <= shift_reg[bit_index + 1]; // transmit data bit  
                        if (bit_index == 7) state <= STOP;  
                        bit_index <= bit_index + 1;  
                    end  
                end  
                STOP: begin  
                    if (baud_clk) begin  
                        tx <= 1; // transmit stop bit  
                        state <= IDLE;  
                    end  
                end  
            endcase  
        end  
    end  
endmodule