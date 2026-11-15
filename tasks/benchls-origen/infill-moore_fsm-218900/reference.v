module origen_218900(
    input E,
    input W,
    input clk,
    input reset,
    output reg out
);

reg [1:0] State;
reg z;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        State <= 2'b00;
        z <= 1'b0;
    end
    else begin
        case (State)
            2'b00: // S0
                begin
                    z <= 1'b1;
                    if (~E & W)
                        State <= 2'b01;
                    else if (E & W)
                        State <= 2'b10;
                    else if (E & ~W)
                        State <= 2'b11;
                end
            2'b01: // S1
                begin
                    z <= 1'b0;
                    if (E)
                        State <= 2'b10;
                end
            2'b10: // S2
                begin
                    z <= 1'b0;
                    if (~E & ~W)
                        State <= 2'b00;
                end
            2'b11: // S3
                begin
                    z <= 1'b0;
                    if (~W)
                        State <= 2'b10;
                end
        endcase
    end
end

assign out = z;

endmodule