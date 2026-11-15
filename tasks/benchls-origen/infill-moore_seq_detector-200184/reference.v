module origen_200184(
    input clk,
    input reset,
    input ain,
    output reg [3:0] count,
    output reg yout,
    output reg [1:0] state,
    output reg [1:0] nextstate
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= 2'b00;
        count <= 4'b0000;
    end
    else begin
        state <= nextstate;
        count <= count + ain;
    end
end

always @(*) begin
    case (state)
        2'b00: begin // S0
            yout = ~ain;
            if (ain) nextstate = 2'b01;
            else nextstate = 2'b00;
        end
        2'b01: begin // S1
            yout = 1'b0;
            if (ain) nextstate = 2'b10;
            else nextstate = 2'b01;
        end
        2'b10: begin // S2
            yout = 1'b0;
            if (ain) nextstate = 2'b11;
            else nextstate = 2'b10;
        end
        2'b11: begin // S3
            yout = ain;
            if (ain) nextstate = 2'b01;
            else nextstate = 2'b11;
        end
        default: begin
            yout = 1'b0;
            nextstate = 2'b00;
        end
    endcase
end

endmodule