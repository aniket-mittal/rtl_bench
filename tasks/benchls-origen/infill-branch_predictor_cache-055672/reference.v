module origen_055672 (
    input wire clk,
    input wire rst,
    input wire [31:0] pc,
    input wire br,
    input wire isPCjmp,
    input wire jtype,
    input wire [31:0] pce,
    input wire [31:0] PCjmp,
    output reg [31:0] PCN,
    output reg fail
);

    reg [59:0] cache [0:7];  // 8 entries: 1-bit valid, 32-bit value, 27-bit tag
    wire [2:0] index = pc[4:2];
    wire [2:0] index2 = pce[4:2];
    wire [26:0] tag = pc[31:5];
    wire [26:0] tag2 = pce[31:5];

    wire hit = cache[index][59] && (cache[index][58:32] == tag);
    wire hitted = cache[index2][59] && (cache[index2][58:32] == tag2);

    always @(*) begin
        fail = jtype || (isPCjmp && !hit) || (br && !isPCjmp && hitted);

        if (jtype)
            PCN = PCjmp;
        else if (isPCjmp && !hit)
            PCN = PCjmp;
        else if (br && !isPCjmp && hitted)
            PCN = pce + 4;
        else if (hit)
            PCN = cache[index][31:0];
        else
            PCN = pc + 4;
    end

    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 8; i = i + 1) begin
                cache[i][59] <= 1'b0;  // Clear valid bits
            end
        end else begin
            if (isPCjmp && !hit) begin
                cache[index] <= {1'b1, tag, PCjmp};  // Update cache entry
            end else if (br && !isPCjmp && hitted) begin
                cache[index2][59] <= 1'b0;  // Invalidate cache entry
            end
        end
    end

endmodule