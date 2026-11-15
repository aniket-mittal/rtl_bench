module origen_205132 (
    input        sclk,
    input        rst_n,
    input        init_done,
    input        aref_en,
    output [3:0] aref_cmd,
    output [11:0] aref_addr,
    output       aref_req,
    output       aref_end
);

reg aref_flag;
reg [2:0] cnt_cmd;
reg [15:0] cnt_15ms;

[MASKED]

assign aref_cmd = (cnt_cmd == 3'b001) ? 4'b0010 :  // PRE
                  (cnt_cmd == 3'b100) ? 4'b0001 :  // AREF
                  4'b0000;  // NOP

assign aref_addr = 12'b0;
assign aref_req = (cnt_15ms == 16'h3D09);
assign aref_end = (cnt_cmd == 3'b111);

endmodule