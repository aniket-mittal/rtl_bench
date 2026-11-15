module autovcoder_126724(  
    input wire clk,  
    input wire reset,  
    input wire start_condition,  
    input wire stop_condition,  
    input wire [7:0] data_in,  
    output reg scl,  
    output reg sda,  
    output reg ack  
);  
    reg [3:0] state;  
    parameter IDLE = 4'b0000, START = 4'b0001, DATA = 4'b0010, ACK = 4'b0011, STOP = 4'b0100;  

    always @(posedge clk or posedge reset) begin  
        if (reset) begin  
            state <= IDLE;  
            scl <= 1;  
            sda <= 1;  
            ack <= 0;  
        end else begin  
            case (state)  
                IDLE: begin  
                    if (start_condition) begin  
                        state <= START;  
                        sda <= 0;  
                    end  
                end  
                START: begin  
                    scl <= 0;  
                    state <= DATA;  
                end  
                DATA: begin  
                    sda <= data_in;  
                    state <= ACK;  
                end  
                ACK: begin  
                    ack <= 1;  
                    state <= STOP;  
                end  
                STOP: begin  
                    sda <= 1;  
                    state <= IDLE;  
                end  
            endcase  
        end  
    end  
endmodule