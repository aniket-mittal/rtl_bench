module origen_191478(
    input clk,
    input in,
    input reset,
    output reg z
);

reg [4:0] state;

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        state <= 5'bzzzzz;
    end
    else begin
        case (state)
            5'bzzzzz: begin
                if (in) begin
                    state <= 5'bzzzzz;
                    z <= 0;
                end
                else begin
                    state <= 5'bzzzz0;
                    z <= 0;
                end
            end
            5'bzzzz0: begin
                if (in) begin
                    state <= 5'bzzz01;
                    z <= 0;
                end
                else begin
                    state <= 5'bzzz00;
                    z <= 0;
                end
            end
            5'bzzz00: begin
                if (in) begin
                    state <= 5'bzz001;
                    z <= 0;
                end
                else begin
                    state <= 5'bzzzzz;
                    z <= 0;
                end
            end
            5'bzz001: begin
                if (in) begin
                    state <= 5'bzzzzz;
                    z <= 0;
                end
                else begin
                    state <= 5'bz0010;
                    z <= 1;
                end
            end
            5'bz0010: begin
                if (in) begin
                    state <= 5'bzzz01;
                    z <= 0;
                end
                else begin
                    state <= 5'bz0100;
                    z <= 0;
                end
            end
            5'bzzz01: begin
                if (in) begin
                    state <= 5'bzzzzz;
                    z <= 0;
                end
                else begin
                    state <= 5'bzz010;
                    z <= 0;
                end
            end
            5'bzz010: begin
                if (in) begin
                    state <= 5'bzzz01;
                    z <= 0;
                end
                else begin
                    state <= 5'bz0100;
                    z <= 0;
                end
            end
            5'bz0100: begin
                if (in) begin
                    state <= 5'bzz001;
                    z <= 0;
                end
                else begin
                    state <= 5'b01000;
                    z <= 1;
                end
            end
            5'b01000: begin
                if (in) begin
                    state <= 5'bzz001;
                    z <= 0;
                end
                else begin
                    state <= 5'bzzz00;
                    z <= 0;
                end
            end
            default: begin
                state <= 5'bzzzzz;
                z <= 0;
            end
        endcase
    end
end

endmodule