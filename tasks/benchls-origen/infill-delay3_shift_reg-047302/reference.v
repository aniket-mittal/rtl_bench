module origen_047302 (
    input wire clk,
    input wire a,
    output reg d
);
    reg b, c;

    always @(posedge clk) begin
        d = c;
        c = b;
        b = a;
    end
endmodule

module delay3_incorrect (
    input wire clk,
    input wire a,
    output reg d
);
    reg b, c;

    always @(posedge clk) begin
        b = a;
        c = b;
        d = c;
    end
endmodule

module delay3_1 (
    input wire clk,
    input wire a,
    output reg d
);
    reg b, c;

    always @(posedge clk) begin
        d <= c;
        c <= b;
        b <= a;
    end
endmodule

module delay3_2 (
    input wire clk,
    input wire a,
    output reg d
);
    reg b, c;

    always @(posedge clk) begin
        b <= a;
        c <= b;
        d <= c;
    end
endmodule