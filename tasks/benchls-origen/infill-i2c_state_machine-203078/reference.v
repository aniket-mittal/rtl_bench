module origen_203078(
    input reset,
    input sda,
    input scl,
    output reg [64:0] out
);

reg [3:0] state;
reg [3:0] nextState;

always @(posedge scl or posedge reset) begin
    if (reset) begin
        state <= 4'b0001;
    end
    else begin
        state <= nextState;
    end
end

always @(*) begin
    case (state)
        4'b0001: begin
            if (sda == 1'b0) begin
                nextState = 4'b0010;
            end
            else begin
                nextState = 4'b0001;
            end
        end
        4'b0010: begin
            if (sda == 1'b0) begin
                nextState = 4'b0011;
            end
            else begin
                nextState = 4'b0001;
            end
        end
        4'b0011: begin
            if (sda == 1'b0) begin
                nextState = 4'b0100;
            end
            else begin
                nextState = 4'b0001;
            end
        end
        4'b0100: begin
            if (sda == 1'b0) begin
                nextState = 4'b0101;
            end
            else begin
                nextState = 4'b0001;
            end
        end
        4'b0101: begin
            if (sda == 1'b0) begin
                nextState = 4'b0110;
            end
            else begin
                nextState = 4'b0001;
            end
        end
        4'b0110: begin
            if (sda == 1'b0) begin
                nextState = 4'b0111;
            end
            else begin
                nextState = 4'b0001;
            end
        end
        4'b0111: begin
            if (sda == 1'b0) begin
                nextState = 4'b1000;
            end
            else begin
                nextState = 4'b0001;
            end
        end
        4'b1000: begin
            if (sda == 1'b0) begin
                nextState = 4'b1001;
            end
            else begin
                nextState = 4'b0001;
            end
        end
        4'b1001: begin
            nextState = 4'b0001;
        end
        default: begin
            nextState = 4'b0001;
        end
    endcase
end

always @(*) begin
    case (state)
        4'b0001: out = 65'b0000000000000000000000000000000000000000000000000000000000000001;
        4'b0010: out = 65'b0000000000000000000000000000000000000000000000000000000000000010;
        4'b0011: out = 65'b0000000000000000000000000000000000000000000000000000000000000011;
        4'b0100: out = 65'b0000000000000000000000000000000000000000000000000000000000000100;
        4'b0101: out = 65'b0000000000000000000000000000000000000000000000000000000000000101;
        4'b0110: out = 65'b0000000000000000000000000000000000000000000000000000000000000110;
        4'b0111: out = 65'b0000000000000000000000000000000000000000000000000000000000000111;
        4'b1000: out = 65'b0000000000000000000000000000000000000000000000000000000000001000;
        4'b1001: out = 65'b0000000000000000000000000000000000000000000000000000000000001001;
        default: out = 65'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    endcase
end

endmodule