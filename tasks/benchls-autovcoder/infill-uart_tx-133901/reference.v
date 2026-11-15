module autovcoder_133901(  
    input wire clk,  
    input wire rst,  
    input wire send,  
    input wire [7:0] data_in,  
    output reg tx,  
    output reg busy  
);  
    parameter BAUD_RATE = 9600;  
    parameter CLOCK_FREQ = 50000000;  
    localparam BIT_PERIOD = CLOCK_FREQ / BAUD_RATE;  
      
    reg [3:0] bit_count;  
    reg [15:0] clk_count;  
    reg [8:0] shift_reg;  
    reg transmitting;  
      
    always @(posedge clk or posedge rst) begin  
        if (rst) begin  
            tx <= 1;  
            busy <= 0;  
            bit_count <= 0;  
            clk_count <= 0;  
            transmitting <= 0;  
        end else begin  
            if (send && !busy) begin  
                shift_reg <= {1'b1, data_in, 1'b0}; // stop bit, data, start bit  
                busy <= 1;  
                bit_count <= 0;  
                clk_count <= 0;  
                transmitting <= 1;  
            end  
              
            if (transmitting) begin  
                if (clk_count < BIT_PERIOD - 1) begin  
                    clk_count <= clk_count + 1;  
                end else begin  
                    clk_count <= 0;  
                    tx <= shift_reg[bit_count];  
                    if (bit_count < 9) begin  
                        bit_count <= bit_count + 1;  
                    end else begin  
                        busy <= 0;  
                        transmitting <= 0;  
                    end  
                end  
            end  
        end  
    end  
endmodule