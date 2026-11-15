module origen_138752 (
    input wire clk,
    input wire reset,
    input wire [3:0] module1_out,
    input wire [3:0] module2_out,
    output wire [15:0] final_output
);

    wire [15:0] bcd_counter_out;
    wire [3:0] functional_out;

    bcd_counter bcd_counter_inst (
        .clk(clk),
        .reset(reset),
        .q(bcd_counter_out)
    );

    functional_module func_mod (
        .bcd_ones(bcd_counter_out[3:0]),
        .module1_out(module1_out),
        .module2_out(module2_out),
        .result(functional_out)
    );

    assign final_output = {bcd_counter_out[15:4], functional_out};

endmodule

module bcd_counter (
    input wire clk,
    input wire reset,
    output reg [15:0] q
);

    wire [3:0] gray_ones, gray_tens, gray_hundreds, gray_thousands;
    wire enable_tens, enable_hundreds, enable_thousands;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 16'b0;
        end else begin
            q[3:0] <= gray_to_bcd(gray_ones);
            if (enable_tens) q[7:4] <= gray_to_bcd(gray_tens);
            if (enable_hundreds) q[11:8] <= gray_to_bcd(gray_hundreds);
            if (enable_thousands) q[15:12] <= gray_to_bcd(gray_thousands);
        end
    end

    assign enable_tens = (q[3:0] == 4'd9);
    assign enable_hundreds = (q[7:4] == 4'd9) && enable_tens;
    assign enable_thousands = (q[11:8] == 4'd9) && enable_hundreds;

    gray_counter gray_ones_counter (
        .clk(clk),
        .reset(reset),
        .q(gray_ones)
    );

    gray_counter gray_tens_counter (
        .clk(clk),
        .reset(reset),
        .enable(enable_tens),
        .q(gray_tens)
    );

    gray_counter gray_hundreds_counter (
        .clk(clk),
        .reset(reset),
        .enable(enable_hundreds),
        .q(gray_hundreds)
    );

    gray_counter gray_thousands_counter (
        .clk(clk),
        .reset(reset),
        .enable(enable_thousands),
        .q(gray_thousands)
    );

    function [3:0] gray_to_bcd;
        input [3:0] gray;
        begin
            gray_to_bcd[3] = gray[3];
            gray_to_bcd[2] = gray[3] ^ gray[2];
            gray_to_bcd[1] = gray[3] ^ gray[2] ^ gray[1];
            gray_to_bcd[0] = gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
        end
    endfunction

endmodule

module gray_counter (
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [3:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 4'b0;
        end else if (enable) begin
            q[3] <= q[3] ^ q[2];
            q[2] <= q[2] ^ q[1];
            q[1] <= q[1] ^ q[0];
            q[0] <= ~q[0];
        end
    end

endmodule

module functional_module (
    input wire [3:0] bcd_ones,
    input wire [3:0] module1_out,
    input wire [3:0] module2_out,
    output reg [3:0] result
);

    always @(*) begin
        result = bcd_ones + module1_out - module2_out;
        if (result > 4'd9) result = result - 4'd10;
    end

endmodule