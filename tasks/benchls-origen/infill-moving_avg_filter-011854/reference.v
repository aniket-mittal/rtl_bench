module origen_011854(
    input wire [7:0] X,
    input wire clk,
    input wire reset,
    output reg [9:0] Y
);

    reg [71:0] data;
    reg [11:0] c_sum;
    wire [7:0] avg, appr;
    wire [12:0] out;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data <= 72'b0;
            c_sum <= 12'b0;
        end else begin
            data <= {data[63:0], X};
            c_sum <= c_sum - data[71:64] + X;
        end
    end

    assign avg = c_sum / 9;

    Compare comp_inst (
        .in(data),
        .avg_1(avg),
        .out1(appr)
    );

    assign out = (appr * 9 + c_sum) / 8;
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            Y <= 10'b0;
        else
            Y <= out[9:0];
    end

endmodule

module Compare(
    input wire [71:0] in,
    input wire [7:0] avg_1,
    output reg [7:0] out1
);

    integer i;
    reg [7:0] closest;

    always @(*) begin
        closest = 8'b0;
        for (i = 0; i < 9; i = i + 1) begin
            if (in[i*8 +: 8] <= avg_1 && in[i*8 +: 8] > closest) begin
                closest = in[i*8 +: 8];
            end
        end
        out1 = closest;
    end

endmodule