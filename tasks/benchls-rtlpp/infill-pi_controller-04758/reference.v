module rtlpp_04758(
    input clk,
    input reset_n,
    input [DATA_WIDTH-1:0] data_in_0,
    input [DATA_WIDTH-1:0] data_in_1,
    input data_ready,
    output reg signed [DATA_WIDTH-1:0] u,
    output reg pi_ready
);

    parameter DATA_WIDTH = 16; 
    parameter IDLE = 4'b0000; 
    parameter readADC = 4'b0001; 
    parameter computeError = 4'b0010; 
    parameter computeDeltaU = 4'b0011; 
    parameter computeU = 4'b0100; 
    parameter latchDAC = 4'b0101; 
  
    reg [3:0] current_state; 
    reg [3:0] next_state; 
    reg signed [DATA_WIDTH-1:0] error; 
    reg signed [DATA_WIDTH-1:0] error_prev; 
    reg signed [DATA_WIDTH-1:0] deltaU; 
    reg signed [DATA_WIDTH-1:0] u_prev;

    // Error calculation logic
    wire signed [DATA_WIDTH-1:0] error_bus;
    assign error_bus = data_in_1 - data_in_0;

    // DeltaU calculation logic
    wire signed [DATA_WIDTH-1:0] deltaU_bus;
    assign deltaU_bus = error - error_prev;

    // Saturation logic
    wire signed [DATA_WIDTH-1:0] u_out_bus;
    assign u_out_bus = (deltaU + u_prev > (1 << (DATA_WIDTH - 1)) - 1) ? 
                        (1 << (DATA_WIDTH - 1)) - 1 : 
                        (deltaU + u_prev < -(1 << (DATA_WIDTH - 1))) ? 
                        -(1 << (DATA_WIDTH - 1)) : 
                        deltaU + u_prev;

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
            case (current_state)
                IDLE: if (data_ready) next_state <= readADC; else next_state <= IDLE;
                readADC: next_state <= computeError; 
                computeError: next_state <= computeDeltaU; 
                computeDeltaU: next_state <= computeU; 
                computeU: next_state <= latchDAC;
                latchDAC: next_state <= IDLE; 
                default: next_state <= IDLE; 
            endcase
    end
     
    always @ (posedge clk) 
    begin 
        if (!reset_n) 
        begin 
            pi_ready <= 0; 
            u <= 0; 
            error <= 0;
            error_prev <= 0;
            deltaU <= 0;
            u_prev <= 0;
        end  
        else  
        begin 
            if (current_state == IDLE) 
            begin 
                pi_ready <= 1;
                u <= u; 
            end 
            else if (current_state == readADC) 
                pi_ready <= 0; 
            else if (current_state == computeError) 
            begin 
                error <= error_bus; 
                error_prev <= error; 
            end 
            else if (current_state == computeDeltaU) 
                deltaU <= deltaU_bus; 
            else if (current_state == computeU) 
            begin 
                u <= u_out_bus; 
                u_prev <= u; 
            end
            else if (current_state == latchDAC) 
                pi_ready <= 1'b1; 
        end    
    end          

endmodule