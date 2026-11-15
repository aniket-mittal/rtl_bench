module origen_126300 (
    input wire clk,
    input wire rst,
    input wire [3:0] A,
    input wire [3:0] B,
    output reg [7:0] result
);

    // Pipeline registers
    reg [3:0] multiplicand_reg;
    reg [2:0] multiplier_reg;
    reg [7:0] partial_product;
    reg [2:0] counter;

    // Intermediate signals
    wire [4:0] extended_multiplicand;
    wire [4:0] neg_extended_multiplicand;

    // Sign extension
    assign extended_multiplicand = {A[3], A};
    assign neg_extended_multiplicand = -extended_multiplicand;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            multiplicand_reg <= 4'b0;
            multiplier_reg <= 3'b0;
            partial_product <= 8'b0;
            counter <= 3'b0;
            result <= 8'b0;
        end else begin
            // Stage 1: Load inputs
            multiplicand_reg <= A;
            multiplier_reg <= B[2:0];

            // Stage 2: Booth's algorithm
            case ({multiplier_reg[1:0], 1'b0})
                3'b000, 3'b111: partial_product <= partial_product;
                3'b001, 3'b010: partial_product <= partial_product + {extended_multiplicand, 3'b0};
                3'b101, 3'b110: partial_product <= partial_product + {neg_extended_multiplicand, 3'b0};
                3'b011: partial_product <= partial_product + {extended_multiplicand, 3'b0} + {extended_multiplicand, 2'b0};
                3'b100: partial_product <= partial_product + {neg_extended_multiplicand, 3'b0} + {neg_extended_multiplicand, 2'b0};
            endcase

            // Stage 3: Shift and count
            multiplier_reg <= {1'b0, multiplier_reg[2:1]};
            partial_product <= {partial_product[7], partial_product[7:1]};
            counter <= counter + 1;

            // Stage 4: Output result
            if (counter == 3'b011) begin
                result <= partial_product;
                counter <= 3'b0;
                partial_product <= 8'b0;
            end
        end
    end

endmodule