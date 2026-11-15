module origen_148637(
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    input wire sel_mux1,
    input wire sel_mux2,
    input wire [7:0] num1,
    input wire [7:0] num2,
    input wire [7:0] num3,
    input wire [7:0] num4,
    output wire [7:0] final_out
);

    wire [7:0] module1_out, module2_out, mux2_out;

    // Module 1: 8 D flip-flops with 2-to-1 mux
    module1 m1(
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .sel(sel_mux1),
        .data_out(module1_out)
    );

    // Module 2: Minimum of 4 numbers
    module2 m2(
        .num1(num1),
        .num2(num2),
        .num3(num3),
        .num4(num4),
        .min_out(module2_out)
    );

    // 2-to-1 multiplexer
    assign mux2_out = sel_mux2 ? module2_out : module1_out;

    // Functional module to find minimum
    min_module mm(
        .in1(module1_out),
        .in2(module2_out),
        .min_out(final_out)
    );

endmodule

module module1(
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    input wire sel,
    output reg [7:0] data_out
);

    reg [7:0] ff [7:0];
    wire [7:0] mux_out;

    assign mux_out = sel ? ff[7] : data_in;

    always @(negedge clk or posedge rst) begin
        if (rst) begin
            integer i;
            for (i = 0; i < 8; i = i + 1) begin
                ff[i] <= 8'b0;
            end
        end else begin
            ff[0] <= mux_out;
            ff[1] <= ff[0];
            ff[2] <= ff[1];
            ff[3] <= ff[2];
            ff[4] <= ff[3];
            ff[5] <= ff[4];
            ff[6] <= ff[5];
            ff[7] <= ff[6];
        end
    end

    assign data_out = ff[7];

endmodule

module module2(
    input wire [7:0] num1,
    input wire [7:0] num2,
    input wire [7:0] num3,
    input wire [7:0] num4,
    output wire [7:0] min_out
);

    wire [3:0] priority_code;

    // Priority encoder
    assign priority_code[3] = (num1 <= num2) && (num1 <= num3) && (num1 <= num4);
    assign priority_code[2] = !priority_code[3] && (num2 <= num3) && (num2 <= num4);
    assign priority_code[1] = !priority_code[3] && !priority_code[2] && (num3 <= num4);
    assign priority_code[0] = !priority_code[3] && !priority_code[2] && !priority_code[1];

    // Convert priority code to minimum value
    assign min_out = priority_code[3] ? num1 :
                     priority_code[2] ? num2 :
                     priority_code[1] ? num3 : num4;

endmodule

module min_module(
    input wire [7:0] in1,
    input wire [7:0] in2,
    output wire [7:0] min_out
);

    assign min_out = (in1 <= in2) ? in1 : in2;

endmodule