module origen_017407 (
    input wire clk,
    input wire rst_n,
    input wire j_en,
    input wire bgtz_en,
    input wire PCSrc,
    input wire [17:0] offset,
    output reg [31:0] pc
);

    // State encoding
    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] state, next_state;

    // State transition logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // PC update logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pc <= 32'b0;
        end else if (PCSrc) begin
            if (j_en) begin
                if (offset[17]) // Negative offset
                    pc[31:14] <= pc[31:14] - {14'b0, ~offset + 1'b1};
                else // Positive offset
                    pc[31:14] <= pc[31:14] + {14'b0, offset};
            end else if (bgtz_en) begin
                if (offset[17]) // Negative offset
                    pc <= pc - {{14{offset[17]}}, offset};
                else // Positive offset
                    pc <= pc + {{14{offset[17]}}, offset};
            end
        end else if (state == S1) begin
            pc <= pc + 32'd4;
        end
    end

endmodule