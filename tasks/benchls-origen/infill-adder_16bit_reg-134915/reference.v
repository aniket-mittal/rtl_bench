module origen_134915 (
    input wire clk,
    input wire rst,
    input wire [15:0] a,
    input wire [15:0] b,
    input wire cin,
    output reg [15:0] sum,
    output reg cout
);

    wire [7:0] sum_low, sum_high;
    wire cout_low, cout_high;
    wire [15:0] final_sum;
    wire final_cout;

    // Instantiate two 8-bit adder modules
    adder_8bit adder_low (
        .clk(clk),
        .rst(rst),
        .a(a[7:0]),
        .b(b[7:0]),
        .cin(cin),
        .sum(sum_low),
        .cout(cout_low)
    );

    adder_8bit adder_high (
        .clk(clk),
        .rst(rst),
        .a(a[15:8]),
        .b(b[15:8]),
        .cin(cout_low),
        .sum(sum_high),
        .cout(cout_high)
    );

    // Instantiate combinational module
    comb_adder comb_adder_inst (
        .sum_low(sum_low),
        .sum_high(sum_high),
        .cout_low(cout_low),
        .cout_high(cout_high),
        .final_sum(final_sum),
        .final_cout(final_cout)
    );

    // Register outputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 16'b0;
            cout <= 1'b0;
        end else begin
            sum <= final_sum;
            cout <= final_cout;
        end
    end

endmodule

module adder_8bit (
    input wire clk,
    input wire rst,
    input wire [7:0] a,
    input wire [7:0] b,
    input wire cin,
    output reg [7:0] sum,
    output reg cout
);

    wire [7:0] sum_temp;
    wire cout_temp;

    assign {cout_temp, sum_temp} = a + b + cin;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 8'b0;
            cout <= 1'b0;
        end else begin
            sum <= sum_temp;
            cout <= cout_temp;
        end
    end

endmodule

module comb_adder (
    input wire [7:0] sum_low,
    input wire [7:0] sum_high,
    input wire cout_low,
    input wire cout_high,
    output wire [15:0] final_sum,
    output wire final_cout
);

    wire [8:0] sum_high_extended;
    wire [8:0] sum_low_extended;
    wire [8:0] temp_sum;

    assign sum_high_extended = {cout_low, sum_high};
    assign sum_low_extended = {1'b0, sum_low};

    assign temp_sum = sum_high_extended + sum_low_extended;
    assign final_sum = {temp_sum[7:0], sum_low};
    assign final_cout = temp_sum[8] | cout_high;

endmodule