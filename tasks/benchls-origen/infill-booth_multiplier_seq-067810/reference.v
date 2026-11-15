module origen_067810 (
    input wire clk,
    input wire start,
    input wire signed [7:0] a,
    input wire signed [7:0] b,
    output reg signed [15:0] r,
    output reg done
);

    reg [1:0] state;
    reg [7:0] abs_a, abs_b;
    reg sign;
    reg [15:0] product;
    reg [1:0] cycle_count;

    localparam IDLE = 2'b00;
    localparam COMPUTING = 2'b01;

    always @(posedge clk) begin
        case (state)
            IDLE: begin
                if (start) begin
                    state <= COMPUTING;
                    abs_a <= (a[7]) ? -a : a;
                    abs_b <= (b[7]) ? -b : b;
                    sign <= a[7] ^ b[7];
                    cycle_count <= 2'b00;
                    done <= 1'b0;
                end
                else begin
                    r <= 'bX;
                    done <= 1'b0;
                end
            end

            COMPUTING: begin
                if (cycle_count == 2'b00) begin
                    product <= abs_a * abs_b;
                    cycle_count <= cycle_count + 1;
                end
                else if (cycle_count == 2'b01) begin
                    r <= (sign) ? -product : product;
                    cycle_count <= cycle_count + 1;
                end
                else begin
                    done <= 1'b1;
                    state <= IDLE;
                end
            end

            default: state <= IDLE;
        endcase
    end

endmodule