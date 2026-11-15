module origen_031179 (
    input wire [7:0] A, B,
    input wire [2:0] op,
    input wire clk, reset_n, start,
    output wire done,
    output wire [15:0] result
);

    reg [15:0] result_next;
    wire [15:0] result_aax, result_mul;
    wire done_aax, done_mul;

    always @(*) begin
        case (op)
            3'b001: result_next = {8'b0, A + B};
            3'b010: result_next = {8'b0, A & B};
            3'b011: result_next = {8'b0, A ^ B};
            3'b100: result_next = A * B;
            default: result_next = 16'b0;
        endcase
    end

    delay_aax delay_aax_inst (
        .clk(clk),
        .reset_n(reset_n),
        .start(start),
        .op(op),
        .result_in(result_next),
        .done(done_aax),
        .result_out(result_aax)
    );

    delay_mul delay_mul_inst (
        .clk(clk),
        .reset_n(reset_n),
        .start(start),
        .op(op),
        .result_in(result_next),
        .done(done_mul),
        .result_out(result_mul)
    );

    assign done = done_aax | done_mul;
    assign result = result_aax | result_mul;

endmodule

module delay_aax (
    input wire clk, reset_n, start,
    input wire [2:0] op,
    input wire [15:0] result_in,
    output reg done,
    output reg [15:0] result_out
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            done <= 1'b0;
            result_out <= 16'b0;
        end else if (start && (op[2:1] == 2'b00)) begin
            done <= 1'b1;
            result_out <= result_in;
        end else begin
            done <= 1'b0;
            result_out <= 16'b0;
        end
    end

endmodule

module delay_mul (
    input wire clk, reset_n, start,
    input wire [2:0] op,
    input wire [15:0] result_in,
    output reg done,
    output reg [15:0] result_out
);

    reg [1:0] count;
    reg [15:0] result_reg;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            done <= 1'b0;
            result_out <= 16'b0;
            count <= 2'b00;
            result_reg <= 16'b0;
        end else if (start && (op == 3'b100)) begin
            if (count == 2'b10) begin
                done <= 1'b1;
                result_out <= result_reg;
                count <= 2'b00;
            end else begin
                done <= 1'b0;
                result_out <= 16'b0;
                count <= count + 1'b1;
                result_reg <= result_in;
            end
        end else begin
            done <= 1'b0;
            result_out <= 16'b0;
            count <= 2'b00;
            result_reg <= 16'b0;
        end
    end

endmodule