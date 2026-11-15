module autovcoder_145155(  
    input wire clk,  
    input wire reset,  
    input wire [7:0] data_in,  
    input wire send,  
    output reg tx,  
    output reg busy  
);  
    parameter BAUD_RATE = 9600;  
    parameter CLOCK_FREQ = 50000000;  
    localparam BIT_PERIOD = CLOCK_FREQ / BAUD_RATE;  
    localparam STOP_BIT = 1;  
    localparam START_BIT = 0;  
    reg [3:0] bit_index;  
    reg [12:0] counter;  
    reg [9:0] shift_reg;  

    always @(posedge clk or posedge reset) begin  
        if (reset) begin  
            busy <= 0;  
            tx <= 1;  
            bit_index <= 0;  
            counter <= 0;  
        end else begin  
            if (send && !busy) begin  
                busy <= 1;  
                shift_reg <= {STOP_BIT, data_in, START_BIT};  
                bit_index <= 0;  
                counter <= 0;  
            end  

            if (busy) begin  
                if (counter < BIT_PERIOD - 1) begin  
                    counter <= counter + 1;  
                end else begin  
                    counter <= 0;  
                    tx <= shift_reg[bit_index];  
                    if (bit_index < 9) begin  
                        bit_index <= bit_index + 1;  
                    end else begin  
                        busy <= 0;  
                    end  
                end  
            end  
        end  
    end  
endmodule