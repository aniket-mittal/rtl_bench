module rtlpp_09063 (
    clk,
    ir_in,
    sr,
    vs_udr,
    vs_uir,
    jdo,
    take_action_break_a,
    take_action_break_b,
    take_action_break_c,
    take_action_ocimem_a,
    take_action_ocimem_b,
    take_action_tracectrl,
    take_action_tracemem_a,
    take_action_tracemem_b,
    take_no_action_break_a,
    take_no_action_break_b,
    take_no_action_break_c,
    take_no_action_ocimem_a,
    take_no_action_tracemem_a
);

output [37:0] jdo;
output reg take_action_break_a;
output reg take_action_break_b;
output reg take_action_break_c;
output reg take_action_ocimem_a;
output reg take_action_ocimem_b;
output reg take_action_tracectrl;
output reg take_action_tracemem_a;
output reg take_action_tracemem_b;
output reg take_no_action_break_a;
output reg take_no_action_break_b;
output reg take_no_action_break_c;
output reg take_no_action_ocimem_a;
output reg take_no_action_tracemem_a;
input clk;
input [1:0] ir_in;
input [37:0] sr;
input vs_udr;
input vs_uir;

reg enable_action_strobe;
reg [1:0] ir;
reg [37:0] jdo;
reg jxuir;
reg sync2_udr;
reg sync2_uir;
wire sync_udr;
wire sync_uir;
reg update_jdo_strobe;

reg sync_udr_ff1, sync_udr_ff2;
reg sync_uir_ff1, sync_uir_ff2;

always @(posedge clk) begin
    sync_udr_ff1 <= vs_udr;
    sync_udr_ff2 <= sync_udr_ff1;
    sync2_udr <= sync_udr_ff2;
    update_jdo_strobe <= sync_udr_ff2 & ~sync2_udr;
    enable_action_strobe <= update_jdo_strobe;
    
    sync_uir_ff1 <= vs_uir;
    sync_uir_ff2 <= sync_uir_ff1;
    sync2_uir <= sync_uir_ff2;
    jxuir <= sync_uir_ff2 & ~sync2_uir;
end

always @(posedge clk) begin
    if (jxuir)
        ir <= ir_in;
    if (update_jdo_strobe)
        jdo <= sr;
end

always @(enable_action_strobe or ir or jdo) begin
    take_action_ocimem_a = enable_action_strobe && (ir == 2'b00) && ~jdo[35] && jdo[34];
    take_no_action_ocimem_a = enable_action_strobe && (ir == 2'b00) && ~jdo[35] && ~jdo[34];
    take_action_ocimem_b = enable_action_strobe && (ir == 2'b00) && jdo[35];
    take_action_tracemem_a = enable_action_strobe && (ir == 2'b01) && ~jdo[37] && jdo[36];
    take_no_action_tracemem_a = enable_action_strobe && (ir == 2'b01) && ~jdo[37] && ~jdo[36];
    take_action_tracemem_b = enable_action_strobe && (ir == 2'b01) && jdo[37];
    take_action_break_a = enable_action_strobe && (ir == 2'b10) && ~jdo[36] && jdo[37];
    take_no_action_break_a = enable_action_strobe && (ir == 2'b10) && ~jdo[36] && ~jdo[37];
    take_action_break_b = enable_action_strobe && (ir == 2'b10) && jdo[36] && ~jdo[35] && jdo[37];
    take_no_action_break_b = enable_action_strobe && (ir == 2'b10) && jdo[36] && ~jdo[35] && ~jdo[37];
    take_action_break_c = enable_action_strobe && (ir == 2'b10) && jdo[36] && jdo[35] && jdo[37];
    take_no_action_break_c = enable_action_strobe && (ir == 2'b10) && jdo[36] && jdo[35] && ~jdo[37];
    take_action_tracectrl = enable_action_strobe && (ir == 2'b11) && jdo[15];
end

endmodule