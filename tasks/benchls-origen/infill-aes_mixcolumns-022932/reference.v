module origen_022932 (
    input wire i_clock,
    input wire [127:0] i_data,
    input wire i_active,
    output wire [127:0] o_data
);

reg [127:0] r_data;

function [7:0] gm2;
    input [7:0] op;
    begin
        gm2 = {op[6:0], 1'b0} ^ (8'h1b & {8{op[7]}});
    end
endfunction

function [7:0] gm3;
    input [7:0] op;
    begin
        gm3 = gm2(op) ^ op;
    end
endfunction

function [31:0] mixw;
    input [31:0] w;
    reg [7:0] b0, b1, b2, b3;
    begin
        b0 = w[31:24];
        b1 = w[23:16];
        b2 = w[15:8];
        b3 = w[7:0];
        mixw[31:24] = gm2(b0) ^ gm3(b1) ^ b2 ^ b3;
        mixw[23:16] = b0 ^ gm2(b1) ^ gm3(b2) ^ b3;
        mixw[15:8]  = b0 ^ b1 ^ gm2(b2) ^ gm3(b3);
        mixw[7:0]   = gm3(b0) ^ b1 ^ b2 ^ gm2(b3);
    end
endfunction

function [127:0] mixcolumns;
    input [127:0] data;
    begin
        mixcolumns[127:96] = mixw(data[127:96]);
        mixcolumns[95:64]  = mixw(data[95:64]);
        mixcolumns[63:32]  = mixw(data[63:32]);
        mixcolumns[31:0]   = mixw(data[31:0]);
    end
endfunction

always @(posedge i_clock) begin
    if (i_active) begin
        r_data <= mixcolumns(i_data);
    end
end

assign o_data = r_data;

endmodule