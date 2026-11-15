module origen_077218(
    input wire clk,
    input wire reset,
    input wire ena,
    output reg pm,
    output wire [7:0] hh,
    output wire [7:0] mm,
    output wire [7:0] ss
);

    wire [3:0] sec_ones, sec_tens, min_ones, min_tens;
    wire sec_ones_ena, sec_tens_ena, min_ones_ena, min_tens_ena, hours_ena;

    // Seconds ones
    cnt #(4'h0, 4'h9) cnt_sec_ones (
        .clk(clk),
        .reset(reset),
        .ena(ena),
        .q(sec_ones),
        .overflow(sec_ones_ena)
    );

    // Seconds tens
    cnt #(4'h0, 4'h5) cnt_sec_tens (
        .clk(clk),
        .reset(reset),
        .ena(sec_ones_ena),
        .q(sec_tens),
        .overflow(sec_tens_ena)
    );

    // Minutes ones
    cnt #(4'h0, 4'h9) cnt_min_ones (
        .clk(clk),
        .reset(reset),
        .ena(sec_tens_ena),
        .q(min_ones),
        .overflow(min_ones_ena)
    );

    // Minutes tens
    cnt #(4'h0, 4'h5) cnt_min_tens (
        .clk(clk),
        .reset(reset),
        .ena(min_ones_ena),
        .q(min_tens),
        .overflow(min_tens_ena)
    );

    // Hours
    cnt_hour cnt_hours (
        .clk(clk),
        .reset(reset),
        .ena(min_tens_ena),
        .q(hh),
        .pm(pm)
    );

    assign ss = {sec_tens, sec_ones};
    assign mm = {min_tens, min_ones};

endmodule

module cnt #(
    parameter START = 4'h0,
    parameter END = 4'h9
)(
    input wire clk,
    input wire reset,
    input wire ena,
    output reg [3:0] q,
    output wire overflow
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= START;
        else if (ena) begin
            if (q == END)
                q <= START;
            else
                q <= q + 1'b1;
        end
    end

    assign overflow = (q == END) & ena;

endmodule

module cnt_hour(
    input wire clk,
    input wire reset,
    input wire ena,
    output reg [7:0] q,
    output reg pm
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 8'h12;
            pm <= 1'b0;
        end else if (ena) begin
            if (q == 8'h12)
                q <= 8'h01;
            else if (q[3:0] == 4'h9)
                q <= {q[7:4] + 1'b1, 4'h0};
            else
                q <= {q[7:4], q[3:0] + 1'b1};

            if (q == 8'h11)
                pm <= ~pm;
        end
    end

endmodule