module rtlpp_06216(
    input CLK,
    input [3:0] I,
    output reg Y
);

    reg Y1 = 0;
    
    parameter 
    s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b010,
    s3 = 3'b011,
    s4 = 3'b100;
    
    reg [2:0] current_state = s0;
    
    always @(posedge CLK) begin
        case (current_state)
            s0: begin
                if (I == 4'b0001) begin
                    current_state = s1;
                end else begin
                    current_state = s0;
                end
            end
            s1: begin
                if (I == 4'b0000) begin
                    current_state = s2;
                    Y1 = 0;
                end else begin
                    current_state = s0;
                    Y1 = 0;
                end
            end
            s2: begin
                if (I == 4'b1001) begin
                    current_state = s3;
                    Y1 = 0;
                end else begin
                    current_state = s0;
                    Y1 = 0;
                end
            end
            s3: begin
                if (I == 4'b0100) begin
                    current_state = s4;
                    Y1 = 1;
                end else begin
                    current_state = s0;
                    Y1 = 0;
                end
            end
            s4: begin
                if (I == 4'b0001) begin
                    current_state = s1;
                    Y1 = 0;
                end else begin
                    current_state = s0;
                    Y1 = 0;
                end
            end
            default: begin
                current_state = s0;
                Y1 = 0;
            end
        endcase
        Y = Y1;
    end
endmodule