module rtlpp_06222(clk, reset_n, data_in_0, data_in_1, data_ready, u, pi_ready);

    parameter DATA_WIDTH = 16; 

    parameter IDLE = 4'b0000; 
    parameter readADC = 4'b0001; 
    parameter computeError = 4'b0010; 
    parameter computeDeltaU = 4'b0011; 
    parameter computeU = 4'b0100; 
    parameter latchDAC = 4'b0101; 

    input clk; 
    input reset_n; 
    input [DATA_WIDTH-1:0] data_in_0; 
    input [DATA_WIDTH-1:0] data_in_1; 
    input data_ready; 
    output reg signed [DATA_WIDTH-1:0] u; 
    output reg pi_ready; 
    
    reg [3:0] current_state; 
    reg [3:0] next_state; 
    reg signed [DATA_WIDTH-1:0] error; 
    reg signed [DATA_WIDTH-1:0] error_prev; 
    reg signed [DATA_WIDTH-1:0] deltaU; 
    reg signed [DATA_WIDTH-1:0] u_prev;
    
    wire signed [DATA_WIDTH-1:0] error_bus; 
    wire signed [DATA_WIDTH-1:0] deltaU_bus; 
    wire signed [DATA_WIDTH-1:0] u_out_bus; 
    
    always @ (posedge clk) 
    begin 
        if (!reset_n)
            current_state <= IDLE; 
        else 
            current_state <= next_state; 
    end
    
    always @ (posedge clk) 
    begin 
        if (!reset_n) 
            next_state <= IDLE; 
        else 
        begin 
            case (current_state)
                IDLE: if (data_ready) 
                         next_state <= readADC; 
                      else 
                         next_state <= IDLE;
                         
                readADC: next_state <= computeError; 
                computeError: next_state <= computeDeltaU; 
                computeDeltaU: next_state <= computeU; 
                computeU: next_state <= latchDAC;
                latchDAC: next_state <= IDLE; 
                default: next_state <= IDLE; 
            endcase
        end
    end

    always @ (posedge clk) 
    begin 
        if (!reset_n) 
        begin 
            pi_ready <= 0; 
            u <= 0; 
        end  
        else  
        begin 
            if (current_state == IDLE) 
            begin 
                pi_ready <= 1; 
                u <= u; 
            end 
            else if (current_state == readADC) 
            begin 
                pi_ready <= 0; 
            end
            else if (current_state == computeError) 
            begin 
                error <= data_in_0 - data_in_1; 
                error_prev <= error; 
            end 
            else if (current_state == computeDeltaU) 
            begin 
                deltaU <= error - error_prev; 
            end 
            else if (current_state == computeU) 
            begin 
                u <= u_prev + deltaU; 
                u_prev <= u; 
            end
            else if (current_state == latchDAC) 
            begin 
                pi_ready <= 1'b1; 
            end 
        end    
    end          
endmodule