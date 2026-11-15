module autovcoder_145441(  
    input wire clk,  
    input wire reset,  
    input wire request_a,  
    input wire request_b,  
    input wire ack_a,  
    input wire ack_b,  
    input wire [7:0] data_in_a,  
    input wire [7:0] data_in_b,  
    output reg [7:0] data_out_a,  
    output reg [7:0] data_out_b,  
    output reg transfer_complete_a,  
    output reg transfer_complete_b  
);  
    reg state;  
    localparam IDLE = 1'b0, TRANSFER_A = 1'b1;  

    always @(posedge clk or posedge reset) begin  
        if (reset) begin  
            data_out_a <= 8'b0;  
            data_out_b <= 8'b0;  
            transfer_complete_a <= 1'b0;  
            transfer_complete_b <= 1'b0;  
            state <= IDLE;  
        end else begin  
            case (state)  
                IDLE: begin  
                    if (request_a) begin  
                        data_out_a <= data_in_a;  
                        transfer_complete_a <= 1'b1;  
                        state <= TRANSFER_A;  
                    end else if (request_b) begin  
                        data_out_b <= data_in_b;  
                        transfer_complete_b <= 1'b1;  
                    end  
                end  
                TRANSFER_A: begin  
                    if (ack_a) begin  
                        transfer_complete_a <= 1'b0;  
                        state <= IDLE;  
                    end  
                end  
            endcase  
        end  
    end  
endmodule