module origen_012504 (
    input wire clk,
    input wire ren,
    input wire wen,
    input wire [5:0] raddr,
    input wire [5:0] waddr,
    input wire [6:0] a,
    input wire [6:0] b,
    output reg [7:0] q
);

    reg [7:0] ram [63:0];
    reg [6:0] a_st0, a_st1, b_st0, b_st1;
    reg [5:0] waddr_st0, waddr_st1;
    reg wen_st0, wen_st1;
    reg [7:0] AplusB, q_int;

    // Pipeline stage 1
    always @(posedge clk) begin
        a_st0 <= a;
        b_st0 <= b;
        waddr_st0 <= waddr;
        wen_st0 <= wen;
    end

    // Pipeline stage 2
    always @(posedge clk) begin
        a_st1 <= a_st0;
        b_st1 <= b_st0;
        waddr_st1 <= waddr_st0;
        wen_st1 <= wen_st0;
        AplusB <= a_st0 + b_st0;
    end

    // RAM write operation
    always @(posedge clk) begin
        if (wen_st1) begin
            ram[waddr_st1] <= AplusB;
        end
    end

    // RAM read operation (asynchronous)
    always @(*) begin
        if (ren) begin
            q_int = ram[raddr];
        end else begin
            q_int = 8'b0;
        end
    end

    // Output register
    always @(posedge clk) begin
        q <= q_int;
    end

endmodule