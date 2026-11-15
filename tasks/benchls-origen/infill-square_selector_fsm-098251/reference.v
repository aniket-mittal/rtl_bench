module origen_098251 (
    input wire clk,
    input wire reset,
    input wire up,
    input wire down,
    input wire select,
    output reg [3:0] count,
    output reg [8:0] square
);

reg lock;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'd5;
        square <= 9'b0;
        lock <= 1'b0;
    end else begin
        if (select) begin
            count <= 4'd5;
            if (!lock) begin
                case (count)
                    4'd1: square <= 9'b000000001;
                    4'd2: square <= 9'b000000010;
                    4'd3: square <= 9'b000000100;
                    4'd4: square <= 9'b000001000;
                    4'd5: square <= 9'b000010000;
                    4'd6: square <= 9'b000100000;
                    4'd7: square <= 9'b001000000;
                    4'd8: square <= 9'b010000000;
                    4'd9: square <= 9'b100000000;
                    default: square <= 9'b0;
                endcase
            end
        end else if (up && !lock && count < 4'd9) begin
            count <= count + 1'b1;
            square <= 9'b0;
        end else if (down && !lock && count > 4'd1) begin
            count <= count - 1'b1;
            square <= 9'b0;
        end else begin
            square <= 9'b0;
        end

        if (up || down || select) begin
            lock <= 1'b1;
        end else begin
            lock <= 1'b0;
        end
    end
end

endmodule