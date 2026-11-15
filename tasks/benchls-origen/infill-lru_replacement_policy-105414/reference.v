module origen_105414 #(
    parameter SET_ASSOC = 4
) (
    input wire clk,
    input wire rst,
    input wire [SET_ASSOC-1:0] access,
    input wire update,
    output reg [1:0] lru
);

generate
    if (SET_ASSOC == 2) begin : gen_2way
        reg state;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                state <= 1'b0;
            end else if (update) begin
                state <= access[0];
            end
        end

        always @(*) begin
            lru = {1'b0, state};
        end
    end else if (SET_ASSOC == 4) begin : gen_4way
        reg [2:0] state;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                state <= 3'b000;
            end else if (update) begin
                case (access)
                    4'b0001: state <= {2'b11, state[0]};
                    4'b0010: state <= {2'b10, state[0]};
                    4'b0100: state <= {state[2], 1'b1, 1'b1};
                    4'b1000: state <= {state[2], 1'b0, 1'b1};
                    default: state <= state;
                endcase
            end
        end

        always @(*) begin
            case (state)
                3'b000, 3'b001, 3'b010, 3'b100: lru = 2'b00;
                3'b011, 3'b110: lru = 2'b01;
                3'b101: lru = 2'b10;
                3'b111: lru = 2'b11;
            endcase
        end
    end
endgenerate

endmodule