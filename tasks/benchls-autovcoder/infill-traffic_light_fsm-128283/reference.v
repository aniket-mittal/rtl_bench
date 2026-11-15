module autovcoder_128283(  
    input wire clk,  
    input wire reset,  
    input wire [3:0] green_time,  
    input wire [3:0] yellow_time,  
    input wire [3:0] red_time,  
    output reg [1:0] state // 00: Red, 01: Green, 10: Yellow  
);  
    reg [3:0] counter;  
    parameter RED = 2'b00, GREEN = 2'b01, YELLOW = 2'b10;  

    always @(posedge clk or posedge reset) begin  
        if (reset) begin  
            state <= RED;  
            counter <= 0;  
        end else begin  
            case (state)  
                RED: begin  
                    if (counter < red_time) begin  
                        counter <= counter + 1;  
                    end else begin  
                        state <= GREEN;  
                        counter <= 0;  
                    end  
                end  
                GREEN: begin  
                    if (counter < green_time) begin  
                        counter <= counter + 1;  
                    end else begin  
                        state <= YELLOW;  
                        counter <= 0;  
                    end  
                end  
                YELLOW: begin  
                    if (counter < yellow_time) begin  
                        counter <= counter + 1;  
                    end else begin  
                        state <= RED;  
                        counter <= 0;  
                    end  
                end  
            endcase  
        end  
    end  
endmodule