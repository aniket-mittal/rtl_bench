module autovcoder_136938 (  
    input clk,  
    input reset,  
    input [3:0] data_in,  
    input send,  
    output reg ack,  
    output reg [3:0] data_out  
);  

    reg [1:0] state;  
    reg [1:0] next_state;  

    parameter IDLE = 2'b00;  
    parameter SEND = 2'b01;  
    parameter WAIT_ACK = 2'b10;  

    always @(posedge clk or posedge reset) begin  
        if (reset)  
            state <= IDLE;  
        else  
            state <= next_state;  
    end  

    [MASKED]  

    always @(posedge clk) begin  
        if (state == WAIT_ACK)  
            ack <= 1;  
    end  
endmodule