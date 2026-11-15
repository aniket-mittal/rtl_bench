module autovcoder_142170(  
    input clk,  
    input rst,  
    input [1:0] encoded_bits,  
    output reg [1:0] decoded_bits  
);  
    reg [1:0] state;  
    reg [1:0] next_state;  
  
    always @(posedge clk or posedge rst) begin  
        if (rst)  
            state <= 2'b00;  
        else  
            state <= next_state;  
    end  
  
    always @(*) begin  
        case (state)  
            2'b00: begin  
                if (encoded_bits == 2'b00)  
                    next_state = 2'b00;  
                else if (encoded_bits == 2'b01)  
                    next_state = 2'b01;  
                else  
                    next_state = 2'b10;  
            end  
            2'b01: begin  
                if (encoded_bits == 2'b00)  
                    next_state = 2'b10;  
                else  
                    next_state = 2'b01;  
            end  
            2'b10: begin  
                if (encoded_bits == 2'b00)  
                    next_state = 2'b01;  
                else  
                    next_state = 2'b11;  
            end  
            2'b11: begin  
                next_state = 2'b00;  
            end  
            default: next_state = 2'b00;  
        endcase  
    end  
  
    always @(posedge clk) begin  
        decoded_bits <= state;  
    end  
endmodule